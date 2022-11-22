//
//  Network+Enum.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/21.
//

import Foundation

enum APIError: Error {
    case failedTogetData
}

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}
