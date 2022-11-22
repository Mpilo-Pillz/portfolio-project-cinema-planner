const express = require("express");
const { getTrendingMovies, getTrendingTvShows } = require("../controllers/tmdbController");

const router = express.Router();

router.route("/getTrendingMovies").get(getTrendingMovies);
router.route("/getTrendingTVShows").get(getTrendingTvShows);

module.exports = router;