// require("dotenv").config();
const axios = require("axios");

const { accessSecret } = require("../utils/gcp");

const baseURL = "https://api.themoviedb.org";

exports.getTrendingMovies = async (req, res) => {
  const tmdb_api_key = await accessSecret(process.env.API_KEY);

  const response = await axios(
    `${baseURL}/3/trending/movie/day?api_key=${tmdb_api_key}`
  );
  console.log(response);
  const trendingMovies = await response.data;

  res.json(trendingMovies);
};

exports.getTrendingTvShows = async (req, res) => {
  const tmdb_api_key = await accessSecret(process.env.API_KEY);
  const response = await axios(
    `${baseURL}/3/trending/tv/day?api_key=${tmdb_api_key}`
  );
  const trendingTvShows = await response.data;

  res.json(trendingTvShows);
};

exports.getUpcomingMovies = async (req, res) => {
  const tmdb_api_key = await accessSecret(process.env.API_KEY);
  const response = await axios(
    `${baseURL}/3/movie/upcoming?api_key=${tmdb_api_key}&language=en-US&page=1`
  );
  const upcomingMoviesResponse = await response.data;

  res.json(upcomingMoviesResponse);
};

exports.getPopularMovies = async (req, res) => {
  const tmdb_api_key = await accessSecret(process.env.API_KEY);
  const response = await axios(
    `${baseURL}/3/movie/popular?api_key=${tmdb_api_key}&language=en-US&page=1`
  );
  // const popularMoviesResponse = await response.json();
  const popularMoviesResponse = await response.data;

  res.json(popularMoviesResponse);
};

exports.getTopRatedMovies = async (req, res) => {
  const tmdb_api_key = await accessSecret(process.env.API_KEY);
  const response = await axios(
    `${baseURL}/3/movie/top_rated?api_key=${tmdb_api_key}&language=en-US&page=1")`
  );
  const topRatedMoviesResponse = await response.data;

  res.json(topRatedMoviesResponse);
};

exports.getDiscoverMovies = async (req, res) => {
  const tmdb_api_key = await accessSecret(process.env.API_KEY);
  const response = await axios(
    `${baseURL}/3/discover/movie?api_key=${tmdb_api_key}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate`
  );
  const discoverMoviesResponse = await response.data;

  res.json(discoverMoviesResponse);
};

exports.searchMovies = async (req, res) => {
  const tmdb_api_key = await accessSecret(process.env.API_KEY);
  const response = await axios(
    `${baseURL}/3/search/movie?api_key=${tmdb_api_key}&query=${req.query.query}`
  );
  const searchResults = await response.data;

  res.json(searchResults);
};
