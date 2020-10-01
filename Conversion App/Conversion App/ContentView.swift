//
//  ContentView.swift
//  Conversion App
//
//  Created by Abhishek Rawat on 01/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var firstValue = ""
    var secondValue : String {
        let current = Double(firstValue)
        if firstIndex == secondIndex {
            return firstValue
        }
        
        switch firstIndex {
        case 0:
            switch secondIndex {
            case 1:
                return String((current! * 1.8) + 32)
                
            case 2:
                return String(current! + 273)
                
            default:
                return ""
            }
        case 1:
            switch secondIndex {
            case 0:
                return String((current! - 32) * 0.56)
                
            case 2:
                return String(((current! - 32) * 0.56) + 273)
                
            default:
                return ""
            }
        case 2:
            switch secondIndex {
            case 0:
                return String(current! - 273)
                
            case 1:
                return String(((current! - 273) * 1.8) + 32)
                
            default:
                return ""
            }
        default:
            return ""
        }
        
    }
    @State var firstIndex = 0
    @State var secondIndex = 0
    let tempArray = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Text("TEMPERATURE").foregroundColor(.gray).font(.largeTitle).bold()
                }.padding(.bottom, 30)
                
                Dropdown(index: $firstIndex, array: tempArray)
                
                TextField("Enter a value", text: $firstValue)
                    .font(.title)
                    .foregroundColor(.yellow)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
                    .frame(height: 20)
                    .padding([.top, .leading, .trailing], 20)
                
                Color.gray.frame(height: 1)
                
                Dropdown(index: $secondIndex, array: tempArray)
                
                HStack {
                    Spacer()
                    Text("\(secondValue)")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(height: 20)
                        .padding([.leading, .trailing, .top], 20)
                }
                
                Color.gray.frame(height: 1)
                
                Spacer()
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
