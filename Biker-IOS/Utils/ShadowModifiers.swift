//
//  ShadowModifiers.swift
//  Biker-IOS
//
//  Created by PC on 27/04/2024.
//

import SwiftUI



struct DropShadowViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color._323B4F.shadow(.drop(color: Color._252B39, radius: 10, x: 4, y: 4)))
            .foregroundStyle(Color._323B4F.shadow(.drop(color: Color._38445A, radius: 10, x: -4, y: -4)))
    }
}

struct InnerShadowViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color._323B4F.shadow(.inner(color: Color._252B39, radius: 8, x: 4, y: 4)))
            .foregroundStyle(Color._323B4F.shadow(.inner(color: Color._202633, radius: 8, x: -4, y: -4)))
    }
}

