const express = require("express");
const cors = require("cors");

const tmdbRouter = require("./src/routes/tmdbRoutes");

const app = express();
app.use(cors());

app.use(express.json());

app.get("/", (req, res) => {
  res.status(200).json({ message: "Mpilz connected" });
});

app.use("/api/v1/tmdb", tmdbRouter);

module.exports = app;
