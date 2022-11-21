//
//  Video.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/21.
//

import Foundation
import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let vote_count: Int
    let vote_average: Double
    
}
