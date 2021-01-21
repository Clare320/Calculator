//
//  CalculatorButton.swift
//  Calculator
//
//  Created by lingjie on 2021/1/21.
//

import SwiftUI

struct CalculatorButton: View {
    
    let title: String
    let size: CGSize
    let fontSize: CGFloat = 38
    let backgroundColorName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: fontSize))
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width / 2)
        })
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton(title: "+", size: CGSize(width: 100, height: 100), backgroundColorName: "operatorBackground", action: {
            print("click +")
        })
    }
}


