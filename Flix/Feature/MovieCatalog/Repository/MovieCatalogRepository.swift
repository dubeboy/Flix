//
//  MovieCatalogRepository.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

protocol MovieCatalogRepository {
    func getMovies(result: @escaping NetworkResponseCompletion<[Movie]>)
}

class MovieCatalogRepositoryImpl: MovieCatalogRepository {
    
    @SingletonServiceInstance
    var service: FlixNetworkService
    
    func getMovies(result: @escaping NetworkResponseCompletion<[Movie]>) {
        service.$getUpcomingMovies { response in
            Logger.log("The encoded struct response is: ")
            Logger.i(response)
            switch response {
                case .success(let succesfullResponse):
                    result(.success(succesfullResponse.body.results ?? []))
                case .failure(let error):
                    Logger.i(error)
                    result(.failure(error))
            }
        }
    }
}
