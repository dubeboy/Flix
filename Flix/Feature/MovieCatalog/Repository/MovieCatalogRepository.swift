//
//  MovieCatalogRepository.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

protocol MovieCatalogRepository {
    func getUpComingMovies(result: @escaping NetworkResponseCompletion<[MovieEntity]>)
}

// Merges all the datasources, might we want to get the data from the cache, then make a request
// We removed the logic from the viewModel so make it a bit liner and so that it stricly deals with events that are comming from the view
class MovieCatalogRepositoryImpl: MovieCatalogRepository {
    
    // TODO: Make this testable
    @SingletonServiceInstance
    private var service: FlixNetworkService
    
    func getUpComingMovies(result: @escaping NetworkResponseCompletion<[MovieEntity]>) {
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
