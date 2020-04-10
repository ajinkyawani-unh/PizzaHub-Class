//
//  PizzeriaDetailView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/26/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct PizzeriaDetailView: View {
    @ObservedObject var pizzeria: Pizzeria
    @ObservedObject var menu: FirebaseCollection<MenuItem>
    private var menuCollectionRef: CollectionReference
    
    init(pizzeria: Pizzeria) {
        self.pizzeria = pizzeria
        self.menuCollectionRef = pizzeriasCollectionRef.document(pizzeria.id).collection("menu")
        self.menu = FirebaseCollection<MenuItem>(collectionRef: menuCollectionRef)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(pizzeria.city)
                Text(pizzeria.state)
                Spacer()
            }
            CircleImage(image: Image("pizzeria\(pizzeria.photo)"))
            NavigationLink(destination: EditPizzeriaView(pizzeria: pizzeria)) {
                Text("Edit")
            }
            Divider()
            Text("Menu")
                .font(.largeTitle)
            List {
                ForEach(menu.items) { menuItem in
                    HStack {
                        Text(menuItem.name)
                        Spacer()
                        Text(menuItem.price)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(pizzeria.name)
    }
}

struct PizzeriaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaDetailView(pizzeria:
            Pizzeria(id: "1", data: ["name": "Vittoria's",
                                     "city": "Westerly",
                                     "state": "RI",
                                     "photo": "2"])!
        )
    }
}
