//
//  MovieCatalogRepository.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation
import Merchant

protocol MovieCatalogRepository {
    func getUpComingMovies(at page: Int, result: @escaping NetworkResponseCompletion<MoviePageEntity>)
}

// Merges all the datasources, might we want to get the data from the cache, then make a request
// We removed the logic from the viewModel so make it a bit liner and so that it stricly deals with events that are comming from the view
class MovieCatalogRepositoryImpl: MovieCatalogRepository {
    
    // TODO: Make this testable
    @SingletonServiceInstance
    private var service: FlixNetworkService
    
    func getUpComingMovies(at page: Int, result: @escaping NetworkResponseCompletion<MoviePageEntity>) {
        
        let params = FlixNetworkService.parameters.merging(["page": page]) { current, _ in
            current
        }
        
        service.$getUpcomingMovies(query: params) { response in
            Logger.log("The encoded struct response is: ")
            Logger.i(response)
            switch response {
                case .success(let succesfullResponse):
                    result(.success(succesfullResponse.body))
                case .failure(let error):
                    Logger.i(error)
                    result(.failure(error))
            }
        }
    }
}
