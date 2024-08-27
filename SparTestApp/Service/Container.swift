//
//  Container.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import Swinject

extension Container {
    
    static let shared = Container()
    
    static var fetchDataService: FetchDataServiceProtocol {
        shared.resolve(FetchDataServiceProtocol.self)!
    }
}

