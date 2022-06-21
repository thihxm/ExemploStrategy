//
//  Strategies.swift
//  StrategyDesignPattern
//
//  Created by Thiago Medeiros on 21/06/22.
//

import Foundation

protocol Strategy {
    func calculate(x: Int, y: Int) -> Int
}

class SumStrategy: Strategy {
    func calculate(x: Int, y: Int) -> Int {
        return x + y
    }
}

class MultiplyStrategy: Strategy {
    func calculate(x: Int, y: Int) -> Int {
        return x * y
    }
}

class DivideStrategy: Strategy {
    func calculate(x: Int, y: Int) -> Int {
        return x / y
    }
}

class SubtractStrategy: Strategy {
    func calculate(x: Int, y: Int) -> Int {
        return x - y
    }
}

class PowerStrategy: Strategy {
    func calculate(x: Int, y: Int) -> Int {
        return Int(pow(Double(x), Double(y)))
    }
}
