//
//  CasualKledingstukken.swift
//  Blendit
//
//  Created by Shailin Biharie on 13-04-15.
//  Copyright (c) 2015 Shailin Biharie. All rights reserved.
//

import Foundation
import UIKit

class CasualKledingstukken: UIViewController {
    
    @IBOutlet var showStijl: UILabel!
    @IBOutlet var tekstLabel: UILabel!
    @IBOutlet var blauweKnop: UIButton!
    @IBOutlet var bruineKnop: UIButton!
    @IBOutlet var brilKnop: UIButton!
    
    var stijl = String()
    var soort = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showStijl.text = stijl
        
            switch(stijl){
            case "Casual":
                NSLog("Stijl Casual")
                tekstLabel.text = "Selecteer een kledingstuk"
                bruineKnop.setTitle("Hoofddeksels", forState: UIControlState.Normal)
                blauweKnop.setTitle("Shirts", forState: UIControlState.Normal)
                brilKnop.setTitle("Brillen", forState: UIControlState.Normal)
                break
            default:
                break
            }
    }
    
    @IBAction func brownAction(sender: AnyObject) {
        return soort = "Hoofddeksels"
    }
    @IBAction func blueAction(sender: AnyObject) {
        return soort = "Shirts"
    }
    @IBAction func brilAction(sender: AnyObject) {
        return soort = "Brillen"
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : Kledingsoorten = segue.destinationViewController as! Kledingsoorten
        
        DestViewController.stijl = stijl
        DestViewController.soort = soort
    }

    
}