const youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3"

exports.searchTrailers = async (req, res) => {
    const response = await fetch(`${youtubeBaseURL}/search?q=${req.query.query}&key=${process.env.YOU_TUBE_API_KEY}`)
    const searchResults = await response.json();
  
    res.json(searchResults)
}
