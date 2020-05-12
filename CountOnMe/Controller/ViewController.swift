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
    var userIsCurrentlyTyping: Bool = false
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        let number: String = sender.currentTitle!
        if userIsCurrentlyTyping {
            textView.text = textView.text + number
        } else {
            textView.text = number
            userIsCurrentlyTyping = true
        }
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        calculatorLogic.sign = sender.currentTitle
        calculatorLogic.firstNumber = Double(textView.text!)!
        textView.text = sender.currentTitle
        userIsCurrentlyTyping = false
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculatorLogic.secondNumber = Double(textView.text!)!
        calculatorLogic.calculate()
        textView.text = String(calculatorLogic.firstResult)
        userIsCurrentlyTyping = false 
    }
    
    
    
    
}

extension UIAlertController {
    func giveAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
