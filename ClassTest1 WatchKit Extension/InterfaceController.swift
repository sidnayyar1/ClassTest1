//
//  InterfaceController.swift
//  ClassTest1 WatchKit Extension
//
//  Created by Sidharth Nayyar on 8/20/20.
//  Copyright © 2020 Sidharth Nayyar. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController,WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }

    @IBOutlet weak var genderImage: WKInterfaceImage!
    @IBOutlet weak var resultLabel: WKInterfaceLabel!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
               if(WCSession.isSupported())
               {
                   WCSession.default.delegate = self
                   WCSession.default.activate()
               }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
          
              WKInterfaceDevice().play(.click)
                 
          print("Message Received \(message)")
          
          resultLabel.setText((message["BMI"] as! String))
        genderImage.setImage(UIImage(named: message["Gender"] as! String))
        
      }

}
