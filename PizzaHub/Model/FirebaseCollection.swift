//
//  FirebaseCollection.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/26/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import FirebaseFirestore

// A type that can be initialized from a Firestore document.
protocol FirebaseCodable: Identifiable, ObservableObject {
    init?(id: String, data: [String: Any])
}

class FirebaseCollection<T: FirebaseCodable>: ObservableObject {
    @Published private(set) var items: [T]
    
    init(collectionRef: CollectionReference) {
        self.items = []
        listenForChanges(collectionRef: collectionRef)
    }
    
    private func listenForChanges(collectionRef: CollectionReference) {
        collectionRef.addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            let models = snapshot.documents.map { (document) -> T in
                if let model = T(id: document.documentID,
                                 data: document.data()) {
                    return model
                } else {
                    fatalError("Unable to initialize type \(T.self) with dictionary \(document.data())")
                }
            }
            self.items = models
        }
    }
}
