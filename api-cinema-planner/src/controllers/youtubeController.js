const { accessSecret } = require("../utils/gcp");
const axios = require("axios");

const youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3";

exports.searchTrailers = async (req, res) => {
    const youtube_api_key = await accessSecret(process.env.YOU_TUBE_API_KEY);
    const response = await axios(`${youtubeBaseURL}/search?q=${req.query.query}&key=${youtube_api_key}`)
    const searchResults = await response.data;
  
    res.json(searchResults)
}
