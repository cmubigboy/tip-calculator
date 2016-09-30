//
//  ViewController.swift
//  Tip the Help
//
//  Created by CMU Bigboy on 9/26/16.
//  Copyright © 2016 Bryan Meyer. All rights reserved.
//

import UIKit
// global variable so it does not get reset every time the object is created
var initializedTips = false

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("func viewDidLoad")
        // on initial load, reset tipping values to 18, 20, 25
        if !initializedTips {
            print("..initializing tips")
            defaults.set("18%",forKey: "lowTip")
            defaults.set("20%",forKey: "midTip")
            defaults.set("25%",forKey: "highTip")
            initializedTips = true
        } else {
            print("..already initialized tips")
        }
        
        print(self.navigationController?.navigationBar.topItem!.title)
        
        // Do any additional setup after loading the view, typically from a nib.
        print("..ViewController-->viewDidLoad")
        print("..defaults L/M/H = ",defaults.object(forKey: "lowTip")!,", ",defaults.object(forKey: "midTip")!,", ",defaults.object(forKey: "highTip")!)

        let tempLowTip = "\(defaults.object(forKey: "lowTip")!)"
        let tempMidTip = "\(defaults.object(forKey: "midTip")!)"
        let tempHighTip = "\(defaults.object(forKey: "highTip")!)"
        tipControl.setTitle(tempLowTip, forSegmentAt: 0)
        tipControl.setTitle(tempMidTip, forSegmentAt: 1)
        tipControl.setTitle(tempHighTip, forSegmentAt: 2)
        print("..tipControl[0,1,2] = ",tipControl.titleForSegment(at: 0)!,", ",tipControl.titleForSegment(at: 1)!," ",tipControl.titleForSegment(at: 2)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        //print("tipControl.selectedSegmentIndex = \(tipControl.selectedSegmentIndex)")
        let strTipPercentage = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)!
        //print("strTipPercentage = \(strTipPercentage)")
        let tipPercentage = (strTipPercentage as NSString).doubleValue / 100
        //print("tipPercentage = \(tipPercentage)")
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        print("func unwindToThisViewController just called!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("func viewWillAppear")
        self.navigationController?.navigationBar.topItem!.title = "Tip the Help"
        let tempLowTip = "\(defaults.object(forKey: "lowTip")!)"
        let tempMidTip = "\(defaults.object(forKey: "midTip")!)"
        let tempHighTip = "\(defaults.object(forKey: "highTip")!)"
        tipControl.setTitle(tempLowTip, forSegmentAt: 0)
        tipControl.setTitle(tempMidTip, forSegmentAt: 1)
        tipControl.setTitle(tempHighTip, forSegmentAt: 2)
        print("..tipControl[0,1,2] = ",tipControl.titleForSegment(at: 0)!,", ",tipControl.titleForSegment(at: 1)!," ",tipControl.titleForSegment(at: 2)!)
        calculateTip(self)
    }

}

