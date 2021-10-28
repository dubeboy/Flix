//
//  MovieCatalogViewModel.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

protocol MovieCatalogViewModel {
    var title: String { get }
    var moviesCount: Int { get }
    
    
    // We have two callbacks to the view
    // The completion with the upcoming movies escaping because the callback is async
    // The completion with error with a simple string that can be displayed on the screen
    //
    // We used two completion because we want the view to be a dumb and as linear as possible(not many if statments)
    func getUpComingMovies(completion: @escaping Completion<[MovieEntity]>, error: @escaping Completion<String>)
    
}

class MovieCatalogViewModelImpl: MovieCatalogViewModel {
    
    var moviesCount: Int
    // We could rename MoviePageModel to MoviePageEntity and then create Model
    // for this ViewModel in which transform Entity to this viewModel
    var movieResult: [MoviePageEntity]
    
    // Since this property is defined protocol a
    let title: String = "moviesCatalogHomeTitle".localized
    
    private let repository: MovieCatalogRepository
    
    // Handrolled dependecey injection ,
    // it will make it easy for us to introduce a dependecy
    // injection library like swinject in the future and keeping things simple for now
    // This dependency injection will make it easy for us to inject a
    // different implementation of MovieCatalogRepository when testing
    // `repository` default parameter makes the call site (view) easy
    init(_ repository: MovieCatalogRepository = MovieCatalogRepositoryImpl()) {
        self.repository = repository
    }
    
    func getUpComingMovies(completion: @escaping Completion<[MovieEntity]>, error: @escaping Completion<String>) {
        repository.getUpComingMovies { response in
            switch response {
                case .success(let movies):
                    Logger.i(movies)
                case .failure(let error):
                    Logger.i(error)
            }
        }
    }
}


