//
//  CalculatorError.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 20/06/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

enum CalculatorError: LocalizedError {
    case incorrectExpression
    case operationBeginsWithOperator
    case divisionByZero
    case equalIsAlreadyPressed

    var errorDescription: String? {
       return "Oups !"
    }
    var failureReason: String? {
        switch self {
        case .incorrectExpression:
            return "Votre expression est incorrecte."
        case .divisionByZero:
            return "La division par zéro est impossible."
        case .operationBeginsWithOperator:
            return "Il vaut mieux commencer par un chiffre."
        case .equalIsAlreadyPressed:
            return "Vous avez déja appuyé sur égal veuillez commencer un nouveau calcul."
        }
    }
}
