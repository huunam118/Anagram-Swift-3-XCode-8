//
//  ViewController.swift
//  Anagrams
//
//  Created by Caroline on 1/08/2014.
//  Copyright (c) 2014 Caroline. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let controller: GameController
    
    required init?(coder aDecoder: NSCoder) {
        controller = GameController()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gameView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        
        self.view.addSubview(gameView)
        controller.gameView = gameView

        let hud = HUDView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        self.view.addSubview(hud)
        controller.hud = hud
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    func showLevelMenu() {
        let alertController = UIAlertController(title: "Choose Difficulty Level", message: nil, preferredStyle: .alert)
        
        let easy = UIAlertAction(title: "Easy-peasy", style: .default, handler: {
            (alert: UIAlertAction) in
                self.showLevel(1)
        })
        let hard = UIAlertAction(title: "Challenge accepted", style: .default, handler: {
            (alert: UIAlertAction) in
            self.showLevel(2)
        })
        let hardest = UIAlertAction(title: "I'm totally hard-core", style: .default, handler: {
            (alert: UIAlertAction) in
            self.showLevel(3)
        })
        alertController.addAction(easy)
        alertController.addAction(hard)
        alertController.addAction(hardest)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showLevel(_ level: Int) {
        controller.level = Level.init(level: level)
        controller.dealRandomAnagram()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showLevelMenu()
        controller.onAnagramSolved = self.showLevelMenu
    }
}

