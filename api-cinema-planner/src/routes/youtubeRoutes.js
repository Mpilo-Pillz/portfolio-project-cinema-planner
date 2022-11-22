const express = require("express");

const { searchTrailers } = require("../controllers/youtubeController");

const router = express.Router();

router.route("/searchTrailers").get(searchTrailers);

module.exports = router;