//
//  ViewController.swift
//  tips
//
//  Created by Elaine Mao on 4/10/15.
//  Copyright (c) 2015 Elaine Mao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipStaticLabel: UILabel!
    @IBOutlet weak var totalStaticLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var selectedTipSegment = defaults.integerForKey("default_tip_percentage")
        
        tipControl.selectedSegmentIndex = selectedTipSegment
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        self.tipControl.alpha = 0
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.tipStaticLabel.alpha = 0
        self.totalStaticLabel.alpha = 0
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        UIView.animateWithDuration(0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipControl.alpha = 1
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.tipStaticLabel.alpha = 1
            self.totalStaticLabel.alpha = 1
        })
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

