//
//  CalculatorButtonRow.swift
//  Calculator
//
//  Created by lingjie on 2021/1/21.
//

import SwiftUI

struct CalculatorButtonRow: View {
    @EnvironmentObject var model: CalculatorModel
    
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { (item: CalculatorButtonItem) in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName) {
                    model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonRow(row: [.command(.clear), .command(.flip), .command(.percent), .op(.divide)])
    }
}
