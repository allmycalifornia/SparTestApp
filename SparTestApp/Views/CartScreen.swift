//
//  CartScreen.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import SwiftUI
import UISystem

struct CartScreen: View {
    
    @State private var items: [ItemCart]
    
    private var totalSum: Double {
        items.reduce(0) { $0 + ($1.priceWithDiscount * $1.selectedAmount.unit.priceCoefficient * $1.selectedAmount.count) }
    }
    
    init(items: [ItemCart]) {
        _items = State(initialValue: items)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(items) { item in
                    HStack {
                        Text(item.name)
                            .font(.title3)
                            .foregroundColor(Color.designColor.itemName)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 5) {
                            Text(String(format: "%.1f %@", item.selectedAmount.count, item.selectedAmount.unit.rawValue))
                                .font(.priceCents())
                            
                            Text(String(format: "%.2f %@", item.priceWithDiscount * item.selectedAmount.unit.priceCoefficient * item.selectedAmount.count, UI.Strings.currency))
                                .font(.priceBig())
                        }
                    }
                }
            }
            .background(Color.designColor.appBackground)
            .listStyle(.plain)
            
            HStack {
                Text(UI.Strings.total)
                    .font(.priceBig())
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 10)
                
                Spacer()
                
                Text(String(format: "%.2f %@", totalSum, UI.Strings.currency))
                    .font(.priceBig())
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 10)
            }
            .frame(height: 56)
            .background(Color.red)
            .cornerRadius(30)
            .padding(.horizontal, 10)
        }
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen(items: [
            .init(id: UUID(),
                  name: "Салат овощной с крабовыми палочками",
                  priceWithDiscount: 1.0,
                  image: "FirstItemImage",
                  selectedAmount: .init(count: 1.5, unit: .kg))
        ])
    }
}

