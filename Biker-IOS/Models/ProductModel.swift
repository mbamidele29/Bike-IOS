//
//  ProductModel.swift
//  Biker-IOS
//
//  Created by PC on 25/04/2024.
//

import Foundation


struct ProductModel: Hashable {
    let name: String
    let image: String
    let category: Category
    let price: Double
    let discount: Double
    
    var checkoutPrice: Double {
        price - (discount/100)
    }
}

extension ProductModel {
    static let products = [
        ProductModel(name: "PEUGEOT - Max", image: Assets.bike2, category: .road, price: 1999.99, discount: 30),
        ProductModel(name: "PEUGEOT - LR01", image: Assets.bike1, category: .road, price: 1999.99, discount: 0),
        ProductModel(name: "SMITH - Trade", image: Assets.helmet, category: .helmet, price: 200, discount: 0),
        ProductModel(name: "PILOT - Chromoly", image: Assets.bike3, category: .hill, price: 2499.99, discount: 0),
    ];
}


enum Category: String, CaseIterable {
    case battery = "Charge"
    case road = "Road Bike"
    case hill = "Dirt Bike"
    case helmet = "Road Helmet"
}


extension Category {
    var image: String {
        switch self {
        case .battery: Assets.charge
        case .road: Assets.road
        case .hill: Assets.hill
        case .helmet: Assets.gear
        }
    }
}
