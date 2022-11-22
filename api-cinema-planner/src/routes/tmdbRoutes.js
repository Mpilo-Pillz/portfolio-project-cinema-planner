const express = require("express");
const { getTrendingMovies, getTrendingTvShows, getUpcomingMovies, getPopularMovies, getTopRatedMovies, getDiscoverMovies, searchMovies } = require("../controllers/tmdbController");

const router = express.Router();

router.route("/getTrendingMovies").get(getTrendingMovies);
router.route("/getTrendingTVShows").get(getTrendingTvShows);
router.route("/getUpcomingMovies").get(getUpcomingMovies);
router.route("/getPopularMovies").get(getPopularMovies);
router.route("/getTopRatedMovies").get(getTopRatedMovies);
router.route("/getDiscoverMovies").get(getDiscoverMovies);
router.route("/searchMovies").get(searchMovies);

module.exports = router;
