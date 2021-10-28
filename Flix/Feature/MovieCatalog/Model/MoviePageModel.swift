// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// Generated this file from the JSON Scheema of the TMD: https://developers.themoviedb.org/3/movies/get-upcoming

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

// MARK: - Result
struct Movie: Codable {
    var posterPath: String?
    var adult: Bool?
    var overview, releaseDate: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalTitle, originalLanguage, title: String?
    var backdropPath: String?
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
}
