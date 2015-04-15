//
//  Kledingsoorten
//  Blendit
//
//  Created by Shailin Biharie on 13-04-15.
//  Copyright (c) 2015 Shailin Biharie. All rights reserved.
//

import Foundation
import UIKit

class Kledingsoorten: UIViewController {
    
    @IBOutlet var kledingsoort: UILabel!
    @IBOutlet var soortImage: UIButton!
    
    var stijl = String()
    var soort = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kledingsoort.text = stijl + " -> " + soort
        
        switch(soort){
        case "Hoofddeksels":
            NSLog("Soort Hoofddeksels")
            let image = UIImage(named: "RedCap")
            let imageView = UIImageView(image: image)
            soortImage.setBackgroundImage(image, forState:UIControlState.Normal)
            ("Hoofddeksels", forState: UIControlState.Normal)
            break
        case "Brillen":
            NSLog("Soort Brillen")
            let image = UIImage(named: "SunglassesR")
            let imageView = UIImageView(image: image)
            soortImage.setBackgroundImage(image, forState:UIControlState.Normal)
            ("Hoofddeksels", forState: UIControlState.Normal)
            break
        default:
            break
        }

        
    }
    @IBAction func kledingstukAction(sender: AnyObject) {
        NSLog("Pet")
    }
}