//
//  Route.swift
//  Introduction to NavigationStack
//
//  Created by Samet Çağrı Aktepe on 7.12.2023.
//

import Foundation
import SwiftUI

enum Route {
    case menuItem(item: any MenuItem)
    case cart
    case ingredients(items: [Ingredient])
    case allergies(items: [Allergie])
}

extension Route: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(hashValue)
    }

    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case let (.menuItem(lhsItem), .menuItem(rhsItem)):
            return lhsItem.id == rhsItem.id
        case (.cart, .cart):
            return true
        case (.ingredients(let lhsItems), .ingredients(let rhsItems)):
            return lhsItems == rhsItems
        case (.allergies(let lhsItems), .allergies(let rhsItems)):
            return lhsItems == rhsItems
        default:
            return false
        }
    }
    
}

extension Route: View {
    var body: some View {
        switch self {
        case .menuItem(let item):
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
        case .ingredients(let items):
            IngredientsDetailView(ingredients: items)
        case .allergies(let items):
            AllergiesDetailView(allergies: items)
        }
    }
}
