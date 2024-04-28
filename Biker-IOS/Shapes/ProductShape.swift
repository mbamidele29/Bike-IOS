//
//  ProductShape.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct ProductShape: Shape {
    let cornerRadius: CGFloat
    let topDisplacement: CGFloat
    let bottomDisplacement: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: cornerRadius, y: topDisplacement))
        path.addQuadCurve(to: CGPoint(x: 0, y: topDisplacement+cornerRadius), control: CGPoint(x: 0, y: topDisplacement))
        path.addLine(to: CGPoint(x: 0, y: Double(rect.maxY) - cornerRadius))
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: rect.maxY), control: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - bottomDisplacement))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomDisplacement - cornerRadius), control: CGPoint(x: rect.maxX, y: rect.maxY - bottomDisplacement))
        path.addLine(to: CGPoint(x: rect.maxX, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: rect.maxX-cornerRadius, y: 0), control: CGPoint(x: rect.maxX, y: 0))
        path.closeSubpath()
                
        return path
    }
}
