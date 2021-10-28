//
//  MovieCatalogCoordinator.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

protocol MovieCatalogCoordinator: AnyObject {
    func startMovieCatalogViewController()
}

extension MainCoordinator: MovieCatalogCoordinator {
    func startMovieCatalogViewController()  {
        navigationController.delegate = self
        let viewController = MovieCatalogViewController()
        viewController.coordinator = self
        viewController.viewModel = MovieCatalogViewModelImpl()
        navigationController.pushViewController(viewController, animated: true)
    }
}



