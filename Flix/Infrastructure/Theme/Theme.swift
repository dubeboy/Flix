//
//  Theme.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation
import UIKit


enum Const {

    
    enum View {
        static let k24: CGFloat = 24
        static let k16: CGFloat = 16
        static let k8: CGFloat = 8
        static let k12: CGFloat = 12
        static let k1: CGFloat = 1
        static let k2: CGFloat = 2
        static let k4: CGFloat = 4
        static let radius: CGFloat = 5
        static let borderWidth: CGFloat = k2
    }
    
    // MARK: - App assets
    enum Assets {
        //Shared assets
        static let placeHolderImage: UIImage? = getSystemAsset(systemName: "moviePlaceHolder")
        static let appIcon: UIImage? = getSystemAsset(systemName: "netflixLogo")
        
        
        // Assets Unique to this VC
        enum MovieCatalog {
            static let icon: UIImage? = getSystemAsset(systemName: "film")
        }
        
        private static func getSystemAsset(systemName: String) -> UIImage? {
            let image = UIImage(named: systemName)
            if image == nil {
                Logger.log("\(#function): image is nil") // We are logging here because this should never happen in the case that it happens we can investigate it
            }
            return image
        }
        
    }
        
    enum Color {
    
        // The UIColor should never be null but in some random chance that it happens we just return a color close to that color
        // Not ideal but we can force unwrap but an app crashing just because someone accidentally deleted a color, will give use bad reviews
        // we can create a function that'll can get us the color or log when it happens that a color is missing in production and testing as well
        
        static let background = UIColor(named: "backgroundColor") ?? UIColor.black
        static let appName = UIColor(named: "appNameColor") ?? UIColor.red
        static let tabBarIconsTint = UIColor(named: "tabBarTintColor") ?? UIColor.white
        // the variable name doesn't have the suffix color because at call site its obvious that we calling a color by Const.Color.infoBar
        static let infoBar = UIColor(named: "infoBarColor") ?? UIColor.gray

        static let white = UIColor.white
        static let clear = UIColor.clear
    }
    

}
