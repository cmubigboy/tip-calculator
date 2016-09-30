//
//  SettingsViewController.swift
//  Tip the Help
//
//  Created by CMU Bigboy on 9/26/16.
//  Copyright © 2016 Bryan Meyer. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
/*let defaults = NSUserDefaults.standardUserDefaults()
 defaults.setObject("some_string_to_save", forKey: "some_key_that_you_choose")
 defaults.setInteger(123, forKey: "another_key_that_you_choose")
 defaults.synchronize()*/
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var lowTipField: UITextField!
    @IBOutlet weak var midTipField: UITextField!
    @IBOutlet weak var highTipField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let str = defaults.object(forKey: "lowTip")! as? String {
            print("viewDidLoad-->lowTip  = \(str)")
            lowTipField.text = str
        } else {
            print("setting 18% as the default lowTip")
            defaults.set("18%",forKey: "lowTip")
        }
        if let str = defaults.object(forKey: "midTip")! as? String {
            print("viewDidLoad-->midTip  = \(str)")
            midTipField.text = str
        } else {
            print("setting 20% as the default midTip")
            defaults.set("20%",forKey: "midTip")
            midTipField.text = "20%"
        }
        if let str = defaults.object(forKey: "highTip")! as? String {
            print("viewDidLoad-->highTip = \(str)")
            highTipField.text = str
        } else {
            print("setting 25% as the default highTip")
            defaults.set("25%",forKey: "highTip")
            highTipField.text = "25%"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("func didReceiveMemoryWarning")
    }
    

    @IBAction func onTapSettings(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    
    @IBAction func updateTipOptions(_ sender: AnyObject) {
        var tipPercentageText : String
        var str : String
        var tipPercentage : Double
        print("func updateTipOptions")
        print("..TipFields L/M/H  = \(lowTipField.text!), \(midTipField.text!), \(highTipField.text!)")
        
        // store formatted lowTip
        str = lowTipField.text!
        tipPercentage = (str as NSString).doubleValue
        if (tipPercentage - Double(Int(tipPercentage))) == 0 {
            tipPercentageText = "\(String(format: "%.0f",tipPercentage))%"
        } else {
            tipPercentageText = "\(tipPercentage)%"
        }
        defaults.set(tipPercentageText,forKey: "lowTip")
        
        // store formatted midTip
        str = midTipField.text!
        tipPercentage = (str as NSString).doubleValue
        if (tipPercentage - Double(Int(tipPercentage))) == 0 {
            tipPercentageText = "\(String(format: "%.0f",tipPercentage))%"
        } else {
            tipPercentageText = "\(tipPercentage)%"
        }
        defaults.set(tipPercentageText,forKey: "midTip")
        
        // store formatted highTip
        str = highTipField.text!
        tipPercentage = (str as NSString).doubleValue
        if (tipPercentage - Double(Int(tipPercentage))) == 0 {
            tipPercentageText = "\(String(format: "%.0f",tipPercentage))%"
        } else {
            tipPercentageText = "\(tipPercentage)%"
        }
        defaults.set(tipPercentageText,forKey: "highTip")
        
        //print("..tipPercentageText = \(tipPercentageText)")
        
        print("..globalTips L/M/H = \(defaults.object(forKey: "lowTip")!), \(defaults.object(forKey: "midTip")!), \(defaults.object(forKey: "highTip")!)")
        //print("lowTip = ",defaults.object(forKey: "lowTip")!)
        //print("midTip = ",defaults.object(forKey: "midTip")!)
        //print("highTip = ",defaults.object(forKey: "highTip")!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print("func prepare just got called!")
    }
    */

}
