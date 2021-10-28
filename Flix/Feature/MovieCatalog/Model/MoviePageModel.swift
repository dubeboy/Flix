//
//  MoviePageModel.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

// MARK: - Movie
struct MoviePageModel: Codable {
    // Make everything nullable to avoid possible returned null values
    // crashing our app and that Codable doesn't try and decode a null
    // to a non nullable Type
    //
    // Most of these will never be null as specified in the schema but
    // but its okay to not trust the backend 😅
    var page: Int?
    var results: [Movie]?
    var dates: Dates?
    var totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, results, dates
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    var maximum, minimum: String?
}
