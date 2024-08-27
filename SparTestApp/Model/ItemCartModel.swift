//
//  ItemCartModel.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import Foundation

struct ItemCart: Identifiable {
    let id: UUID
    let name: String
    let priceWithDiscount: Double
    let image: String
    private(set) var selectedAmount: SelectedAmount
    
    var formattedPrice: String {
        return String(format: "%.2f", priceWithDiscount)
    }
}

struct SelectedAmount {
    let count: Double
    let unit: ItemUnit
}
