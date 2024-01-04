//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let boilTimeDict = ["Soft" : 5/*5*60*/, "Medium": 8/*8*60*/, "Hard": 12/*12*60*/]
    var timer: Timer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        resetTimer()
        if let selectedHardness = sender.currentTitle {
            startTimer(for: selectedHardness)
        }
    }
    
    func startTimer(for selectedHardness: String) {
        if let boilTime = boilTimeDict[selectedHardness] {
            print("You want your eggs \(selectedHardness), boil for:")
            timer = countDown(from: boilTime) { secondsRemaining in
                print("\(secondsRemaining) seconds.")
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
    }
    
    func countDown(from value: Int, block: @escaping (Int) -> Void) -> Timer {
        var secondsRemaining = value
        return Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            if secondsRemaining > 0 {
                block(secondsRemaining)
                secondsRemaining -= 1
            } else {
                timer.invalidate()
                self.titleLabel.text = "Done"
            }
        }
    }
    

}
