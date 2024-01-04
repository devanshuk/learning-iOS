//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        delayBlockFor(milliSeconds: 100, block: {
            sender.alpha = 1.0
            if let key = sender.titleLabel?.text {
                self.playSound(forKey: key) // button labels == resource IDs here and so this works here, else we would've used a dictionary
            }
        })
    }
    
    func playSound(forKey key: String) {
        guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
            player = try! AVAudioPlayer(contentsOf: url)
            player?.play()
                    
        }

    func delayBlockFor(milliSeconds: Int, block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + DispatchTimeInterval.milliseconds(milliSeconds),
            execute: block
        )
    }

}

