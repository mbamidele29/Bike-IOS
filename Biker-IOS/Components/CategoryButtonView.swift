//
//  CategoryButtonView.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct CategoryButtonView: View {
    let name: String?
    let icon: String?
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            if icon == nil {
                Text(name ?? "")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.white)
                    .modifier(ButtonModifier(isSelected))
            }else {
                Image(icon ?? "")
                    .renderingMode(.template)
                    .foregroundStyle(.white.opacity(isSelected ? 1 : 0.6))
                    .modifier(ButtonModifier(isSelected))
            }
        }

    }
}

private struct ButtonModifier: ViewModifier {
    let isSelected: Bool
    
    init(_ isSelected: Bool) {
        self.isSelected = isSelected
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background{
                if isSelected {
                    LinearGradient(colors: [Color._34C8E8, Color._4E4AF2], startPoint: .topLeading, endPoint: .bottomTrailing)
                } else {
                    LinearGradient(colors: [Color._353F54, Color._222834], startPoint: .topLeading, endPoint: .bottomTrailing)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .foregroundStyle(LinearGradient(colors: [.white.opacity(0.2), .black.opacity(0.2), .black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
    }
}

#Preview {
    CategoryButtonView(name: nil, icon: Assets.charge, isSelected: true) {}
}
