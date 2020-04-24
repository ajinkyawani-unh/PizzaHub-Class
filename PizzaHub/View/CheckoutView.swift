//
//  CheckoutView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/16/20.
//  Copyright © 2020 Hefele, Charles. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cart: ShoppingCart
    @State private var showingPaymentAlert = false
    
    var body: some View {
        VStack {
            Text("TOTAL: $\(cart.total, specifier: "%.2f")")
                .font(.largeTitle)
            Button("Confirm order") {
                self.showingPaymentAlert.toggle()
            }.padding()
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(cart.total, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        CheckoutView().environmentObject(cart)
    }
}