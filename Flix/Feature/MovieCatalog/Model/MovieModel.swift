// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// Generated this file from the JSON Scheema of the TMD: https://developers.themoviedb.org/3/movies/get-upcoming

import Foundation

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
