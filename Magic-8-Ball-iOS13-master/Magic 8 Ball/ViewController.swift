//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!


    @IBAction func askButtonPresses(_ sender: UIButton) {
        imageView.image = getBall(number: Int.random(in: 1...5))
    }
    
    func getBall(number index: Int) -> UIImage {
        return UIImage(named: "ball\(index.coerced(in: 1...5))")!
    }
    
}

