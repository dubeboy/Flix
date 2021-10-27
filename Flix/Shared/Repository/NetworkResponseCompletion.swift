//
//  NetworkResponseCompletion.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

typealias NetworkResponseCompletion<T> = (Result<T, Error>) -> Void
