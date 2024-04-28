//
//  DashboardView.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct DashboardView: View {
    let onViewChanged: (_ hideTabBar: Bool) -> Void
    @EnvironmentObject var viewModel: BikeViewModel
    
    init(onViewChanged: @escaping (_ hideTabBar: Bool) -> Void){
        self.onViewChanged = onViewChanged
        UINavigationBar.appearance().scrollEdgeAppearance = .none
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 23) {
                    Spacer()
                        .frame(height: 24)
                   FeaturedProductView(product: ProductModel.products.first!)
                    
                    CategoriesView()
                    
                    LazyVGrid(columns: [GridItem(.fixed(165)), GridItem(.fixed(165))],
                              alignment: .center,
                              spacing: 0) {
                        ForEach(0..<viewModel.products.count, id: \.self) { index in
                            NavigationLink(value: viewModel.products[index]) {
                                ProductItemView(
                                    product: viewModel.products[index],
                                    colors: index % 2 == 0 ? [Color._363E51, Color._191E26] : [Color._191E26, Color._363E51])
                            }
//                            .padding(.trailing, index % 2 == 0 ? 20 : 0)
                            .offset(y: index % 2 == 0 ? 0 : -20)
                        }
                    }
                    
                }
            }
            .background{
                Color._242C3B
                    .ignoresSafeArea()
                LinearGradient(colors: [Color._37B6E9, Color._4B4CED], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask {
                        BackgroundShape()
                            .frame(width: .infinity, height: .infinity)
                    }
                    .offset(y: 50)
            }
            .toolbarBackground(.clear, for: .automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Choose Your Bike")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                }
                
                ToolbarItem {
                    IconButtonView(icon: Assets.search) {}
                }
            }
            .navigationDestination(for: ProductModel.self) { product in
                ProductDetailView(product: product)
                    .onAppear{
                        onViewChanged(true)
                    }
                    .onDisappear{
                        onViewChanged(false)
                    }
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    DashboardView(onViewChanged: { hideTabBar in
        
    })
        .environmentObject(BikeViewModel())
}
