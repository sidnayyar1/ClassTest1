//
//  ViewController.swift
//  ClassTest1
//
//  Created by Sidharth Nayyar on 8/20/20.
//  Copyright © 2020 Sidharth Nayyar. All rights reserved.
//

import UIKit
import WatchConnectivity
class ViewController: UIViewController,WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var showResultLabel: UILabel!
    
    @IBAction func calculateBMI(_ sender: UIButton) {

         
        
       // let height = Double(heightTextField.text!)
       guard let height = Double(heightTextField.text!) else
             {
                 let alert = UIAlertController(title: "Invalid Height", message: "The hegith you entered is wrong", preferredStyle: .alert)
                 
                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                 
                 self.present(alert, animated: true)
                 return
             }
             
             guard let weight = Double(weightTextField.text!) else
             {
                 let alert = UIAlertController(title: "Invalid Weight", message: "The weight you entered is wrong", preferredStyle: .alert)
                 
                 alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                 
                 self.present(alert, animated: true)
                 return
             }
        
        let bmiCalculate = weight / pow((height/100) , 2)
       
        print(bmiCalculate)
        print("Calculating Type")
        var BMItype = ""
               
               if(bmiCalculate<=18.9)
               {
                   BMItype = "You're underweight"
               }
               else if (bmiCalculate>=19 && bmiCalculate<=24.9)
               {
                   BMItype = "You're Normal"
               }
               else if(bmiCalculate>=25 && bmiCalculate<=29.9)
               {
                   BMItype = "You're overweight"
               }
               else if(bmiCalculate>=30)
               {
                   BMItype = "You're obese"
               }
               
         let gender = genderSegment.selectedSegmentIndex == 0 ? "male" : "female"
               showResultLabel.text = "BMI is \(bmiCalculate) " + BMItype
        
    if(WCSession.default.isReachable)
          {
              print("Watch Reachable")
              WCSession.default.sendMessage(["BMI":"BMI is \(BMItype) \n" + BMItype, "Gender":gender], replyHandler: nil)
          }
          else
          {
              print("Watch Not Reachable")
          }
        }
    }
          
      


