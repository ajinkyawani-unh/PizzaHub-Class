//
//  EditPizzeriaView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/2/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI

struct EditPizzeriaView: View {
    @ObservedObject var pizzeria: Pizzeria
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            VStack(spacing: 25) {
                HStack {
                    Text("Pizzeria Name:")
                    TextField("Enter Name", text: $pizzeria.name)
                }
                HStack {
                    Text("Pizzeria City:")
                    TextField("Enter City", text: $pizzeria.city)
                }
                HStack {
                    Text("Pizzeria State:")
                    TextField("Enter State", text: $pizzeria.state)
                }
                Button(action: {
                    self.updatePizzeria()
                }) {
                    Text("Save")
                }
                Spacer()
            }
            .navigationBarTitle("Edit \(pizzeria.name)")
        }
        .padding()
    }
    
    func updatePizzeria() {
        print("Editing pizzeria")
        if !pizzeria.name.isEmpty && !pizzeria.city.isEmpty && !pizzeria.state.isEmpty {
            pizzeriasCollectionRef.document(pizzeria.id).setData(pizzeria.data)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditPizzeriaView_Previews: PreviewProvider {
    static var previews: some View {
        EditPizzeriaView(pizzeria: Pizzeria.example)
    }
}
