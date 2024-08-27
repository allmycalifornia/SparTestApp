//
//  QuantitySelectorView.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import SwiftUI
import UISystem

struct QuantitySelectorView: View {
    
    @Binding private var selectedAmount: Double
    @Binding private var selectedUnit: ItemUnit
    
    private let itemAmounts: [ItemUnit]
    private let basePrice: Double
    private let onPlusClick: @MainActor () -> Void
    private let onMinusClick: @MainActor () -> Void
    private let onUnitChange: @MainActor () -> Void
    
    init(selectedAmount: Binding<Double>,
         selectedUnit: Binding<ItemUnit>,
         itemAmounts: [ItemUnit],
         basePrice: Double,
         onPlusClick: @MainActor @escaping () -> Void,
         onMinusClick: @MainActor @escaping () -> Void,
         onUnitChange: @MainActor @escaping () -> Void) {
        self._selectedAmount = selectedAmount
        self._selectedUnit = selectedUnit
        self.itemAmounts = itemAmounts
        self.basePrice = basePrice
        self.onPlusClick = onPlusClick
        self.onMinusClick = onMinusClick
        self.onUnitChange = onUnitChange
        
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.black)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.designColor.unitSelector)], for: .normal)
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Picker("", selection: $selectedUnit) {
                ForEach(itemAmounts, id: \.self) { unit in
                    Text(unit.rawValue.lowercased()).tag(unit)
                }
            }
            .frame(maxWidth: .infinity)
            .pickerStyle(SegmentedPickerStyle())
            
            HStack(alignment: .center) {
                Button(action: {
                    updateAmount(increment: -addingCount * selectedUnit.addingCoefficient)
                    onMinusClick()
                }) {
                    Image(systemName: "minus")
                        .foregroundColor(.white).bold()
                }
                .padding(.horizontal, 8)
                
                VStack(alignment: .center, spacing: 0) {
                    Text(String(format: selectedUnit.priceCoefficient == 1.0 ? "%.1f %@" : "%.0f %@", selectedAmount, selectedUnit.rawValue))
                        .font(.priceCents())
                        .foregroundColor(.white).bold()
                    
                    Text("~\(String(format: "%.2f", basePrice * selectedAmount * selectedUnit.priceCoefficient).appending(UI.Strings.currency))")
                        .font(.caption)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    updateAmount(increment: addingCount * selectedUnit.addingCoefficient)
                    onPlusClick()
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white).bold()
                }
                .padding(.horizontal, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: 36)
            .background(Color.designColor.button)
            .cornerRadius(40)
            .onChange(of: selectedUnit, perform: { newValue in
                if newValue.addingCoefficient == 1 {
                    selectedAmount = selectedAmount.rounded(.up)
                }
                onUnitChange()
            })
        }
    }
    
    private var addingCount: Double {
        return 1 // Adjust this if needed
    }
    
    private func updateAmount(increment: Double) {
        selectedAmount = max(0, selectedAmount + increment)
    }
}

struct QuantitySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        QuantitySelectorView(selectedAmount: .constant(1.0),
                             selectedUnit: .constant(.kg),
                             itemAmounts: [.kg, .pcs],
                             basePrice: 199.0,
                             onPlusClick: {},
                             onMinusClick: {},
                             onUnitChange: {})
    }
}

