//
//  CounterLabelView.swift
//  Anagrams
//
//  Created by NamNH on 3/24/17.
//  Copyright © 2017 Caroline. All rights reserved.
//

import UIKit

class CounterLabelView: UILabel {
    var value: Int = 0 {
        didSet {
            self.text = " \(value)"
        }
    }
    
    var endValue: Int = 0
    var timer: Timer? = nil
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("use init(font: frame: ")
    }
    
    init(font: UIFont, frame: CGRect) {
        super.init(frame: frame)
        self.font = font
        self.backgroundColor = UIColor.clear
    }
    
    func updateValue(timer: Timer) {
        if (endValue < value) {
            value -= 1
        } else {
            value += 1
        }
        
        if (endValue == value) {
            timer.invalidate()
            self.timer = nil
        }
    }
    
    func setValue(newValue: Int, duration: Float) {
        endValue = newValue
        
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        
        let delta = abs(endValue - value)
        if (delta != 0) {
            var interval = Double(duration / Float(delta))
            if interval < 0.01 {
                interval = 0.01
            }
            timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.updateValue(timer:)), userInfo: nil, repeats: true)
        }
        
    }
}
