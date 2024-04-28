//
//  ProductItemView.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct ProductItemView: View {
    let product: ProductModel
    let colors: [Color]
    var body: some View {
        VStack(spacing: 17) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 134, height: 104)
            VStack(alignment: .leading) {
                Text(product.category.rawValue)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.white.opacity(0.6))
                Text(product.name)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                Text("\(product.price, specifier: "%.2f")")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.white.opacity(0.6))
            }
        }
        .frame(height: 241)
        .padding(.horizontal, 18)
        .background(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(ProductShape(cornerRadius: 30, topDisplacement: 20, bottomDisplacement: 20))
        .background{
            ProductShape(cornerRadius: 30, topDisplacement: 20, bottomDisplacement: 20)
                .stroke()
                .foregroundStyle(LinearGradient(colors: [.white.opacity(0.2), .black.opacity(0.2), .black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

#Preview {
    ProductItemView(product: ProductModel.products.first!,colors: [Color._353F54, Color._222834])
}
