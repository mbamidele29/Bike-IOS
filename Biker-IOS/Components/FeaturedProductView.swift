//
//  BikeView.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct FeaturedProductView: View {
    let product: ProductModel
    var body: some View {
        VStack(alignment: .leading){
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(height: 153)
            Text("\(product.discount, specifier: "%.0f")% off")
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(.horizontal, 17)
        .frame(width: 350, height: 240)
        .background(LinearGradient(colors: [Color._353F54, Color._222834], startPoint: .bottomTrailing, endPoint: .topLeading))
        .clipShape(ProductShape(cornerRadius: 20, topDisplacement: 0, bottomDisplacement: 20))
        .background{
            ProductShape(cornerRadius: 20, topDisplacement: 0, bottomDisplacement: 20)
                .stroke()
                .foregroundStyle(LinearGradient(colors: [.white.opacity(0.2), .black.opacity(0.2), .black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

#Preview {
    FeaturedProductView(product: ProductModel.products.first!)
}
