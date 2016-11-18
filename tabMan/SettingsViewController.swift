//
//  SettingsViewController.swift
//  tabMan
//
//  Created by victor rodriguez on 11/16/16.
//  Copyright © 2016 Victor Rodriguez. All rights reserved.
//

import UIKit
import Foundation

class SettingsViewController:
UIViewController {

    @IBOutlet weak var defaultTipBar: UISegmentedControl!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("Settings view will appear")
        updateDefaultTipBar()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        print("Settings view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        print("Settings view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        print("Settings view did disappear")
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateDefaults(_ sender: AnyObject) {
     
        let defaults = UserDefaults.standard
        let defaultTipIndexSelected = defaultTipBar.selectedSegmentIndex
        defaults.set(defaultTipIndexSelected, forKey: "defaultTipIndexSelected")
        defaults.synchronize()
        print("Changed default Tip Index to %f", defaultTipIndexSelected )
 
    }
    func updateDefaultTipBar(){
        
        let defaults = UserDefaults.standard
        let defaultTipIndexSelected = defaults.integer(forKey: "defaultTipIndexSelected")
        defaultTipBar.selectedSegmentIndex = defaultTipIndexSelected
        defaults.synchronize()
        print("Changed default Tip Index to %f", defaultTipIndexSelected)
        
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
