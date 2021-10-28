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
        static let radius: CGFloat = 10
        static let borderWidth: CGFloat = k2
    }
    
    // MARK: - App assets
    enum Assets {
        
        enum MovieCatalog {
            static let icon: UIImage? = getSystemAsset(systemName: "arrow.up")
           
        }
        
        private static func getSystemAsset(systemName: String) -> UIImage? {
            if #available(iOS 13, *) {
                let image = UIImage(systemName: systemName)
                if image == nil {
                    Logger.log("\(#function) image is nil")
                }
                return image
            } else {
                let image = UIImage(named: systemName)
                if image == nil {
                    Logger.log("\(#function): image is nil")
                }
                return image
            }
        }
        
    }
        
    enum Color {
        
        fileprivate enum AppThemeColors {
            case grayItem
            case background
            case widget
            case button
            case label
            case link
        }
        
        enum MovieCatalog {
            static let commentBox = lightGray
            static let trackColor = Color.actionButtonColor
            static let trackBackGroundColor = lightGray
            static let textColor = linkColor
            static let warningMaximumTextLength = UIColor.systemYellow
            static let alertMaximumTextLength = UIColor.systemRed
        }
      
    }
    
    private static func getColor(color: Color.AppThemeColors) -> UIColor {
        switch color {
            case .grayItem:
                if  #available(iOS 13.0, *) {
                    return UIColor.systemGray6
                } else {
                    return UIColor.lightGray
                }
            case .background:
                if  #available(iOS 13.0, *) {
                    return UIColor.systemGray5
                } else {
                    return UIColor.gray
                }
            case .widget:
                if  #available(iOS 13.0, *) {
                    return UIColor.systemBackground
                } else {
                    return UIColor.white
                }
            case .button:
                return UIColor(named: "blueActionButton")!
            case .label:
                if  #available(iOS 13.0, *) {
                    return UIColor.label
                } else {
                    return UIColor.lightText
                }
            case .link:
                if  #available(iOS 13.0, *) {
                    return UIColor.link
                } else {
                    return UIColor.blue
                }
        }
    }
}
