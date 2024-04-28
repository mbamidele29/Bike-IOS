//
//  CategoriesView.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import SwiftUI

struct CategoriesView: View {
    let offset = 10;
    @EnvironmentObject var viewModel: BikeViewModel
    
    var body: some View {
        
        HStack(spacing: 20) {
            CategoryButtonView(name: "All", icon: nil, isSelected: viewModel.category == nil) {
                viewModel.filterProducts(nil)
            }
            ForEach(0..<Category.allCases.count, id: \.self) {index in
                CategoryButtonView(
                    name: nil, icon: Category.allCases[index].image, isSelected: viewModel.category == Category.allCases[index]) {
                        viewModel.filterProducts(Category.allCases[index])
                    }
                    .offset(y: CGFloat((index+1) * -offset))
            }
        }
        .padding(.top, CGFloat(offset * Category.allCases.count))
    }
}

#Preview {
    CategoriesView()
        .environmentObject(BikeViewModel())
}
