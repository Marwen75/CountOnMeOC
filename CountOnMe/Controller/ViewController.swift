//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var calculatorLogic = CalculatorLogic()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    var isEqualAlreadyPressed: Bool {
        return textView.text.contains("=")
    }
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "*" && elements.last != ""
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "/" && elements.last != "*" && elements.last != "+" && elements.last != "-"
            && elements.last != "=" && elements.isEmpty == false
    }
    
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    
    var checkingDivisionByZeroInExpression: Bool {
        if elements.contains("/") {
            if let indexOfDivisionSymbol = elements.firstIndex(of: "/") {
                if elements[indexOfDivisionSymbol + 1] != "0" {
                    return true
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {return}
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        textView.text.append(numberText)
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let newOperator = sender.title(for: .normal) else {return}
        
        if canAddOperator && !isEqualAlreadyPressed {
            textView.text.append(" \(newOperator) ")
        } else {
            displayAlert(title: "Oups", message: "Soit il vaut mieux commencer par un chiffre, soit un opérateur est déja mis !")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        didPressEqual()
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        clear()
    }
    
    private func clear() {
        textView.text.removeAll()
    }
    
    private func didPressEqual() {
        
        guard !isEqualAlreadyPressed else { return
            displayAlert(title: "Oups", message: "Vous avez déjà appuyé sur égal")
        }
        
        guard expressionIsCorrect else { return
            displayAlert(title: "Oups", message: "Votre expression est incorrecte !")
        }
        
        guard expressionHaveEnoughElement else { return
            displayAlert(title: "Oups", message: "Démarrez un nouveau calcul !")
        }
        
        guard checkingDivisionByZeroInExpression else { return
            displayAlert(title: "Oups", message: "Vous ne pouvez pas diviser par zéro !")
        }
        
        textView.text.append(" = \(calculatorLogic.calculate(from: textView.text))")
    }
}

extension ViewController {
    
    func displayAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
