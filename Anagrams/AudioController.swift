//
//  AudioController.swift
//  Anagrams
//
//  Created by NamNH on 3/27/17.
//  Copyright © 2017 Caroline. All rights reserved.
//

import AVFoundation

class AudioController {
    private var audio = [String: AVAudioPlayer]()
    
    var player: AVAudioPlayer?
    
    func preloadAudioEffects(audioFileNames: [String]) {
        for effect in AudioEffectFiles {
            // 1 get path
            let soundPath = Bundle.main.path(forResource: effect, ofType: nil)
            let soundURL = NSURL.fileURL(withPath: soundPath!)
            
            // 2 load file contents
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                guard let player = player else {
                    return
                }
                player.numberOfLoops = 0
                player.prepareToPlay()
                audio[effect] = player
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func playerEffect(name: String) {
        if let player = audio[name] {
            if player.isPlaying {
                player.currentTime = 0
            } else {
                player.play()
            }
        }
    }
}
