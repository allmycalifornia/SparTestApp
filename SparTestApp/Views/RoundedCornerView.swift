//
//  RoundedCornerView.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let uiPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        path.addPath(Path(uiPath.cgPath))
        return path
    }
}

