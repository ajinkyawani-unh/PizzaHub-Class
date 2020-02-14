//
//  MenuItem.swift
//  PizzaHub
//
//  Created by Hefele, Charles on 2/13/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

class MenuItem {
    var name: String
    var price: Double
    
    init?(name: String, price: Double) {
        if name.isEmpty || price < 0 {
            return nil
        }
        self.name = name
        self.price = price
    }
    
    
}
