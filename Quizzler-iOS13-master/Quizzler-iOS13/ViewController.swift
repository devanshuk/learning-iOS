//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        "Four + Two equals Six",
        "Five - Three is greater than One",
        "Three + Eight is less than Ten"
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.0
        loadQuestionNumber(0)
    }
    
    func loadQuestionNumber(_ num: Int) {
        questionLabel.text = quiz[num]
    }
    
    func nextQuestion() {
        progressBar.progress = Float(questionNumber+1)/Float(quiz.count)
        if(questionNumber < quiz.count - 1) {
            questionNumber += 1
            loadQuestionNumber(questionNumber)
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        nextQuestion()
    }
    

}

