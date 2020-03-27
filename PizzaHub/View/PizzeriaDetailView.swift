//
//  PizzeriaDetailView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/26/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI

struct PizzeriaDetailView: View {
    let pizzeria: Pizzeria
    
    var body: some View {
        VStack(alignment: .leading) {
            //TODO: Create menu list
            Text(pizzeria.name)
                .font(.largeTitle)
            HStack {
                Text(pizzeria.city)
                Text(pizzeria.state)
                Spacer()
            }
        }.padding()
    }
}

struct PizzeriaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaDetailView(pizzeria:
            Pizzeria(id: "1",
                     name: "Vittoria's",
                     city: "Westerly",
                     state: "RI")
        )
    }
}
