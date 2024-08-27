//
//  MockFetchDataService.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import Foundation
import Combine
import SwiftUI
import UISystem

final class MockFetchDataService: FetchDataServiceProtocol {

    func fetch() async -> [Item] {
        let randomDelay = Double(arc4random_uniform(3) + 1)
        try? await Task.sleep(nanoseconds: UInt64(randomDelay * 1_000_000_000))

        return createMockItems()
    }
    
    private func createMockItems() -> [Item] {
        let items = [
            ItemData(name: "сыр Ламбер 500/0 230г",
                     image: "LamberImage",
                     price: 199.0,
                     discount: 0.50,
                     units: [.pcs, .kg],
                     ratingNumber: "4.1",
                     review: 2,
                     tag: .sale,
                     country: .russia),
            
            ItemData(name: "Энергетический Напиток",
                     image: "EnergeticImage",
                     price: 199.0,
                     discount: 0.20,
                     units: [.pcs, .liter],
                     ratingNumber: "4.1",
                     review: 20,
                     tag: .cardPrice,
                     country: .japan),
            
            ItemData(name: "Салат Овощной с Крабовами Палочками",
                     image: "SaladImage",
                     price: 25.0,
                     discount: 0.1,
                     units: [.pcs, .kg],
                     ratingNumber: "4.5",
                     review: 1,
                     tag: .cardPrice,
                     country: .japan),
            
            ItemData(name: "Дорадо Охлажденная Непотрошенная 300-400г",
                     image: "DoradoImage",
                     price: 350.0,
                     discount: 0.25,
                     units: [.pcs, .kg],
                     ratingNumber: "4.9",
                     review: 13,
                     tag: .cardPrice,
                     country: .japan),
            
            ItemData(name: "Ролл Маленькая Япония 216г",
                     image: "SmallJapanImage",
                     price: 560.0,
                     discount: 0.1,
                     units: [.pcs, .kg],
                     ratingNumber: "3.8",
                     review: 19,
                     tag: .new,
                     country: .japan),
            
            ItemData(name: "Огурцы тепличные садово-огородные",
                     image: "CucumbersImage",
                     price: 258.0,
                     discount: nil,
                     units: [.pcs, .kg],
                     ratingNumber: "4.1",
                     review: 1,
                     tag: .cardPrice,
                     country: .russia),
            
            ItemData(name: "Манго Кео",
                     image: "MangoImage",
                     price: 1298.0,
                     discount: 0.45,
                     units: [.pcs, .kg],
                     ratingNumber: "5.0",
                     review: 2,
                     tag: .new,
                     country: .philippines),
            
            ItemData(name: "Макаронные Изделия SPAR Спаггети 450г",
                     image: "SpagettiImage",
                     price: 350.0,
                     discount: 0.25,
                     units: [.pcs, .kg],
                     ratingNumber: "2.4",
                     review: 17,
                     tag: .cardPrice,
                     country: .japan)
        ]

        return items.map { itemData in
            Item(
                name: itemData.name,
                image: itemData.image,
                price: itemData.price,
                discount: itemData.discount != nil && itemData.discount! > 0 ? itemData.discount : nil,
                units: itemData.units,
                ratingNumber: itemData.ratingNumber,
                review: itemData.review,
                tag: itemData.tag,
                country: itemData.country
            )
        }
    }

    private struct ItemData {
        let name: String
        let image: String
        let price: Double
        let discount: Double?
        let units: [ItemUnit]
        let ratingNumber: String
        let review: Int
        let tag: Tag?
        let country: Country?
    }
}

