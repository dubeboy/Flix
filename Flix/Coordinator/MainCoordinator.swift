//
//  MainCoordinator.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/27.
//

import Foundation
import UIKit

// AnyObject to constraint this to classes so that we can do reference equality (===), see function #childDidFinish
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start() -> Self
    func pop()
    func dismiss()
}

open class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var tabBarController: UITabBarController?
    
    init(_ tabBarController: UITabBarController? = nil,
         navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.tabBarController = tabBarController
        super.init()
        self.navigationController.delegate = self
    }
    
    /// Default Implementation does nothing
    func start() -> Self {
        self
    }
    
    func childDidFinish(child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    open func navigationController(_ navigationController: UINavigationController,
                                   didShow viewController: UIViewController,
                                   animated: Bool) {
        // means we are pushing a view Controller
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        // this means that we already have the view on the stack probably
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // means we are poping view Controller
        
        childDidFinish(child: fromViewController as? Coordinator) // how do we make the poped to view controller do some action // might also pass the delegate!
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
