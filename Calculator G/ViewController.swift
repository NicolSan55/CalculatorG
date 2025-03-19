//
//  ViewController.swift
//  Calculator G
//
//  Created by Nicolay Kudymov on 2025-03-06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextView: UITextView!
    
    @IBOutlet weak var Button1: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var Button5: UIButton!
    
    @IBOutlet weak var Button6: UIButton!
    
    @IBOutlet weak var Button7: UIButton!
    
    @IBOutlet weak var Button8: UIButton!
    
    @IBOutlet weak var Button9: UIButton!
    
    @IBOutlet weak var Button0: UIButton!
    
    @IBOutlet weak var ButtonClear: UIButton!
    
    @IBOutlet weak var ButtonPlus: UIButton!
    
    @IBOutlet weak var ButtonMinus: UIButton!
    
    @IBOutlet weak var ButtonDivide: UIButton!
    
    @IBOutlet weak var ButtonMultiply: UIButton!
    
    @IBOutlet weak var ButtonEquals: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

        
        var currentNumber: String = ""
        var previousNumber: Double = 0
        var operation: String = ""

        
        @IBAction func numberPressed(_ sender: UIButton) {
            if let numberValue = sender.titleLabel?.text {
                currentNumber += numberValue
                TextView.text = currentNumber
            }
        }
        
        
        @IBAction func operationPressed(_ sender: UIButton) {
            if let operationSymbol = sender.titleLabel?.text, let number = Double(currentNumber) {
                previousNumber = number
                operation = operationSymbol
                currentNumber = ""
            }
        }
        
        
        @IBAction func equalsPressed(_ sender: UIButton) {
            if let number = Double(currentNumber) {
                var result: Double = 0
                
                switch operation {
                case "+":
                    result = previousNumber + number
                case "-":
                    result = previousNumber - number
                case "x":
                    result = previousNumber * number
                case "÷":
                    result = number != 0 ? previousNumber / number : 0
                default:
                    break
                }
                
                
                       if result == floor(result) {
                           TextView.text = String(Int(result))
                       } else {
                           TextView.text = "\(result)"
                       }
                

                currentNumber = "\(result)"
            }
        }
        
        
        @IBAction func clearPressed(_ sender: UIButton) {
            currentNumber = ""
            previousNumber = 0
            operation = ""
            TextView.text = "0"
        }
    

    
}

