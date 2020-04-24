//
//  ShoppingCart.swift
//  PizzaHub
//
//  Created by Hefele, Charles on 2/13/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import UIKit

class ShoppingCart: ObservableObject {
    @Published var items = [MenuItem]()
    
    var total: Double {
        if items.count > 0 {
            return items.reduce(0) { $0 + Double($1.price)! }
        } else {
            return 0
        }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
}
