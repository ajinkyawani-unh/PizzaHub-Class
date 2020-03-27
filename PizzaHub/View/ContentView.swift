//
//  ContentView.swift
//  PizzaHub
//
//  Created by Hefele, Charles on 2/13/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let query = Firestore.firestore().collection("pizzerias2")

struct ContentView: View {
    @ObservedObject private var pizzerias = FirebaseCollection<Pizzeria>(query: query)
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddPizzeriaView()) {
                    Text("Add Pizzeria")
                }
                List {
                    ForEach(pizzerias.items) { pizzeria in
                        NavigationLink(destination: PizzeriaDetailView(pizzeria: pizzeria)) {
                            Text(pizzeria.name)
                        }
                    }.onDelete(perform: removePizzeria)
                }
            }
            .navigationBarTitle(Text("Pizzerias"))
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func removePizzeria(at offsets: IndexSet) {
        pizzerias.deleteItem(index: offsets.first!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
