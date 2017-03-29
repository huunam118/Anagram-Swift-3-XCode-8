//
//  HUDView.swift
//  Anagrams
//
//  Created by NamNH on 3/24/17.
//  Copyright © 2017 Caroline. All rights reserved.
//

import UIKit

class HUDView: UIView {
    var stopWatch: StopWatchView
    var gamePoints: CounterLabelView
    var hintButton: UIButton
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("use init(fram: )")
    }
    
    override init(frame: CGRect) {
        
        // stop watch
        self.stopWatch = StopWatchView(frame: CGRect(x: ScreenWidth / 2 - 150, y: 0, width: 300, height: 100))
        self.stopWatch.setSeconds(0)
        
        // game point view
        self.gamePoints = CounterLabelView(font: FontHUD!, frame: CGRect(x: ScreenWidth - 200, y: 30, width: 200, height: 70))
        self.gamePoints.textColor = UIColor(red: 0.38, green: 0.098, blue: 0.035, alpha: 1)
        self.gamePoints.value = 0
        
        // hint button
        let hintButtonImage = UIImage(named: "btn")
        self.hintButton = UIButton.init(type: .custom)
        hintButton.setTitle("Hint!", for: .normal)
        hintButton.titleLabel?.font = FontHUD
        hintButton.setBackgroundImage(hintButtonImage, for: .normal)
        hintButton.frame = CGRect(x: 50, y: 30, width: (hintButtonImage?.size.width)!, height: (hintButtonImage?.size.height)!)
        hintButton.alpha = 0.8
        
        super.init(frame: frame)
        
        // add 3 subviews
        self.addSubview(self.stopWatch)
        self.addSubview(self.gamePoints)
        self.addSubview(self.hintButton)
        
        let pointLabel = UILabel(frame: CGRect(x: ScreenWidth - 340, y: 30, width: 140, height: 70))
        pointLabel.backgroundColor = UIColor.clear
        pointLabel.font = FontHUD
        pointLabel.text = " Points:"
        self.addSubview(pointLabel)
        
        
        self.isUserInteractionEnabled = true
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if hitView is UIButton {
            return hitView
        }
        return nil
    }

}
