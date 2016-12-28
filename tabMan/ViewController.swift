//
//  ViewController.swift
//  tabMan
//
//  Created by victor rodriguez on 11/15/16.
//  Copyright © 2016 Victor Rodriguez. All rights reserved.
//

import UIKit



class ViewController: UIViewController {


    
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipBar: UISegmentedControl!
    @IBOutlet weak var tipLabelTitle: UILabel!
    @IBOutlet weak var totalLabelTitle: UILabel!
    
  
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var mathView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
        
        //This notification center magic calls my updateBillLabel function whenever the user enters the app.
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.updateBillLabel), name:
            NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
        updateBillLabel()
        updateDarkTheme()
        print("updating bill label with last bill")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //view.endEditing(true)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        updateTipBar()
        updateDarkTheme()
        recalculate(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    
    

    @IBAction func onTap(_ sender: AnyObject) {
        //This is commented so that keyboard doesn't disappear. I could delete the whole function but I'm keeping it on here as a placeholder in case I want to use it later.
        //view.endEditing(true)
    }
    
    func updateBillLabel(){
        //This function should be ran every time we want to update the Bill text field with the default values.
        //Basically, call this function whenever the user enters the app.
        let defaults = UserDefaults.standard
        let lastBillAmount = defaults.string(forKey: "lastBillAmount")
      
        let lastTimeBillWasSaved = defaults.value(forKey: "lastTimeBillWasSaved")
        
        //Check if lastTimeBillWas saved is nil, for example, when the user enters the app for the first time there is no "lastTimeBillWasSaved"
        if lastTimeBillWasSaved != nil{
            let lastTimeBillWasSaved = defaults.object(forKey: "lastTimeBillWasSaved") as! NSDate
            print(lastTimeBillWasSaved.timeIntervalSinceNow)
            if lastTimeBillWasSaved.timeIntervalSinceNow > -600{
                // if Time Interval is less than 10min, update bill label with last bill saved
                print("Bill Saved: less than 10min has passed since app was closed")
                billLabel.text = lastBillAmount
            }
            else{
                //if more than 10min, don't do anything so that label is nil
                print("Bill Erased: more than 10min has passed since app was closed")
                billLabel.text = nil
            }
            
        }
        
        defaults.synchronize()
        print("last bill was \(lastBillAmount)")
        
    }
    
    func updateTipBar(){
        //This function updates the Tip Bar with the default Tip Percentage setting
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "defaultTipIndexSelected")
        tipBar.selectedSegmentIndex = defaultTipIndex
        defaults.synchronize()
        print("Current default Index is %f", defaultTipIndex)
    }

    func updateDarkTheme(){
        //This function enables/disables the Dark Theme according to what the user selected in the settings
        
        let defaults = UserDefaults.standard
        let defaultDarkTheme = defaults.bool(forKey: "darkThemeSelected")
changeTheme(darkThemeSelected: defaultDarkTheme)
        defaults.synchronize()
        print("enabling light theme")
    }
    
    func changeTheme(darkThemeSelected: Bool){
        //function that holds color codes and changes theme accordingly
        let white = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let black = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        let grayBlack = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        let lightBlue = UIColor(red: 0.252, green: 0.507, blue: 0.969, alpha: 1.0)
        
        if darkThemeSelected == true {
            self.view.backgroundColor = grayBlack
            billLabel.textColor = white
            tipBar.tintColor = white
            tipLabel.textColor = white
            totalLabel.textColor = white
            tipLabelTitle.textColor = white
            totalLabelTitle.textColor = white
            print("enabling dark theme")
        }
        else{
            self.view.backgroundColor = white
            billLabel.textColor = lightBlue
            tipBar.tintColor = lightBlue
            tipLabel.textColor = lightBlue
            totalLabel.textColor = lightBlue
            tipLabelTitle.textColor = lightBlue
            totalLabelTitle.textColor = lightBlue
            print("disabling dark theme")
        }
    }
    
    func updateBillDefaults(_ sender: AnyObject) {
        //This function is called when a user clicks on the UISegmentControl. The function then saves the toggled percentage to the "Defaults Storage Dictionary"
        let defaults = UserDefaults.standard
        
        let lastBillAmount = billLabel.text
        defaults.set(lastBillAmount, forKey: "lastBillAmount")
        
        
        defaults.synchronize()
    }
    
    @IBAction func recalculate(_ sender: AnyObject) {
                 //beware: Hard coding position values below. If keyboard type or iOS device is changed, then app won't function as intended.
        if (billLabel.text?.isEmpty)!{
            // if field has no text
            //move text field down and hide Tip/Total Bill
            UIView.animate(withDuration: 0.4, animations: {
                self.billView.frame.origin.y = 200
                self.mathView.frame.origin.y = 450
                self.mathView.alpha = 0
            })
        }
        else{ // if field has text
            //move text field up and display Tip/Total Bill
            UIView.animate(withDuration: 0.4, animations: {
                self.billView.frame.origin.y = 100
                self.mathView.frame.origin.y = 200
                self.mathView.alpha = 1
            })
        }
        
        //array with tip percentages in decimal format
        let tipSegments = [0.18, 0.20, 0.25]
       
        //make bill text field into the first responder
        billLabel.becomeFirstResponder()
        
        //Calculate Tip and Total Bill
        let bill = Double(billLabel.text!) ?? 0
        let tip = bill * tipSegments[tipBar.selectedSegmentIndex]
        let total = bill + tip
        
        //update Tip and Total Bill labels with new values
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
       
        //Bill amount is to be saved after any recalculation
        updateBillDefaults(self)
        
    }
  
}



