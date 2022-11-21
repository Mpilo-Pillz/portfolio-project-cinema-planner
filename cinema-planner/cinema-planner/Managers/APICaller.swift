//
//  APICaller.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/21.
//

import Foundation

struct Constants {
    static let API_KEY = ""
    static let baseURL = "https://api.themoviedb.org"
    static let trendingMovieRequest = "trending/movie/day"
    static let trendingTVRequest = "trending/tv/day"
    static let upcomingMovies = "movie/upcoming"
    static let popular = "movie/popular"
    static let topRated = "movie/top_rated"
    static let pagination = "language=en-US&page=1"
    static let discoverMoviesRequest = "discover/movie"
}



class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/\(Constants.trendingMovieRequest)?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/\(Constants.trendingTVRequest)?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/\(Constants.upcomingMovies)?api_key=\(Constants.API_KEY)&\(Constants.pagination)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url))  { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/3/\(Constants.popular)?api_key=\(Constants.API_KEY)&\(Constants.pagination)") else
            {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                } catch {
                    completion(.failure(APIError.failedTogetData))
                }
            }
            task.resume()
        }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/3/\(Constants.topRated)?api_key=\(Constants.API_KEY)&\(Constants.pagination)") else
            {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                } catch {
    
                    completion(.failure(APIError.failedTogetData))
                }
            }
            task.resume()
        }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/3/\(Constants.discoverMoviesRequest)?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else
            {return}
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))

                } catch {

                    completion(.failure(APIError.failedTogetData))
                }
            }
            task.resume()
            
        }
    
}




