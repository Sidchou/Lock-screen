//
//  ViewController.swift
//  Lock screen
//
//  Created by ching Hsi chou on 2/8/19.
//  Copyright © 2019 ching Hsi chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderR: UISlider!
    @IBOutlet weak var sliderG: UISlider!
    @IBOutlet weak var sliderB: UISlider!
    @IBOutlet weak var unlockLabel: UIButton!
    @IBOutlet weak var labelR: UILabel!
    @IBOutlet weak var labelG: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var text: UILabel!
    var passWord = ""
    var input = ""
    var wrong = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lightRed = UIColor(red:0.9, green:0.07, blue:0.1, alpha:1.00)
        let darkRed  = UIColor(red:0.35, green:0.1, blue:0.15, alpha:1.00)
        let lightGreen = UIColor(red:0.07, green:0.71, blue:0.05, alpha:1.00)
        let darkGreen  = UIColor(red:0.01, green:0.35, blue:0.05, alpha:1.00)
        let lightBlue = UIColor(red:0.05, green:0.71, blue:0.90, alpha:1.00)
        let darkBlue  = UIColor(red:0.01, green:0.20, blue:0.31, alpha:1.00)
//        let lockCode = UIColor(red:0.1, green:0.1, blue:0.4, alpha:1.00)
        
        let clearImage = UIImage(color: UIColor.gray, size: CGSize(width: 20, height: 25))
        let lightRedImage = UIImage(color: lightRed, size: CGSize(width: 1, height: 25))
        let darkRedImage = UIImage(color: darkRed, size: CGSize(width: 1, height: 25))
        let lightGreenImage = UIImage(color: lightGreen, size: CGSize(width: 1, height: 25))
        let darkGreenImage = UIImage(color: darkGreen, size: CGSize(width: 1, height: 25))
        let lightBlueImage = UIImage(color: lightBlue, size: CGSize(width: 1, height: 25))
        let darkBlueImage = UIImage(color: darkBlue, size: CGSize(width: 1, height: 25))
        
        let sliders: [UISlider] = [sliderR,sliderG,sliderB]
        var minImage = [lightRedImage,lightGreenImage,lightBlueImage]
        var maxImage = [darkRedImage,darkGreenImage,darkBlueImage]
        
//        for (index, slider) in sliders.enumerated() {
//
//        }
//
//        for slider in sliders {
//
//        }
        var R = "0"
        var G = "0"
        var B = "0"
        R = NSString(format:"%02X", Int(0.35*255)) as String
        G = NSString(format:"%02X", Int(0.4*255)) as String
        B = NSString(format:"%02X", Int(255)) as String
        passWord = R + G + B
    unlockLabel.setTitleColor(.init(displayP3Red: 0.35, green: 0.4, blue: 1, alpha: 1), for: .normal)
        print("pass code = \(passWord)")
        
        for (index, slider) in  sliders.enumerated() {
        slider.setThumbImage(clearImage, for: .normal)
        slider.setMinimumTrackImage(minImage[index], for: .normal)
        slider.setMaximumTrackImage(maxImage[index], for: .normal)
        slider.clipsToBounds = true
        }
//        unlockLabel.textColor = lockCode
        text.isHidden = true
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 48.0)

    }
    
    @IBAction func handleSlider(_ sender: UISlider) {
        
        let sliders: [UISlider] = [sliderR,sliderG,sliderB]
        let labels :[UILabel] = [labelR,labelG,labelB]
        
        var sliderValueR = "0"
        var sliderValueG = "0"
        var sliderValueB = "0"
//        sliderValueR = Int(sliders[0].value)
//        labels[0].text = "R:\(sliderValueR)"
//
//        sliderValueG = Int(sliders[1].value)
//        labels[1].text = "R:\(sliderValueG)"
//
//        sliderValueB = Int(sliders[2].value)
//        labels[2].text = "R:\(sliderValueB)"
        
        sliderValueR = NSString(format:"%02X", Int(sliders[0].value)) as String
        labels[0].text = "R:\(sliderValueR)"
        
        sliderValueG = NSString(format:"%02X", Int(sliders[1].value)) as String
        labels[1].text = "G:\(sliderValueG)"
        
        sliderValueB = NSString(format:"%02X", Int(sliders[2].value)) as String;        labels[2].text = "B:\(sliderValueB)"
        
        view.backgroundColor = UIColor.init(displayP3Red: CGFloat(sliders[0].value/255), green: CGFloat(sliders[1].value/255), blue: CGFloat(sliders[2].value/255), alpha: 1)
        input =  sliderValueR + sliderValueG + sliderValueB
        
}
    
    @IBAction func unlock(_ sender: Any) {

        if input == passWord {
            unlock()
        }else{
            lock()
        }
    }
   
    func unlock(){
        hideall()
        view.backgroundColor = UIColor.white
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
//        label.center = CGPoint(x: 160, y: 285)
        text.text = "unlocked!"
//        self.view.addSubview(label)
    }
    func lock(){
        if wrong == 4 {
            hideall()
            lockout()
        }else{wrong += 1
            view.backgroundColor = UIColor.white
            hideall()
            text.text = "NOPE!"
            delayWithSeconds(1){
                self.showall()
                
            }
            
            
        }
    }
    func lockout(){
        view.backgroundColor = UIColor.red
    
        text.text = "Boo Hoo"
//        self.view.addSubview(label)
    }
 
    func hideall(){
        let sliders : [UISlider] = [sliderR,sliderG,sliderB]
        let labels :[UILabel] = [labelR,labelG,labelB]
        
        for (index, ele) in  sliders.enumerated() {
            ele.isHidden = true
        }
        for (index, ele) in  labels.enumerated() {
            ele.isHidden = true
        }
        unlockLabel.isHidden = true
        text.isHidden = false

    }
    func showall(){
        let sliders : [UISlider] = [sliderR,sliderG,sliderB]
        let labels :[UILabel] = [labelR,labelG,labelB]
        let texts :[String] = ["R:","G:","B:"]
        
        for (index, ele) in  sliders.enumerated() {
            ele.isHidden = false
            ele.setValue(255, animated: true)
            
        }
        for (index, ele) in  labels.enumerated() {
            ele.isHidden = false
            ele.text = texts[index] + "FF"
        }
        unlockLabel.isHidden = false
        text.isHidden = true

    }
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
}


public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
