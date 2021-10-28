//
//  FlixService.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation
import Merchant

struct FlixNetworkService: Service {
    var baseURL: String = ""
    var query = ["api_key" : "1b5b100291ca41efa1d85ad150587d86", "langauge": "en-US"]
    
    @GET("https://api.themoviedb.org/3/movie/upcoming")
    var getUpcomingMovies: MoviePageEntity
}

/// We maintain a static reference to our service
@propertyWrapper
struct SingletonServiceInstance {
    
    @Autowired
    static var service: FlixNetworkService
    
    var wrappedValue: FlixNetworkService {
        Self.service
    }
}
