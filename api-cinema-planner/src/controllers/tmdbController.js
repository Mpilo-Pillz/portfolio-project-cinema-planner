require("dotenv").config();

const baseURL = "https://api.themoviedb.org";

exports.getTrendingMovies = async (req, res) => {
  const response = await fetch(
    `${baseURL}/3/trending/movie/day?api_key=${process.env.API_KEY}`
  );
  const trendingMovies = await response.json();
  res.json(trendingMovies);
};

exports.getTrendingTvShows = async (req, res) => {
  const response = await fetch(
    `${baseURL}/3/trending/tv/day?api_key=${process.env.API_KEY}`
  );
  const trendingTvShows = await response.json();
  res.json(trendingTvShows);
};
