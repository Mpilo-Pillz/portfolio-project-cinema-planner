//
//  YoutubeSearchResponse.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/22.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoItem]
}

struct VideoItem: Codable {
    let id: IdVideoItem
}

struct IdVideoItem: Codable {
    let kind: String
    let videoId: String
}
