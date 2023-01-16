//
//  MovieData.swift
//  Movie Review
//
//  Created by Globeways Technologies on 13/01/23.
//

import Foundation

struct MovieData: Codable {
    
    var rating: Float64!
    var id: Int64!
    var revenue: Int64!
    var releaseDate: String!
    var director: DirectorData!
    var posterUrl: String!
    var cast: [CastData]!
    var runtime: Int!
    var title: String!
    var overview: String!
    var reviews: Int
    var budget: Int64
    var language: String!
    var genres: [String]!
    var bookmark: Bool!
   
}
