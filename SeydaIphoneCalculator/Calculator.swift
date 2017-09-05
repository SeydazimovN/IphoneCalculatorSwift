//
//  Calculator.swift
//  SeydaIphoneCalculator
//
//  Created by user on 9/5/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class Calculator: NSObject {
    var current = 0.0
    var last = 0.0
    var lastOperation = "nothing"
    var realLastOperation = "nothing"
    var vc: UIViewController?
    
    func calculate(_ currentOperation : String) -> Double {
        var res = 0.0
        
        if (currentOperation == "+") {
            res = last + current
        }
        if (currentOperation == "-") {
            res = last - current
        }
        if (currentOperation == "*") {
            res = last * current
        }
        if (currentOperation == "/") {
            if (current == 0.0){
                let alert = UIAlertController(title: "Do not delete to O (Zero)", message: "It is mathematically impossible !!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                vc?.present(alert, animated: true, completion: nil)
            }
            else {
                res = last / current
            }
        }
        	
        return res
    }
}
