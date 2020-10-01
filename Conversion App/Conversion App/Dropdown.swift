//
//  Dropdown.swift
//  Conversion App
//
//  Created by Abhishek Rawat on 01/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import SwiftUI

struct Dropdown: View {
    
    @State private var isHidden = true
    @Binding var index : Int
    var array : [String]
    
    var body: some View {
        Button(action: {
            self.isHidden.toggle()
        }) {
            VStack {
                HStack {
                    Text("\(array[index])").font(.callout).foregroundColor(.white)
                    Spacer()
                    Image(systemName: "arrowtriangle.down.fill").foregroundColor(.white)
                }.padding()
                
                
                if !isHidden {
                    ForEach(array, id: \.self) {
                        temp in
                        Button(action: {
                            self.index = self.array.firstIndex(of: temp)!
                            self.isHidden.toggle()
                        }) {
                            Text("\(temp)")
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.size.width - 20)
                                .padding(.vertical, 10)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}
