//
//  Pizzeria.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/12/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import FirebaseFirestore

struct Pizzeria: Identifiable {
    var id: String
    var name: String
    var city: String
    var state: String
}
