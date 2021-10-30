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
    
    // we want this to be a void callback because the view has no intrest in response at tha current time
    func getUpComingMovies(completion: @escaping Completion<()>, error: @escaping Completion<String>)
    func getMovie(at indexPath: IndexPath) -> MovieModel // Named parameter
    func getBackDropUrl(at indexPath: IndexPath) -> URL?
}

class MovieCatalogViewModelImpl: MovieCatalogViewModel {
  
    private var model: MovieCatalogModel = MovieCatalogModel()

    
    var moviesCount: Int {
        model.movies.count
    }
    // We could rename MoviePageModel to MoviePageEntity and then create Model
    // for this ViewModel in which transform Entity to this viewModel
    
    // Since this property is defined protocol a
    let title: String = "moviesCatalogHomeTitle".localized
    
    private let repository: MovieCatalogRepository
    
    // Handrolled dependecey injection ,
    // it will make it easy for us to introduce a dependecy
    // injection framework like swinject in the future and keeping things simple for now
    // This dependency injection will make it easy for us to inject a
    // different implementation of MovieCatalogRepository when testing
    // `repository` default parameter makes the call site (view) easy
    init(_ repository: MovieCatalogRepository = MovieCatalogRepositoryImpl()) {
        self.repository = repository
    }
    
    // The callsite of this function is intresting 😀
    func getUpComingMovies(completion: @escaping Completion<()>, error: @escaping Completion<String>) {
        // We dont have to switch back to the main thread here the the Merchant + Alamofire
        // handles switching back to the thread from which it was called from
        repository.getUpComingMovies { [weak self] response in
            switch response {
                case .success(let moviePageEntity):
                    self?.model = MovieCatalogModel.transform(moviePageEntity)
                    completion(())
                case .failure(let e):
                    error(e.localizedDescription)
            }
        }
    }
    
    func getMovie(at indexPath: IndexPath) -> MovieModel {
        model.movies[indexPath.item]
    }
    
    func getBackDropUrl(at indexPath: IndexPath) -> URL? {
        let movie = getMovie(at: indexPath)
        var components = URLComponents() // Could have also used a normal URl(string: "") because this url is simple enough ie no query
        components.scheme = "https"
        components.host = "image.tmdb.org"
        components.path = "/t/p/w300\(movie.posterPath)"
        Logger.i(components.url?.absoluteString ?? "FAIL URL")
        return components.url
        
    }

}


