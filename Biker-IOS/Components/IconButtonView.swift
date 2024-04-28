//
//  IconButtonView.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct IconButtonView: View {
    let icon: String
    let action: () -> Void
    let size: CGFloat
    let radius: CGFloat
    let colors: [Color]
    let disabled: Bool
    
    init(icon: String, size: CGFloat = 44, radius: CGFloat = 10, colors: [Color] = [Color._34C8E8, Color._4E4AF2], disabled: Bool = false, action: @escaping () -> Void) {
        self.icon = icon
        self.size = size
        self.radius = radius
        self.colors = colors
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(icon)
                .frame(width: size, height: size)
                .background(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: radius))
                .background{
                    RoundedRectangle(cornerRadius: radius)
                        .stroke()
                        .foregroundStyle(LinearGradient(colors: [.white.opacity(0.6), .black.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                }
            
        })
        .disabled(disabled)
    }
}

#Preview {
    IconButtonView(icon: Assets.search) {}
}
