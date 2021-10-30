//
//  StringLocalized.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

extension String {
    
    /// Gets and returns the localized string give that self is the key
    var localized: Self {
        get {
            NSLocalizedString(self, comment: "")
        }
    }
}
