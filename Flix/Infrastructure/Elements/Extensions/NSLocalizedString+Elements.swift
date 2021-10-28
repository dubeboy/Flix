//
//  StringLocalized.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

extension String {
    var localized: Self {
        get {
            NSLocalizedString(self, comment: "")
        }
    }
}
