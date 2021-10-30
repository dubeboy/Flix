//
//  MovieCatalogModel.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/29.
//

import Foundation

//
// This is the most perfect form of MVVM. we can instead use the MovieEntity in our ViewModel
// instead of
// creating a new Model class so to enable us to go be little bit faster.

// But creating a model allows us to transform the data that comes from the
// server to formats that are easy to display, like transformaing dates to readable strings and
// we can convert our nullable entity types to non nullables
//
// We can also remove some fields that arent needed by this view and its viewModel or add some
// state that is directly related to the to view, like scroll position
//

struct MovieModel {
    
    var posterPath: String
    var overview: String
    var id: Int
    var originalTitle: String
    var title: String
    var realeaseDate: String
    var backdropPath: String
    var voteCount: Int
    var video: Bool
    var voteAverage: Double = 0
    
    static func transform(_ entity: MovieEntity) -> Self {
        MovieModel(posterPath: entity.posterPath ?? "",
                   overview: entity.overview ?? "",
                   id: entity.id ?? -1,
                   originalTitle: entity.originalTitle ?? "",
                   title: entity.title ?? "",
                   // A bit contravavasial , but DateFormatter is expensive, and we are creating it twice here ,
                   // so its best that we do this operation once here, its also data transformation as well
                   // everytime when we deque a cell
                   realeaseDate: entity.releaseDate == nil ? "" : Date.fromString(string:  entity.releaseDate!).relativeDate(),
                   backdropPath: entity.backdropPath ?? "",
                   voteCount: entity.voteCount ?? 0,
                   video: entity.video ?? false,
                   voteAverage: entity.voteAverage ?? 0) // having 0 as default value is okay we can just display it or we simply dont display 0 values, removing the complexity from our viewmodel
        
    }
    
}

struct MovieCatalogModel {
    
    // We try and avoid nil as much as possible, set default values
    // swift will generate a constructor for all the possible ways that this class can be constructed with optional paramenters
    
    
    var page: Int = 0
    var totalPage: Int = 0
    var movies: [MovieModel] = []
    
    static func transform(_ entity: MoviePageEntity) -> Self {
        MovieCatalogModel(page: entity.page ?? -1,
                            totalPage: entity.totalPages ?? 0,
                            movies: entity.results?.map(MovieModel.transform(_:)) ?? [])
    }
}
