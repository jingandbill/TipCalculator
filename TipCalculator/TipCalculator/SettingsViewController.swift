//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Jing Welch on 8/19/17.
//  Copyright © 2017 Jing Welch. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey:"defaultTipIndex")
        
        defaultTipControl.selectedSegmentIndex = defaultTipIndex
        
        defaults.set(false, forKey: "defaultTipSelected")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onDefaultTipSelection(_ sender: Any) {
        let defaults = UserDefaults.standard // Swift 3 syntax, previously NSUserDefaults.standardUserDefaults()
        defaults.set(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
        defaults.set(true, forKey : "defaultTipSelected")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
