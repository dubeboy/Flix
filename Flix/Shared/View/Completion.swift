//
//  Completion.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

/// A Completion clousure - That take one generic paramenter and dons't return.
/// In the case that you don't want it to take any parameters  in other words ,
/// you want a clousure that looks like this:`() -> Void`,
/// you can pass () as the generic paramanter
typealias Completion<T> = (T) -> Void
