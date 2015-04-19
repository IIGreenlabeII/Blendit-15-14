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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
//        button.frame = CGRectMake(100, 100, 100, 50)
//        button.backgroundColor = UIColor.greenColor()
//        button.setTitle("Test Button", forState: UIControlState.Normal)
//        button.addTarget(self, action: "closeCamera:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        self.view.addSubview(button)
        
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
            NSLog(soort)
            let image = UIImage(named: "RedCap")
            let imageView = UIImageView(image: image)
            soortImage.setBackgroundImage(image, forState:UIControlState.Normal)
            ("Hoofddeksels", forState: UIControlState.Normal)
            break
        case "Brillen":
            NSLog(soort)
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
            previewLayer?.removeFromSuperlayer()
            NSLog("Close")
            break
        default:
            break
        }
    }
    
    func beginSession() {
        
        var bb: CALayer {
            return backButton.layer
        }

        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        switch(check){
        case "show":
            switch(soort){
                case "Hoofddeksels":
                    var imageName = "frontCap.png"
                    var image = UIImage(named: imageName)
                    var imageView = UIImageView(image: image!)
                    
                    var im: CALayer {
                        return imageView.layer
                    }
                    
                    imageView.frame = CGRect(x: 105, y: 100, width: 197, height: 159)
                    
                    self.view.layer.insertSublayer(im, above: previewLayer)
                    break
                case "Brillen":
                    var imageName = "Sunglasses.png"
                    var image = UIImage(named: imageName)
                    var imageView = UIImageView(image: image!)
                    
                    var im: CALayer {
                        return imageView.layer
                    }
                    
                    imageView.frame = CGRect(x: 130, y: 200, width: 180, height: 100)
                    
                    self.view.layer.insertSublayer(im, above: previewLayer)
                    break
                default:
                    break
            }
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
