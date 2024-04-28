//
//  ProductDetailView.swift
//  Biker-IOS
//
//  Created by PC on 27/04/2024.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductModel
    @State var isBottomSheetVisible = true
    @EnvironmentObject var viewModel: BikeViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    BackButtonView()
                    Spacer()
                    Text(product.name.uppercased())
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal, 20)
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 393, height: 289)
                    .offset(y: isBottomSheetVisible ? 0 : 150)
                Spacer()
                
            }
            .background{
                Color._242C3B
                    .ignoresSafeArea()
                LinearGradient(colors: [Color._37B6E9, Color._4B4CED], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask {
                        BackgroundShape()
                            .frame(width: .infinity, height: .infinity)
                    }
                    .offset(x: 80)
            }
            ProductDetailBottomSheet(product: product, viewModel: viewModel) {isBottomSheetVisible in
                self.isBottomSheetVisible = isBottomSheetVisible
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ProductDetailView(product: ProductModel.products.first!)
        .environmentObject(BikeViewModel())
}
