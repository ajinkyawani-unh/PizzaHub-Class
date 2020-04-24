//
//  MenuItem.swift
//  PizzaHub
//
//  Created by Hefele, Charles on 2/13/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import FirebaseFirestore

class MenuItem: FirebaseCodable, Equatable {
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String
    @Published var name: String
    @Published var price: String
    @Published var photo: String
    
    var data: [String: Any] {
        return [
            "name": name,
            "price": price,
            "photo": photo
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
            let price = data["price"] as? String,
            let photo = data["photo"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.price = price
        self.photo = photo
    }
    
    #if DEBUG
    static let example = MenuItem(id: "1", data: ["name": "Cheese Pizza",
                                                  "price": "17.99",
                                                  "photo": "1"])!
    #endif
}
