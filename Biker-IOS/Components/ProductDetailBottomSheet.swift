//
//  ProductDetailBottomSheet.swift
//  Biker-IOS
//
//  Created by PC on 27/04/2024.
//

import SwiftUI

struct ProductDetailBottomSheet: View {
    let product: ProductModel
    let viewModel: BikeViewModel
    let height: CGFloat = 450
    let topOffset: CGFloat = 105
    let onStateChanged: (_ isBottomSheetVisible: Bool) -> Void
    
    @State var productAdded = false
    @Environment(\.presentationMode) var mode
    @State private var currentTab: SheetEnum? = .description
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 30) {
                Spacer()
                ForEach(SheetEnum.allCases, id:\.self) { item in
                    TabItemView(title: item.rawValue, isSelected: currentTab == item)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                if currentTab == item {
                                    currentTab = nil
                                } else {
                                    currentTab = item
                                }
                                onStateChanged(currentTab != nil)
                            }
                        }
                }
                Spacer()
            }
            .padding(.bottom, 29)
            
            Text(product.name.uppercased())
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.white)
                .padding(.bottom, 8)
                .padding(.horizontal, 20)
            
            Text(currentTab?.body ?? "")
                .font(.system(size: 15))
                .foregroundStyle(.white.opacity(0.6))
                .padding(.horizontal, 20)
            Spacer()
            HStack(alignment:.center, spacing: 48) {
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.system(size: 24))
                    .foregroundStyle(Color._3D9CEA)
                
                ButtonView(text: "Add to Cart") {
                    productAdded = true
                    viewModel.updateCartQuantity(product: product, quantity: 1)
                }
                .alert("\(product.name) added to cart", isPresented: $productAdded) {
                    Button("OK", role: .cancel) {
                        mode.wrappedValue.dismiss()
                    }
                }
            }
            
            .frame(width: 390, height: 104, alignment: .center)
            .background(Color._262E3D.shadow(.drop(color: Color._1C222E, radius: 40, x: 0, y: -10)))
            .background {
                RoundedRectangle(cornerRadius: 30)
                    .stroke()
                    .foregroundStyle(LinearGradient(colors: [.white.opacity(0.2), .black.opacity(0.2), .black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
            .clipShape(RoundedRectangle(cornerRadius: 50))
        }
        .padding(.top, 32)
        .frame(height: height)
        .background(LinearGradient(colors: [Color._353F54, Color._222834], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(
            .rect(
                topLeadingRadius: 30,
                bottomLeadingRadius: 50,
                bottomTrailingRadius: 50,
                topTrailingRadius: 30
            )
        )
        .background {
            RoundedRectangle(cornerRadius: 30)
                .stroke()
                .foregroundStyle(LinearGradient(colors: [.white.opacity(0.2), .black.opacity(0.2), .black.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .offset(y: currentTab == nil ? height - topOffset : 0)
    }
}

@ViewBuilder private func TabItemView(title: String, isSelected: Bool) -> some View {
    
    Text(title)
        .font(.system(size: 15, weight: .bold))
        .foregroundStyle(LinearGradient(colors: isSelected ? [Color._3CA4EB, Color._4286EE] : [.white.opacity(0.6)], startPoint: .leading, endPoint: .trailing))
        .frame(width: 133, height: 43)
        .background{
            if isSelected {
                RoundedRectangle(cornerRadius: 10)
                    .modifier(DropShadowViewModifier())
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .modifier(InnerShadowViewModifier())
            }
        }
}

private enum SheetEnum: String, CaseIterable {
    case description = "Description"
    case specification = "Specification"
}

extension SheetEnum {
    var body: String {
        switch self {
        case .description:
            return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed feugiat tincidunt arcu, sed tristique arcu egestas et. Vivamus id tincidunt turpis, nec tristique leo. Nullam volutpat placerat metus, at sagittis nisi vestibulum ut. Etiam eget molestie dolor. Nam ac elementum neque. Sed et justo volutpat, vulputate est eleifend, tristique elit. Nunc malesuada purus ac mauris pharetra, ac iaculis est elementum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum dui a sapien convallis luctus. Proin ligula eros, viverra a metus at, sagittis porttitor magna. Aenean a aliquet enim, facilisis luctus ex. Integer nibh sem, ornare elementum nibh eu, commodo tincidunt orci."
        case .specification:
            return "Donec euismod vehicula nisi, eget euismod ligula posuere at. Etiam vel nunc a augue bibendum ullamcorper. Cras auctor mauris ut purus imperdiet, id fringilla quam aliquam. Nulla vehicula imperdiet elit, sit amet fermentum massa viverra quis. Morbi eget nibh ante. Nunc at leo tincidunt, gravida nisi ac, tristique tellus. Sed lobortis, nulla in posuere volutpat, massa arcu pellentesque sem, nec ultrices lorem nibh vel eros. Nullam at efficitur dolor. Mauris elementum felis a scelerisque pretium. Etiam tortor velit, posuere at lectus vehicula, lacinia imperdiet massa. Integer vitae arcu pretium ante ultrices vehicula. Maecenas lobortis commodo turpis vitae pellentesque."
        }
    }
}

//#Preview {
//    VStack {
//        Spacer()
//        ProductDetailBottomSheet(product: ProductModel.products.first!) { isBottomSheetVisible in
//            
//        }
//    }
//    .ignoresSafeArea()
//}

