//
//  FirebaseSession.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/12/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import FirebaseFirestore

let firebaseSession = FirebaseSession() // singleton

class FirebaseSession: ObservableObject {
    @Published var pizzerias = [Pizzeria]()
    
    let db = Firestore.firestore()
    
    init() {
        readData()
    }
    
    func readData() {
        db.collection("pizzerias").addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { diff in
                
                if (diff.type == .added) {
                    print("New pizzeria: \(diff.document.data())")
                    let pizzeria = Pizzeria(id: diff.document.documentID,
                                            name: diff.document.get("name") as! String,
                                            city: diff.document.get("city") as! String,
                                            state: diff.document.get("state") as! String)
                    self.pizzerias.append(pizzeria)
                }
            }
        }
    }
    
}
