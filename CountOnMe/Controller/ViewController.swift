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
    var userIsTyping: Bool = false
   
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let operandText = sender.title(for: .normal) else {return}
        if userIsTyping {
            textView.text = textView.text + operandText
        } else {
            textView.text = operandText
            userIsTyping = true
        }
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let mathSymbol = sender.title(for: .normal) else {return}
        didPressOperator(newOperator: mathSymbol)
        textView.text = mathSymbol
        userIsTyping = false
    }
    
    private func didPressOperator(newOperator: String) {
        calculatorLogic.numbers.append(Double(textView.text!)!)
        calculatorLogic.mathSymbols.append(newOperator)
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        didPressEqual()
    }
    
    private func didPressEqual() {
        calculatorLogic.numbers.append(Double(textView.text!)!)
        textView.text = " = \(calculatorLogic.performOperations())"
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        calculatorLogic.clear()
        textView.text = ""
    }
    
    /*  var elements: [String] {
     return textView.text.split(separator: " ").map { "\($0)" }
     }
     
     // Error check computed variables
     var expressionIsCorrect: Bool {
     return elements.last != "+" && elements.last != "-"
     }
     
     var expressionHaveEnoughElement: Bool {
     return elements.count >= 3
     }
     
     var canAddOperator: Bool {
     return elements.last != "+" && elements.last != "-"
     }
     
     var expressionHaveResult: Bool {
     return textView.text.firstIndex(of: "=") != nil
     }
     
     // Create local copy of operations
     var operationsToReduce = elements
     
     // Iterate over operations while an operand still here
     while operationsToReduce.count > 1 {
     let left = Int(operationsToReduce[0])!
     let operand = operationsToReduce[1]
     let right = Int(operationsToReduce[2])!
     
     let result: Int
     switch operand {
     case "+": result = left + right
     case "-": result = left - right
     default: fatalError("Unknown operator !")
     }
     
     operationsToReduce = Array(operationsToReduce.dropFirst(3))
     operationsToReduce.insert("\(result)", at: 0)
     }
     
     textView.text.append(" = \(operationsToReduce.first!)")
     }
     
     */
    
    
}

extension UIAlertController {
    func giveAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
