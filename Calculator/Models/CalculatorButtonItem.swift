//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by lingjie on 2021/1/21.
//

import UIKit

enum CalculatorButtonItem: Hashable {
    
    enum Op: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "x"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}


extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let num):
            return String(num)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let num) = self, num == 0 {
            return CGSize(width: 88 * 2, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot:
            return "digitBackground"
        case .op: return "operatorBackground"
        case .command: return "commandBackground"
        }
    }
    
}
