//
//  ViewController.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/27.
//

import UIKit

class MovieCatalogViewController: UIViewController {
    
    // Force unwrap these because they should be injected by the coordinator
    weak var coordinator: MovieCatalogCoordinator!
    var viewModel: MovieCatalogViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = App
        title = viewModel.title
        Logger.i("started MovieCatalogViewController")

    }
}

