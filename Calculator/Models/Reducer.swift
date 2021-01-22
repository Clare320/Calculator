//
//  Reducer.swift
//  Calculator
//
//  Created by lingjie on 2021/1/22.
//

import Foundation

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem

struct Reducer {
    static func reduce(state: CalculatorState, action: CalculatorStateAction) -> CalculatorState {
        return state.apply(item: action)
    }
}
