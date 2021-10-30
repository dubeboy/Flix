//
//  Logger.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

// we can log these errors to our analytics engine our own analytics engine maybe?
// we also dont log to console in prod
enum Logger {
    static func log(_ error: Error) {
        #if DEBUG
            print(error)
        #endif
    }
    
    static func log(_ error: String) {
        #if DEBUG
                print(error)
        #endif
    }
    
    /**
     this outputs to the console and it does not report an error
     */
    static func i(_ info: String) {
        #if DEBUG
                print("🚨 XXX ❌")
                print(info)
                print("❌ XXX 🚨")
        #endif
    }
    
    static func i(_ info: Error) {
        #if DEBUG
                print("❌ XXX 🚨")
                print(info)
                print("❌ XXX 🚨")
        #endif
    }
    
    static func i(_ info: Any) {
        Self.i(String(describing: info))
    }
    
    // WHAT A TERRIBLE FAILURE, inspired by android 😅
    // TODO: NB - Send This to analytics engine
    static func wtf(_ thisShouldNotHappen: String) {
        Self.log(thisShouldNotHappen)
    }
    
}
