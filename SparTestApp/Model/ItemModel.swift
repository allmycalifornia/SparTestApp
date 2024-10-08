//
//  ItemModel.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import Foundation
import SwiftUI
import UISystem

struct Item: Identifiable {
    let id: UUID
    let name: String
    let image: String
    let price: Double
    let discount: Double?
    let units: [ItemUnit]
    let ratingNumber: String
    let review: Int?
    let tag: Tag?
    let country: Country?
    
    init(id: UUID = UUID(),
         name: String,
         image: String,
         price: Double,
         discount: Double? = nil,
         units: [ItemUnit],
         ratingNumber: String,
         review: Int? = nil,
         tag: Tag? = nil,
         country: Country? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.discount = discount
        self.units = units
        self.ratingNumber = ratingNumber
        self.review = review
        self.tag = tag
        self.country = country
    }
    
    var priceWithDiscount: Double {
        if let discount {
            return price * (1 - discount)
        } else {
            return price
        }
    }
    
    func reviewString(for number: Int) -> String {
        let cases = [2, 3, 4]
        if number % 10 == 1 && number % 100 != 11 {
            return String(number).appending(" ").appending(UI.Strings.oneReview)
        } else if cases.contains(number % 10) && !(number % 100 >= 12 && number % 100 <= 14) {
            return String(number).appending(" ").appending(UI.Strings.twoReview)
        } else {
            return String(number).appending(" ").appending(UI.Strings.reviews)
        }
    }

    var formattedDiscount: String? {
        guard let discount else { return nil }
        return String(format: "%.2f", discount * 100).replacingOccurrences(of: ".00", with: "").appending("%")
    }
    
    var formattedReview: String? {
        guard let review else { return nil }
        return reviewString(for: review)
    }
}

enum ItemUnit: String {
    case kg = "Кг"
    case pcs = "Шт"
    case liter = "Л"

    var priceCoefficient: Double {
        switch self {
        case .kg: return 1.0
        case .pcs: return 2.5
        case .liter: return 1.0
        }
    }

    var addingCoefficient: Double {
        switch self {
        case .kg: return 0.1
        case .pcs: return 1.0
        case .liter: return 0.1
        }
    }
}

enum Tag {
    case sale
    case new
    case cardPrice
        
    var color: Color {
        switch self {
        case .sale: return Color.designColor.saleTag
        case .new: return Color.designColor.newTag
        case .cardPrice: return Color.designColor.cardPriceTag
        }
    }
    
    var title: String {
        switch self {
        case .sale: return "Удар по ценам"
        case .new: return "Новинка"
        case .cardPrice: return "Цена по карте"
        }
    }
}

enum Country: String {
    case russia = "Россия"
    case japan = "Япония"
    case philippines = "Филиппины"
    
    var flag: String {
        switch self {
        case .russia: return "🇷🇺"
        case .japan: return "🇯🇵"
        case .philippines: return "🇵🇭"
        }
    }
}

