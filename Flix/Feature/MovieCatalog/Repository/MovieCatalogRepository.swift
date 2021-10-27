//
//  MovieCatalogRepository.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

protocol MovieCatalogRepository {
    func getMovies(result: @escaping NetworkResponseCompletion<Movie>)
}

class MovieCatalogRepositoryImpl: MovieCatalogRepository {
    func getMovies(result: @escaping NetworkResponseCompletion<Movie>) {
        
    }
}
