//
//  MainCoordinator.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/27.
//

import Foundation
import UIKit


// Any object because we want this to be instance of a class that can be shared
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func start() -> Self
    func pop()
    func dismiss()
}

// Default implementation of start and pop make them option for for the implementers
// Could added these to to the abstract class as well
extension Coordinator {
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}

/*
  This Abstract Coordinator class thats the base of all coordinators
 */
open class AbstractCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
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
        // means we are pushing a new view Controller
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            Logger.i("Pushing a new view controller #navigationController")

            return
            
        }
        
        // this means that we already have the view on the stack , so this means we are poping the view controller
        if navigationController.viewControllers.contains(fromViewController) {
            Logger.i("Poping viewController in  #navigationController")
            return
        }
        
        // means we are poping view Controller
        Logger.i("Dont know what i'm doing #navigationController")
        childDidFinish(child: fromViewController as? Coordinator)
    }
}

// Create Main Cordinators for each tab

// The main screen

class MainCoordinator: AbstractCoordinator {
    
}


