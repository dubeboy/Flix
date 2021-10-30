//
//  ViewController.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/27.
//

import UIKit
import SDWebImage

class MovieCatalogViewController: UICollectionViewController {
    
    // Force unwrap these because they should be injected by the coordinator
    weak var coordinator: MovieCatalogCoordinator!
    var viewModel: MovieCatalogViewModel!
    
    private var spinner = UIActivityIndicatorView(style: .whiteLarge)
   
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        //        flowLayout.sectionInset = UIEdgeInsets
        flowLayout.minimumLineSpacing = Const.View.k8
        flowLayout.minimumInteritemSpacing = Const.View.k8
        flowLayout.scrollDirection = .vertical
        super.init(collectionViewLayout: flowLayout)

    }
    
    // We will not need this constructor because we'll not instatiate this from xibs
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSelf()
        configureSpinner()
        setupCollectionView()
        loadData()
    }
}

// MARK: - Datasources & Delegate

extension MovieCatalogViewController {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        viewModel.moviesCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.deque(MovieCatalogCell.self, at: indexPath)
        configure(cell: cell, at: indexPath)
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movie = viewModel.getMovie(at: indexPath)
//
//    }
    
    private func configure(cell: MovieCatalogCell, at indexPath: IndexPath) {
        guard let url = viewModel.getBackDropUrl(at: indexPath) else {
            return
        }
        cell.imageView.sd_setImage(with: url, placeholderImage: Const.Assets.placeHolderImage)

    }
}


// MARK: - Private functions

extension MovieCatalogViewController {
    // Its okay for some UIKit logic or setup to stay here because its view related, the last thing we want is to be passing our UIKit views to the viewModel
    private func setupCollectionView() {

        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            Logger.log("Failed to type cast the collection view layout: \(collectionView.collectionViewLayout)")
            return
        }
        flowLayout.sectionInset = UIEdgeInsets(top: Const.View.k16, left: Const.View.k16, bottom: Const.View.k16, right: Const.View.k16)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = Const.Color.backgroundColor
        
        let leftRightInset = flowLayout.sectionInset.right + flowLayout.sectionInset.left + (2 * flowLayout.minimumInteritemSpacing)
        let itemWidth: CGFloat = (view.bounds.width - leftRightInset) / 3.0 // Didn't use UIScreen.main.bounds here because in split screens it gives us the split screens size not the window size
        
        let itemSize = CGSize(width: itemWidth, height: 210)
        flowLayout.itemSize = itemSize
        collectionView.registerClass(MovieCatalogCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func configureSpinner() {
        spinner.autoresizingOff()
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor --> view.centerXAnchor
        spinner.centerYAnchor --> view.centerYAnchor
    }
    
    private func stopSpinner() {
        spinner.stopAnimating()
    }
    
    private func configureNavigationTitleView() {
        let image = UIImageView(image:Const.Assets.appIcon)
        image.contentMode = .scaleAspectFit
        navigationItem.titleView =  image
    }
    
    
    private func loadData() {
        viewModel.getUpComingMovies { [weak self] in // This behaves like a clousure that doesn't have any arguments dont need to add the _
            guard let self = self else { return }
            self.stopSpinner()
            self.collectionView.reloadData()
        } error: { errorString in
            self.stopSpinner()
            self.presentToast(message: errorString)
        }
    }
    
    private func configureSelf() {
        tabBarItem = UITabBarItem(title: viewModel.title, image: Const.Assets.MovieCatalog.icon, tag: 90)
        tabBarController?.tabBar.isTranslucent = false
        tabBarController?.tabBar.barTintColor = .black
//        tabBarController?.tabBar.isHidden = true
        configureNavigationTitleView()
    }

}

