//
//  Kledingsoorten
//  Blendit
//
//  Created by Shailin Biharie on 13-04-15.
//  Copyright (c) 2015 Shailin Biharie. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Kledingsoorten: UIViewController {
    
    @IBOutlet var kledingsoort: UILabel!
    @IBOutlet var soortImage: UIButton!
    @IBOutlet var backButton: UIButton!
    
    let captureSession = AVCaptureSession()

    var previewLayer : AVCaptureVideoPreviewLayer?
    var captureDevice : AVCaptureDevice?
    var stijl = String()
    var soort = String()
    var check = String()
    
    var bb: CALayer {
        return backButton.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kledingsoort.text = stijl + " -> " + soort
        
        // Do any additional setup after loading the view, typically from a nib.
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        
        let devices = AVCaptureDevice.devices()
        
        // Loop through all the capture devices on this phone
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Front) {
                    captureDevice = device as? AVCaptureDevice
                }
            }
        }
        
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
        check = "show"
        if captureDevice != nil {
            beginSession()
        }
    }
    
    @IBAction func closeCamera(sender: AnyObject) {
        check = "close"
        switch(check){
        case "close":
            backButton.setTitle(" ", forState: UIControlState.Normal)
            NSLog("Close")
            break
        default:
            break
        }
        previewLayer?.removeFromSuperlayer()
    }
    
    func beginSession() {
        
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        switch(check){
        case "show":
            backButton.setTitle("Sluit camera", forState: UIControlState.Normal)
            NSLog("Komt door")
            break
        default:
            break
        }
        self.view.layer.insertSublayer(bb, above: previewLayer)
        previewLayer?.frame = self.view.layer.frame
        captureSession.startRunning()
    }
}
