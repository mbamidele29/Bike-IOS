//
//  BikeViewModel.swift
//  Biker-IOS
//
//  Created by PC on 27/04/2024.
//

import Foundation

class BikeViewModel: ObservableObject {
    @Published var category: Category?
    @Published var products: [ProductModel]
    @Published var selectedTab = Tab.dashboard
    
    @Published var cartProducts: [ProductModel: Int] = [:]
    
    init() {
        products = ProductModel.products
    }
    
    func filterProducts(_ category: Category?) {
        if category == nil {
            products = ProductModel.products
        }else {
            products = ProductModel.products.filter({ product in
                product.category == category
            })
        }
        self.category = category
    }
    
    func updateCartQuantity(product: ProductModel, quantity: Int) {
        var cartQuantity = cartProducts[product] ?? 0
        cartQuantity = quantity + cartQuantity
        
        if cartQuantity < 0 {
            cartQuantity = 0
        }
        cartProducts[product] = cartQuantity
    }
}

extension [ProductModel:Int] {

    var checkoutPrice: Double {
        self.reduce(0) { partialResult, entry in
            partialResult + (entry.key.checkoutPrice * Double(entry.value))
        }
    }
    
    var subtotalPrice: Double {
        self.reduce(0) { partialResult, entry in
            partialResult + (entry.key.price * Double(entry.value))
        }
    }
}

enum Tab: String, CaseIterable {
    case dashboard = "bicycle"
    case map = "map"
    case cart = "cart"
    case persion = "person"
    case history =  "doc"
}
