//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let boilTimeDict = ["Soft" : 5, "Medium": 8, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let selectedHardness = sender.currentTitle {
            if let boilTime = boilTimeDict[selectedHardness] {
                print("You want your eggs \(selectedHardness), boil for \(boilTime) mins")
            }
        }
    }
    

}
