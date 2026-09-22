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
    message: "GTO backend is running 🚀"
  });
});

app.post("/chat", async (req, res) => {
  try {
    const { message } = req.body;

    if (!message) {
      return res.status(400).json({
        error: "Message is required"
      });
    }

    // AI API connection will be added here.

    res.json({
      response: "GTO received your message: " + message
    });

  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: "GTO AI server error"
    });
  }
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`GTO AI server running on port ${PORT}`);
});
