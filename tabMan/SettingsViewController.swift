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
    
    @IBOutlet weak var darkThemeButton: UISwitch!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var darkThemeLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("Settings view will appear")
        updateDefaultTipBar()
        updateDefaultDarkTheme()
        
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
    
    @IBAction func updatePercentageDefaults(_ sender: AnyObject) {
     //This function is called when a user clicks on the UISegmentControl. The function then saves the toggled percentage to the "Defaults Storage Dictionary"
        let defaultTipIndexSelected = defaultTipBar.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTipIndexSelected, forKey: "defaultTipIndexSelected")
        defaults.synchronize()
        print("Changed default Tip Index to %f", defaultTipIndexSelected )
    }
    
    @IBAction func updateDarkThemeDefault(_ sender: AnyObject) {
        //This function is called when a user clicks on the dark theme button. The function then saves whether the Dark theme is enabled/disabled to the "Defaults Storage Dictionary". This function will also update the settings page with the correct light/dark theme
        //different color options:

        
        let darkThemeSelected = darkThemeButton.isOn
        
        let defaults = UserDefaults.standard
        defaults.set(darkThemeSelected, forKey: "darkThemeSelected")
        defaults.synchronize()
        print("Is dark theme selected? \(darkThemeSelected)")
        changeTheme(darkThemeSelected: darkThemeSelected)
        
    }
    
    func changeTheme(darkThemeSelected: Bool){
        //function that holds color codes and changes theme accordingly
        let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let black = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        let grayBlack = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        let lightBlue = UIColor(red: 0.252, green: 0.507, blue: 0.969, alpha: 1.0)
        
        if darkThemeSelected == true {
            self.view.backgroundColor = grayBlack
            defaultTipBar.tintColor = white
            darkThemeButton.tintColor = white
            tipPercentageLabel.textColor =  white
            darkThemeLabel.textColor = white
            print("enabling dark theme")
        }
        else{
            self.view.backgroundColor = white
            defaultTipBar.tintColor = lightBlue
            darkThemeButton.tintColor = lightBlue
            tipPercentageLabel.textColor = lightBlue
            darkThemeLabel.textColor = lightBlue
            print("disabling dark theme")
        }
    }
  
    func updateDefaultDarkTheme(){
        //This function will check the defaults settings in storage and will update the Dark Theme button to reflect the whether it was on or off the last time the user closed the app.
        let defaults = UserDefaults.standard
        let defaultDarkThemeSelected = defaults.bool(forKey: "darkThemeSelected")
        darkThemeButton.isOn = defaultDarkThemeSelected
        defaults.synchronize()
        print("Updated state of DarkTheme Button with the user's selection when he most recently exited the app.")
        changeTheme(darkThemeSelected: defaultDarkThemeSelected)
    }
    
    func updateDefaultTipBar(){
        //This function will check the defaults settings in storage and will update the UISegmentControl to reflect the defaults
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
