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
    
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    var expressionContainsPriorityOperators: Bool {
        return elements.contains("*") || elements.contains("/")
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
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        textView.text.append(numberText)
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let newOperator = sender.title(for: .normal) else {return}
        if canAddOperator {
            textView.text.append(" \(newOperator) ")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        didPressEqual()
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        textView.text = ""
    }
    
    private func didPressEqual() {
        
        guard expressionIsCorrect else { return }
        
        guard expressionHaveEnoughElement else { return }
        
        calculatorLogic.scavengeData(retrieving: textView.text)
        
        var operationsToReduce = elements
        
        while operationsToReduce.count > 1 {
            
            var result: Double
            
            if expressionContainsPriorityOperators {
                if let index = operationsToReduce.firstIndex (where: { $0 == "*" || $0 == "/" }) {
                    let priorityResult: Double
                    let prioritySymbol = operationsToReduce[index]
                    let leftNumber = operationsToReduce[index - 1]
                    let rightNumber = operationsToReduce[index + 1]
                    
                    if let leftDouble = Double(leftNumber), let rightDouble = Double(rightNumber) {
                        if prioritySymbol == "*" {
                            priorityResult = calculatorLogic.multiplyTwoNumbers(multiplying: leftDouble, with: rightDouble)
                        } else {
                            priorityResult = calculatorLogic.divideTwoNumbers(dividing: leftDouble, with: rightDouble)
                        }
                        operationsToReduce.remove(at: index - 1)
                        operationsToReduce.remove(at: index - 1)
                        operationsToReduce.remove(at: index - 1)
                        operationsToReduce.insert("\(priorityResult)", at: index - 1)
                    }
                }
            }
            
            result = calculatorLogic.performOperations(leftNumber: Double(operationsToReduce[0])!,
                                                       rightNumber: Double(operationsToReduce[2])!,
                                                       mathSymbol: operationsToReduce[1])
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        textView.text.append(" = \(operationsToReduce.first!)")
    }
}

extension UIAlertController {
    
    func giveAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
