//
//  Route.swift
//  Introduction to NavigationStack
//
//  Created by Samet Çağrı Aktepe on 7.12.2023.
//

import Foundation
import SwiftUI

enum Route: View, Hashable {
    case menuItem(item: any MenuItem)
    case cart

    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case let (.menuItem(lhsItem), .menuItem(rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.cart, .cart):
            return true
        default:
            return false
        }
    }

    var body: some View {
        switch self {
        case let .menuItem(item):
            switch item {
            case is Food:
                FoodDetailView(food: item as! Food)
            case is Drink:
                DrinkDetailView(drink: item as! Drink)
            case is Dessert:
                DessertDetailView(dessert: item as! Dessert)
            default:
                EmptyView()
            }
        case .cart:
            CartView()
        }
    }
}
