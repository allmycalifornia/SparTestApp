//
//  View+Extension.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import SwiftUI
import Foundation

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
