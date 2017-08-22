//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jing Welch on 8/18/17.
//  Copyright © 2017 Jing Welch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var tipCalfulatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()

        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "defaultTipIndex")
        let lastBillValue = defaults.integer(forKey: "lastBillValue")
        
        // Use the default tip value
        tipControl.selectedSegmentIndex = defaultTipIndex

        if lastBillValue != 0 {
            let lastDateTimeUsed = defaults.object(forKey: "lastDateTimeUsed") as! Date
            let timeIntervalSinceLastUsed = lastDateTimeUsed.timeIntervalSinceNow
            
            // Show last bill value if used less than 10 minutes ago
            if !timeIntervalSinceLastUsed.isLessThanOrEqualTo(-600) {
                billField.text = String(lastBillValue)
            }
        }
        
        // Fade the view in
        self.tipCalfulatorView.alpha = 0
        UIView.animate(withDuration: 0.8, animations: {
            self.tipCalfulatorView.alpha = 1
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        billField.becomeFirstResponder()
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculateTip()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let defaults = UserDefaults.standard
        let defaultTipSelected = defaults.bool(forKey: "defaultTipSelected")
        let defaultTipIndex = defaults.integer(forKey:"defaultTipIndex")
        
        if (defaultTipSelected) {
            tipControl.selectedSegmentIndex = defaultTipIndex
        }

        calculateTip()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        let bill = Double(billField.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "lastBillValue")
        defaults.set(Date(), forKey: "lastDateTimeUsed")
        defaults.synchronize()
        print(bill)
    }
    
    func calculateTip() {
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex];
        let total = bill + tip
        
        tipLabel.text = String(format : "$%.2f", tip)
        totalLabel.text = String(format : "$%.2f", total)
    }
}

