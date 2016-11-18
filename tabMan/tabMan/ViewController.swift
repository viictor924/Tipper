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
    
  
    @IBOutlet weak var billView: UIView!
    @IBOutlet weak var mathView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
        

        
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
        recalculate(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")

        
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateTipBar(){
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "defaultTipIndexSelected")
        tipBar.selectedSegmentIndex = defaultTipIndex
        defaults.synchronize()
        print("Current default Index is %f", defaultTipIndex)
        
    }
   
    @IBAction func recalculate(_ sender: AnyObject) {
                 //beware: Hard coding position values before, if keyboard type or iOS device is changed, app won't function as intended.
        if (billLabel.text?.isEmpty)!{
            // if field has no text
            UIView.animate(withDuration: 0.4, animations: {
                self.billView.frame.origin.y = 200
                self.mathView.frame.origin.y = 450
                self.mathView.alpha = 0
            })
        }
        else{ // if field has text
            UIView.animate(withDuration: 0.4, animations: {
                self.billView.frame.origin.y = 100
                self.mathView.frame.origin.y = 200
                self.mathView.alpha = 1
            })
        }
        
        let tipSegments = [0.18, 0.20, 0.25]
        billLabel.becomeFirstResponder()
        
        let bill = Double(billLabel.text!) ?? 0
        let tip = bill * tipSegments[tipBar.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
  
}



