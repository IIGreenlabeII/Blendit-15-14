//
//  StyleKeuze.swift
//  Blendit
//
//  Created by Shailin Biharie on 13-04-15.
//  Copyright (c) 2015 Shailin Biharie. All rights reserved.
//

import Foundation
import UIKit

class StyleKeuze: UIViewController {
    
    @IBOutlet var kies: UILabel!
    @IBOutlet var sportiefButton: UIButton!
    @IBOutlet var zakelijkButton: UIButton!
    @IBOutlet var chicButton: UIButton!
    @IBOutlet var trendyButton: UIButton!
    @IBOutlet var casualButton: UIButton!
    
    var type = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func casualAction(sender: AnyObject)
    {
        return type = "Casual"
    }
    @IBAction func sportAction(sender: AnyObject)
    {
        return type = "Sport"
    }
    @IBAction func chicAction(sender: AnyObject)
    {
        return type = "Chic"
    }
    @IBAction func zakelijkAction(sender: AnyObject)
    {
        return type = "Casual"
    }
    @IBAction func trendyAction(sender: AnyObject)
    {
        return type = "Casual"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : CasualKledingstukken = segue.destinationViewController as! CasualKledingstukken
        
        DestViewController.stijl = type
    }
}