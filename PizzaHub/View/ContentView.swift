//
//  ContentView.swift
//  PizzaHub
//
//  Created by Hefele, Charles on 2/13/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let pizzeriasCollectionRef = Firestore.firestore().collection("pizzerias")

struct ContentView: View {
    @ObservedObject private var pizzerias = FirebaseCollection<Pizzeria>(collectionRef: pizzeriasCollectionRef)
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddPizzeriaView()) {
                    Text("Add Pizzeria")
                }
                List {
                    ForEach(pizzerias.items) { pizzeria in
                        NavigationLink(destination: PizzeriaDetailView(pizzeria: pizzeria)) {
                            PizzeriaRow(pizzeria: pizzeria)
                        }
                    }.onDelete(perform: deletePizzeria)
                }
            }
            .navigationBarTitle(Text("Pizzerias"))
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func deletePizzeria(at offsets: IndexSet) {
        let index = offsets.first!
        print("Deleting pizzeria: \(pizzerias.items[index])")
        let id = pizzerias.items[index].id
        pizzeriasCollectionRef.document(id).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
