// server.js (Node.js backend API)
const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const app = express();

const users = [];  // A simple in-memory array to hold users (use a database in production)
const secretKey = 'your-secret-key';

app.use(express.json());

// Sign-up route (register a new user)
app.post('/signup', async (req, res) => {
  const { username, email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  users.push({ username, email, password: hashedPassword });
  res.status(201).json({ message: 'User registered successfully' });
});

// Login route (user login and JWT generation)
app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = users.find((user) => user.email === email);
  
  if (!user) {
    return res.status(400).json({ message: 'User not found' });
  }

  const isPasswordValid = await bcrypt.compare(password, user.password);
  
  if (isPasswordValid) {
    const token = jwt.sign({ userId: user.email }, secretKey, { expiresIn: '1h' });
    res.json({ token });
  } else {
    res.status(400).json({ message: 'Invalid password' });
  }
});

// Start the server
app.listen(3000, () => console.log('Server is running on port 3000'));
