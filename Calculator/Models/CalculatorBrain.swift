//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by lingjie on 2021/1/22.
//

import Foundation

enum CalculatorBrain {
    case left(String)
    case leftOp(left: String, op: CalculatorButtonItem.Op)
    case leftOpRight(left: String, op: CalculatorButtonItem.Op, right: String)
    case error
}

extension CalculatorBrain {
    
    private var formatter: NumberFormatter {
        let f = NumberFormatter()
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 8
        f.numberStyle = .decimal
        return f
    }
    
    var output: String {
        let result: String
        switch self {
        case .left(let left):
            result = left
        case .leftOp(left: let left, op: let op):
            result = left + op.rawValue
        case .leftOpRight(left: let left, op: let op, right: let right):
            result = left + op.rawValue + right
        case .error: result = "Error"
        }
        guard let value = Double(result) else { return result }
        return formatter.string(from: value as NSNumber)!
    }
    
    func apply(item: CalculatorButtonItem) -> CalculatorBrain {
        switch item {
        case .digit(let num):
            return apply(num: num)
        case .dot:
            return applyDot()
        case .op(let op):
            return apply(op: op)
        case .command(let command):
            return apply(command: command)
        }
    }
    
    private func apply(num: Int) -> CalculatorBrain {
        switch self {
        case .left(let left):
            if formatter.number(from: left) == 0 && !left.hasSuffix(".") {
                return .left(String(num))
            }
            return .left("\(left)\(num)")
        case .leftOp(left: let left, op: let op):
            return .leftOpRight(left: left, op: op, right: String(num))
        case .leftOpRight(left: let left, op: let op, right: let right):
            if formatter.number(from: right) == 0 && !right.hasSuffix("."){
                return .leftOpRight(left: left, op: op, right: "\(num)")
            }
            return .leftOpRight(left: left, op: op, right: "\(right)\(num)")
        case .error: return .left("0")
        }
    }
    
    private func applyDot() -> CalculatorBrain {
        switch self {
        case .left(let left):
            return .left("\(left).")
        case .leftOp(left: let left, op: let op):
            return .leftOpRight(left: left, op: op, right: "0.")
        case .leftOpRight(left: let left, op: let op, right: let right):
            return .leftOpRight(left: left, op: op, right: "\(right).")
        case .error: return .left("0")
        }
    }
    
    private func apply(op: CalculatorButtonItem.Op) -> CalculatorBrain {
        switch self {
        case .left(let left):
            return .leftOp(left: left, op: op)
        case .leftOp(left: let left, op: let currentOp):
            if currentOp == op {
                return self
            }
            return .leftOp(left: left, op: op)
        case .leftOpRight(left: let left, op: let currentOp, right: let right):
            let leftNum = formatter.number(from: left) as! Double
            let rightNum = formatter.number(from: right) as! Double
            let result: Double
            switch currentOp {
            case .divide:
                if rightNum == 0 {
                    return .error
                }
                result = leftNum / rightNum;
            case .plus:
                result = leftNum + rightNum
            case .minus:
                result = leftNum - rightNum
            case .multiply:
                result = leftNum * rightNum
            case .equal:
                result = rightNum
                return .left(formatter.string(from: result as NSNumber)!)
            }
            return .leftOp(left: formatter.string(from: result as NSNumber)!, op: op)
        case .error: return .left("0")
        }
    }
    
    private func apply(command: CalculatorButtonItem.Command) -> CalculatorBrain {
        return .left("0")
    }
}
