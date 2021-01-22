//
//  ContentView.swift
//  Calculator
//
//  Created by lingjie on 2021/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var brain: CalculatorBrain = .left("0")
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(brain.output)
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing, 24)
                .lineLimit(1)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            CalculatorPad()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
