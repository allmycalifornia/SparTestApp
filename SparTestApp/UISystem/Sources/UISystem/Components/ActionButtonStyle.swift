//
//  ActionButtonStyle.swift
//  
//
//  Created by Boris on 27.08.2024.
//

import SwiftUI

public struct ActionButtonStyle: ButtonStyle {
    
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 48, height: 36)
            .multilineTextAlignment(.center)
            .background(Color.designColor.button)
            .cornerRadius(40)
    }
}
