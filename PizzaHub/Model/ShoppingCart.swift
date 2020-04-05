//
//  ShoppingCart.swift
//  PizzaHub
//
//  Created by Hefele, Charles on 2/13/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

class ShoppingCart {
    var items = [MenuItem]()
    
    func addItem(item: MenuItem) {
        items.append(item)
    }
    
    func returnTotal() -> Double {
        var total: Double = 0.0
        for item in items {
            total += Double(item.price)!
        }
        return total
    }
    
}
