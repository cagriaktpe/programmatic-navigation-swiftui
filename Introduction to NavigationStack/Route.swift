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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.menuItem(let lhsItem), .menuItem(let rhsItem)):
            return lhsItem.id == rhsItem.id
        }
    }
    
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
        }
    }
}
