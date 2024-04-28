//
//  TestView.swift
//  Biker-IOS
//
//  Created by PC on 27/04/2024.
//

import SwiftUI

struct TestView: View {
    private let baseColor: Color = .init(red: 232/255, green: 232/255, blue: 232/255)
    
    private let shadowColor: Color = .init(red: 197/255, green: 197/255, blue: 197/255)
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
                .fill(baseColor.gradient.shadow(.drop(color: shadowColor, radius: 8, x: 20, y: 20)))
            .frame(width: 150, height: 150)
            
                RoundedRectangle(cornerRadius: 10)
                    .fill(baseColor.gradient)
                .frame(width: 150, height: 150)
                .shadow(color: shadowColor, radius: 8, x: 20, y: 20)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(baseColor.shadow(.inner(color: shadowColor, radius: 8, x: 20, y: 20)))
                .fill(.red.shadow(.inner(color: shadowColor, radius: 8, x: 20, y: 20)))
                      .frame(width: 150, height: 150)
            
            RoundedRectangle(cornerRadius: 10)
                      .fill(baseColor.gradient)
                      .frame(width: 150, height: 150)
                      
        }

    }
}

#Preview {
    TestView()
}
