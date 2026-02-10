/**
 * Vercel Serverless Function: Waitlist Signup Handler
 * Sends form submissions to ClickUp as tasks
 */

export default async function handler(req, res) {
  // Set CORS headers
  res.setHeader('Access-Control-Allow-Credentials', true);
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader(
    'Access-Control-Allow-Headers',
    'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
  );

  // Handle preflight request
  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  // Only allow POST
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    const { firstName, lastName, email, phone } = req.body;

    // Validate required fields
    if (!firstName || !lastName || !email) {
      return res.status(400).json({
        error: 'Missing required fields',
        required: ['firstName', 'lastName', 'email']
      });
    }

    // Validate email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({ error: 'Invalid email format' });
    }

    // Get ClickUp credentials from environment
    const CLICKUP_API_TOKEN = process.env.CLICKUP_API_TOKEN;
    const CLICKUP_LIST_ID = process.env.CLICKUP_LIST_ID;

    if (!CLICKUP_API_TOKEN || !CLICKUP_LIST_ID) {
      console.error('Missing ClickUp environment variables');
      return res.status(500).json({ error: 'Server configuration error' });
    }

    // Create task name and description
    const taskName = `${firstName} ${lastName} - Waitlist Signup`;
    const taskDescription = `**Email:** ${email}\n**Phone:** ${phone || 'Not provided'}\n\n**Source:** CHEKKD Website Waitlist\n**Signup Date:** ${new Date().toISOString()}`;

    // Create ClickUp task
    const clickupResponse = await fetch(
      `https://api.clickup.com/api/v2/list/${CLICKUP_LIST_ID}/task`,
      {
        method: 'POST',
        headers: {
          'Authorization': CLICKUP_API_TOKEN,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name: taskName,
          description: taskDescription,
          tags: ['chekkd_waitlist'],
          status: 'new',
        }),
      }
    );

    if (!clickupResponse.ok) {
      const errorData = await clickupResponse.text();
      console.error('ClickUp API Error:', errorData);
      return res.status(500).json({
        error: 'Failed to create task in ClickUp',
        details: errorData
      });
    }

    const clickupData = await clickupResponse.json();

    // Track successful signup with Google Analytics
    return res.status(200).json({
      success: true,
      message: 'Successfully joined the waitlist',
      taskId: clickupData.id,
    });

  } catch (error) {
    console.error('Waitlist signup error:', error);
    return res.status(500).json({
      error: 'Internal server error',
      message: error.message
    });
  }
}
