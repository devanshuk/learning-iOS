//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    var left = 1
    var right = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        diceImageViewOne.image = getDiceFace(left)
        diceImageViewTwo.image = getDiceFace(right)
        
        left = (left + 1).coercedIn(1...6)
        right = (right - 1).coercedIn(1...6)
    }
    
    func getDiceFace(_ index: Int) -> UIImage {
        var allFaces = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        return UIImage(named: allFaces[index.coercedIn(1...6) - 1])!
    }
}

