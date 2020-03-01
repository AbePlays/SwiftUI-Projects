//
//  ContentView.swift
//  Dicee
//
//  Created by Abhishek Rawat on 02/03/20.
//  Copyright © 2020 Abhishek Rawat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var left = 1
    @State var right = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: left)
                    DiceView(n: right)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.left = Int.random(in: 1...6)
                    self.right = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 48))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n : Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}
