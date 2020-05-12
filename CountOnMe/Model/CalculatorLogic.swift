//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorLogic {
    var sign: String?
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var firstResult: Double = 0
    
    
    func calculate() {
        if sign != nil {
            switch sign {
            case "+":
                firstResult = firstNumber + secondNumber
            case "-":
                firstResult = firstNumber - secondNumber
            case "*":
                firstResult = firstNumber * secondNumber
            case "/":
                firstResult = firstNumber / secondNumber
            default:
                break
            }
        }
    }
    
    func resetToZero() {
        firstNumber = 0
        secondNumber = 0
        firstResult = 0
        sign = nil
    }
    
    
    var expressionIsCorrect: Bool {
       return true
    }
    
    var canAddOperator: Bool {
        return true
    }
    
 
    
   
}
