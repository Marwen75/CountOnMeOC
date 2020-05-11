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
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        numberButtons.enumerated().forEach { i, numberButton in
            if sender == numberButton {
                textView.text = calculatorLogic.addNumber(i)
            }
        }
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        if calculatorLogic.canAddOperator {
            guard let myOperator = sender.title(for: .normal) else { return }
            calculatorLogic.operands.append(myOperator)
            textView.text.append(myOperator)
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        textView.text = calculatorLogic.calculateTotal()
    }
    
    
    
    
}

extension UIAlertController {
    func giveAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
