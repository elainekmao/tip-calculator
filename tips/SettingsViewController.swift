//
//  SettingsViewController.swift
//  tips
//
//  Created by Elaine Mao on 4/13/15.
//  Copyright (c) 2015 Elaine Mao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var selectedTipFromDefaults = defaults.integerForKey("default_tip_percentage")
        tipControl.selectedSegmentIndex = selectedTipFromDefaults
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipChanged(sender: AnyObject) {
        var selectedTipSegment = tipControl.selectedSegmentIndex
        defaults.setInteger(selectedTipSegment, forKey: "default_tip_percentage")
        defaults.synchronize()

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
