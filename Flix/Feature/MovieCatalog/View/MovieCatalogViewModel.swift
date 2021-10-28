//
//  MovieCatalogViewModel.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

protocol MovieCatalogViewModel {
    // We have two callbacks to the view
    // The completion with the upcoming movies escaping because the callback is async
    // The completion with error with a simple string that can be displayed on the screen
    //
    // We used two completion because we want the view to be a dumb and as linear as possible(not many if statments)
    func getUpComingMovies(completion: @escaping Completion<[Movie]>, error: @escaping Completion<String>)
}


