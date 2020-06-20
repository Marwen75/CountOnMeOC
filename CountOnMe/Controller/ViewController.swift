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
    
    var calculatorLogic = CalculatorLogic(parser: Parser())
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
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
            textView.text.append(" \(newOperator) ")
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
          textView.text.removeAll()
      }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        didPressEqual()
    }
    
    private func didPressEqual() {
        
        do {
            let result = try calculatorLogic.calculate(from: textView.text)
            textView.text.append(" = \(result)")
        } catch let error as LocalizedError {
            displayAlert(title: error.errorDescription!, message: error.failureReason!)
            textView.text.removeAll()
        } catch {
            displayAlert(title: "Oups", message: "Une erreur est survenue ")
        }
    }
}

extension ViewController {
    
    func displayAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
