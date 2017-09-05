//
//  ViewController.swift
//  SeydaIphoneCalculator
//
//  Created by user on 9/5/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let calc = Calculator()
    
    @IBOutlet weak var calcText: UILabel!
    
    @IBAction func calcOperation(_ sender: UIButton) {
        
        let operation = sender.titleLabel!.text!
        
        if (calc.lastOperation != "nothing") {
            if (!(calc.realLastOperation == "=" && operation != "=")) {
                calc.last = calc.calculate(calc.lastOperation)
            }
            
            if (operation != "=") {
                calc.current = 0.0
                calc.lastOperation = "nothing"
            }
            calcText.text = String(calc.last)
        }
        else {
            if (operation != "=") {
                calc.last = calc.current
                calc.current = 0.0
            }
        }
        if (operation != "=") {
            calc.lastOperation = operation
        }
        calc.realLastOperation = operation
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        let current = Double(sender.titleLabel!.text!)!
        calc.current = calc.current * 10.0 + current
        calcText.text = String(calc.current)
    }
    
    
    @IBAction func clearAll(_ sender: UIButton) {
        calc.current = 0.0
        calc.last = 0.0
        calc.lastOperation = "nothing"
        calc.realLastOperation = "nothing"
        calcText.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        calc.vc = self
        calcText.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

