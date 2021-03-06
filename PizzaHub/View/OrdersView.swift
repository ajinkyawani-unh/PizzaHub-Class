//
//  OrdersView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/23/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI

struct OrdersView: View {
    @ObservedObject private var orders = FirebaseCollection<Order>(collectionRef: ordersCollectionRef)
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orders.items) { order in
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            OrderRow(order: order)
                        }
                    }
                }
            }.navigationBarTitle("Order History")
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
