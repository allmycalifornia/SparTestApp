//
//  FetchDataServiceProtocol.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

protocol FetchDataServiceProtocol {
    func fetch() async -> [Item]
}
