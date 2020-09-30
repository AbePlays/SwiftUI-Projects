//
//  ContentView.swift
//  Bill Split
//
//  Created by Abhishek Rawat on 30/09/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var numberOfPeople = ""
    @State private var tipIndex = 0
    let tipsArray = [0, 5, 10, 15, 20]
    var billAmount : Double {
        let tipAmount = (Double(tipsArray[tipIndex]) / 100) * (Double(amount) ?? 0)
        let totalAmount = ((Double(amount) ?? 0) + tipAmount) / (Double(numberOfPeople) ?? 1)
        return totalAmount
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Total Amount")
                    .font(.callout)
                    .bold()
                TextField("Enter total amount...", text: $amount)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Total People")
                    .font(.callout)
                    .bold()
                TextField("Enter total number of people...", text: $numberOfPeople)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Select tip percentage").font(.callout).bold()
                Picker("People", selection: $tipIndex) {
                    ForEach(0..<tipsArray.count) {
                        Text("\(self.tipsArray[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Text("Total Bill = $\(billAmount, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                    .padding(.top, 20)
                
                Spacer()
            }.padding()
                .navigationBarTitle(Text("Bill Split"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
