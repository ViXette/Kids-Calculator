//
//  ViewController.swift
//  Kids Calculator
//
//  Created by VX on 28/08/16.
//  Copyright © 2016 VXette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation :Operator = Operator.nothing
    var calcState :CalculationState = CalculationState.enteringNumber
    var pressedOperatorButton : UIButton?
    
    
    var firstValue :String = ""

    @IBOutlet weak var result_Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Buttons Actions
    @IBAction func numberTapped(_ sender :UIButton) {
        pressedOperatorButton?.alpha = 1
        updateDisplay(number: String(sender.tag))
    }
    
    func updateDisplay(number :String) {
        if calcState == CalculationState.newNumStarted {
            if let num = result_Label.text, num != "" {
                firstValue = num
            }
            calcState = CalculationState.enteringNumber
            result_Label.text = number
        } else if calcState == CalculationState.enteringNumber {
            result_Label.text = result_Label.text! + number
        }
    }
    
    @IBAction func operatorTapped(_ sender :UIButton) {
        calcState = CalculationState.newNumStarted
        
        pressedOperatorButton?.alpha = 1
        pressedOperatorButton = sender
        pressedOperatorButton!.alpha = 0.3
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
        case 11:
            currentOperation = Operator.subtract
        case 12:
            currentOperation = Operator.times
        case 13:
            currentOperation = Operator.divide
        default:
            return
        }
    }
    
    @IBAction func equalsTapped(_ sender :UIButton) {
        calculateResult()
    }
    
    func calculateResult() {
        if firstValue.isEmpty {
            return
        }
        
        var result = ""
        
        switch currentOperation {
        case Operator.add:
            result = String(Double(firstValue)! + Double(result_Label.text!)!)
        case Operator.subtract:
            result = String(Double(firstValue)! - Double(result_Label.text!)!)
        case Operator.times:
            result = String(Double(firstValue)! * Double(result_Label.text!)!)
        case Operator.divide:
            result = String(Double(firstValue)! / Double(result_Label.text!)!)
        default:
            break
        }
        
        result_Label.text = result
        calcState = CalculationState.newNumStarted
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

