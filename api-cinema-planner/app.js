const express = require("express");
const cors = require("cors");

const tmdbRouter = require("./src/routes/tmdbRoutes");
const youtubeRouter = require("./src/routes/youtubeRoutes");

const app = express();
app.use(cors());

app.use(express.json());

app.get("/", (req, res) => {
  res.status(200).json({ message: "Mpilz connected" });
});

app.use("/api/v1/tmdb", tmdbRouter);
app.use("/api/v1/youtube", youtubeRouter);

module.exports = app;
