//
//  OrderView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/16/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var cart: ShoppingCart
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(cart.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        cart.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        OrderView().environmentObject(cart)
    }
}
