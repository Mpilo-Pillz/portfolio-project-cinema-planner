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

exports.getUpcomingMovies = async (req, res) => {
  const response = await fetch(`${baseURL}/3/movie/upcoming?api_key=${process.env.API_KEY}&language=en-US&page=1`)
  const upcomingMoviesResponse = await response.json();

  res.json(upcomingMoviesResponse)
}

exports.getPopularMovies = async (req, res) => {
  const response = await fetch(`${baseURL}/3/movie/popular?api_key=${process.env.API_KEY}&language=en-US&page=1`)
  const popularMoviesResponse = await response.json();

  res.json(popularMoviesResponse)
}

exports.getTopRatedMovies = async (req, res) => {
  const response = await fetch(`${baseURL}/3/movie/top_rated?api_key=${process.env.API_KEY}&language=en-US&page=1")`)
  const topRatedMoviesResponse = await response.json();

  res.json(topRatedMoviesResponse)
}

exports.getDiscoverMovies = async (req, res) => {
  const response = await fetch(`${baseURL}/3/discover/movie?api_key=${process.env.API_KEY}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate`)
  const discoverMoviesResponse = await response.json();

  res.json(discoverMoviesResponse)
}

exports.searchMovies = async (req, res) => {
  const response = await fetch(`${baseURL}/3/search/movie?api_key=${process.env.API_KEY}&query=${req.query.query}`)
  const searchResults = await response.json();

  res.json(searchResults)
}
