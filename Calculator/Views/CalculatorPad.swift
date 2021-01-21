//
//  CalculatorPad.swift
//  Calculator
//
//  Created by lingjie on 2021/1/21.
//

import SwiftUI

struct CalculatorPad: View {
    let rows: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing: 8) {
            ForEach(rows, id: \.self) { (item: [CalculatorButtonItem]) in
                CalculatorButtonRow(row: item)
            }
        }
    }
}

struct CalculatorPad_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorPad()
    }
}
