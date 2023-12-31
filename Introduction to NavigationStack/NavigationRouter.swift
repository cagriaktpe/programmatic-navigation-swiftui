//
//  NavigationRouter.swift
//  Introduction to NavigationStack
//
//  Created by Samet Çağrı Aktepe on 7.12.2023.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    
    @Published var routes = [Route]()
    
    func push(to screen: Route) {
        routes.append(screen)
    }
    
    func reset() {
        routes = []
    }
    
    func goBack() {
        _ = routes.popLast()
    }
}
