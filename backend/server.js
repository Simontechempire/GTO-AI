res.json({
  response: `GTO received: ${message}`
});
const express = require("express");
const cors = require("cors");
require("dotenv").config();

const app = express();

app.use(cors());
app.use(express.json());

app.get("/", (req, res) => {
  res.json({
    name: "GTO AI",
    status: "online",
    version: "1.0.0"
  });
});

app.post("/chat", (req, res) => {
  const { message } = req.body;

  if (!message) {
    return res.status(400).json({
      error: "Message is required"
    });
  }

  res.json({
    response: `GTO received: ${message}`
  });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`GTO AI running on port ${PORT}`);
});
