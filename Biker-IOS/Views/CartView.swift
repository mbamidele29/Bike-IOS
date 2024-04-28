//
//  CartView.swift
//  Biker-IOS
//
//  Created by PC on 27/04/2024.
//

import SwiftUI

struct CartView: View {
    @State var couponCode: String = ""
    @State var checkoutCompleted = false
    @State var couponDiscount: Double = 0
    @EnvironmentObject var viewModel: BikeViewModel
    @State private var draggedOffset: CGSize = .zero
    
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Georgia-Bold", size: 20)!]
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.cartProducts.isEmpty {
                    Spacer()
                    Image(Assets.emptyCart)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }else {
                    LazyVStack{
                        ForEach(Array(viewModel.cartProducts.keys.enumerated()), id: \.element) { _, product in
                            HStack(spacing: 16) {
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 90)
                                    .background(LinearGradient(colors: [Color._363E51, Color._4C5770], startPoint: .bottomTrailing, endPoint: .topLeading))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading, spacing: 24) {
                                    Text(product.name)
                                        .font(.system(size: 15, weight: .bold))
                                        .foregroundStyle(.white.opacity(0.87))
                                    
                                    HStack(spacing: 10) {
                                        Text("\(product.price, specifier: "%.2f")")
                                            .font(.system(size: 14))
                                            .foregroundStyle(Color._3C9EEA)
                                        Spacer()
                                        HStack(spacing: 10) {
                                            IconButtonView(icon: Assets.plus, size: 24, radius: 5){
                                                viewModel.updateCartQuantity(product: product, quantity: 1)
                                            }
                                            Text("\(viewModel.cartProducts[product] ?? 0)")
                                                .font(.system(size: 13, weight: .semibold))
                                                .foregroundStyle(.white.opacity(0.6))
                                            IconButtonView(icon: Assets.minus, size: 24, radius: 5, colors: [.white.opacity(0.2), .black.opacity(0.2)]){
                                                viewModel.updateCartQuantity(product: product, quantity: -1)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    .frame(height: .infinity)
                    
                    HStack {
                        TextField("Coupon Code", text: $couponCode)
                            .font(.system(size: 13))
                            .foregroundStyle(.white.opacity(0.6))
                            .lineLimit(1)
                        Spacer()
                        ButtonView(text: "Apply", width: 144) {
                            if !couponCode.trimmingCharacters(in: .whitespaces).isEmpty {
                                couponDiscount = 250
                            } else {
                                couponDiscount = 0
                            }
                        }
                    }
                    .padding(.leading, 12)
                    .background(Color._242C3B.shadow(.inner(color: Color._191E29, radius: 30, x: 4, y: 10)))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 26)
                    
                    Text("Your bag qualifies for free shipping")
                        .font(.system(size: 15))
                        .foregroundStyle(.white.opacity(0.6))
                        .padding(.bottom, 27)
                    
                    VStack(spacing: 8) {
                        CheckoutItemView(name: "Subtotal:", amount: viewModel.cartProducts.subtotalPrice)
                        CheckoutItemView(name: "Delivery Fee:", amount: 0)
                        CheckoutItemView(name: "Discount:", amount: viewModel.cartProducts.subtotalPrice - viewModel.cartProducts.checkoutPrice - couponDiscount)
                        CheckoutItemView(name: "Total:", amount: viewModel.cartProducts.checkoutPrice - couponDiscount, color: Color._38B8EA, weight: .bold)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 23) {
                        IconButtonView(icon: Assets.back, disabled: true) {
                            
                        }
                        .rotationEffect(Angle(degrees: 180))
                        .offset(
                            CGSize(width: draggedOffset.width, height: 0)
                        )
                        .gesture (
                            DragGesture()
                            .onChanged { value in
                                if value.translation.width >= 130 || value.translation.width < 0 {
                                    return
                                }
                                self.draggedOffset = value.translation
                            }
                            .onEnded { value in
                                if value.translation.width >= 100 {
                                    checkoutCompleted = true
                                }
                                self.draggedOffset = .zero
                            }
                        )
                        Text("Checkout")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.white.opacity(0.6))
                        Spacer()
                    }
                    .frame(width: 174)
                    .background(Color._242C3B.shadow(.inner(color: Color._191E29, radius: 30, x: 4, y: 10)))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom, 26)
                }
                Spacer()
            }
            .alert("Your order is being processed", isPresented: $checkoutCompleted, actions: {
                Button("OK", role: .cancel) {
                    viewModel.cartProducts = [:]
                    viewModel.selectedTab = .dashboard
                }
            })
            .background(Color._242C3B)
            .navigationTitle("My Shopping Cart")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

@ViewBuilder private func CheckoutItemView(
    name: String,
    amount: Double,
    color: Color? = nil,
    weight: Font.Weight? = nil
) -> some View {
    HStack {
        Text(name)
            .font(.system(size: 15, weight: .medium))
            .foregroundStyle(.white.opacity(0.87))
        Spacer()
        Text("$\(amount, specifier: "%.2f")")
            .font(.system(size: 15, weight: weight))
            .foregroundStyle(color ?? .white.opacity(0.6))
    }
}

#Preview {
    CartView()
        .environmentObject(BikeViewModel())
}
