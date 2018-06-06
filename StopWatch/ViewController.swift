//
//  ViewController.swift
//  StopWatch
//
//  Created by 吉川莉央 on 2018/06/06.
//  Copyright © 2018年 RioYoshikawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: Any) {
        hanteiLabel.text = ""
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(_ sender: Any) {
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        label.text = String(count)
    }
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f",count)
    }
    
    @objc func hantei(){
        if count > 9.80 && count < 10.20{
            hanteiLabel.text = "PERFECT!"
        }else if count > 9.70 && count < 10.30{
            hanteiLabel.text = "GREAT!"
        }else if count > 9.50 && count < 10.50{
            hanteiLabel.text = "GOOD!"
        }else {
            hanteiLabel.text = "BAD!"
        }
            
        
    }
}

