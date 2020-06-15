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
        calculatorLogic.parser.alertDisplayer = { [weak self] title, message in
            guard let strongSelf = self else { return }
            strongSelf.displayAlert(title: title, message: message)
        }
    }
    
    var isEqualAlreadyPressed: Bool {
        return textView.text.contains("=")
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
        if !isEqualAlreadyPressed {
            textView.text.append(" \(newOperator) ")
        } else {
            displayAlert(title: "Oups", message: "blablabla")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        didPressEqual()
    }
    
    private func didPressEqual() {
        
        guard !isEqualAlreadyPressed else { return
            displayAlert(title: "Oups", message: "Vous avez déjà appuyé sur égal")
        }
        
        textView.text.append(" = \(calculatorLogic.calculate(from: textView.text))")
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        textView.text.removeAll()
    }
}

extension ViewController {
    
    func displayAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
