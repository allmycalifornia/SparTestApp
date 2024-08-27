//
//  TagView.swift
//  Spar Online TestApp
//
//  Created by Борис Кравченко on 27.08.2024.
//

import SwiftUI
import UISystem

struct TagView: View {
    
    private let tag: Tag
    
    init(tag: Tag) {
        self.tag = tag
    }
    
    var body: some View {
        Text(tag.title)
            .font(.tagText())
            .foregroundColor(Color.designColor.tagText)
            .padding(.leading, 8)
            .frame(width: 84, height: 16)
            .background(tag.color)
            .cornerRadius(20, corners: [.topLeft, .bottomRight, .topRight])
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: .sale)
    }
}

