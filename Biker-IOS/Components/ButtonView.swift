//
//  ButtonView.swift
//  Biker-IOS
//
//  Created by PC on 28/04/2024.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let width: Double
    let height: Double
    let action: () -> Void
    
    init(text: String, width: Double = 160, height: Double = 44, action: @escaping () -> Void) {
        self.text = text
        self.width = width
        self.height = height
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(.white)
                .frame(width: width, height: height)
                .background(LinearGradient(colors: [Color._34C8E8, Color._4E4AF2], startPoint: .topLeading, endPoint: .bottomTrailing))
                .background {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke()
                        .foregroundStyle(LinearGradient(colors: [.white.opacity(0.2), .black.opacity(0.2), .black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    ButtonView(text: "Click me") {
        
    }
}
