//
//  CalcContext.swift
//  StrategyDesignPattern
//
//  Created by Thiago Medeiros on 21/06/22.
//

import Foundation

class CalcContext {
    private var strategy: Strategy
    
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func setStrategy(to newStrategy: Strategy) {
        self.strategy = newStrategy
    }
    
    func runAlgorithm(x: Int, y: Int) -> Int {
        return strategy.calculate(x: x, y: y)
    }
}
