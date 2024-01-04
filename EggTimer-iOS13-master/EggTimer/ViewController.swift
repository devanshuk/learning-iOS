//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let boilTimeDict = ["Soft" : 5/*5*60*/, "Medium": 8/*8*60*/, "Hard": 12/*12*60*/]
    var timer: Timer?
    var selectedHardness: String?
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        resetTimer()
        if let selectedHardness = sender.currentTitle {
            self.selectedHardness = selectedHardness
            startTimer(for: selectedHardness)
        }
    }
    
    func startTimer(for selectedHardness: String) {
        if let boilTime = boilTimeDict[selectedHardness] {
            print("You want your eggs \(selectedHardness), boil for:")
            timer = countDown(from: boilTime) { secondsRemaining in
                self.updateProgress(secondsRemaining: secondsRemaining)
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        progressView.setProgress(0.0, animated: false)
    }
    
    func updateProgress(secondsRemaining: Int) {
        print("\(secondsRemaining) seconds.")
        
        if let hardness = selectedHardness {
            if let boilTime = boilTimeDict[hardness] {
                progressView
                    .setProgress(
                        Float(
                            boilTime-secondsRemaining
                        )/Float(boilTime),
                        animated: true
                    )
            }
        }
        
    }
    
    func countDown(
        from value: Int,
        block: @escaping (Int) -> Void
    ) -> Timer {
        var secondsRemaining = value
        return Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            if secondsRemaining > 0 {
                block(secondsRemaining)
                secondsRemaining -= 1
            } else {
                timer.invalidate()
                self.progressView.setProgress(1.0, animated: true)
                self.titleLabel.text = "Done"
                self.playCompletionSound()
            }
        }
    }
    
    func playCompletionSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "wav") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
    }
    
    
}
