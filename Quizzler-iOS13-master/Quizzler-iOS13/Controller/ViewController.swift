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
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateProgress(progress: 0.0)
        updateQuestion()
    }
    
    func nextQuestion() {
        quizBrain.nextQuestion()
        delayBlockFor(milliSeconds: 500, block: {
            self.updateQuestion()
            self.updateProgress(progress: self.quizBrain.getProgress())
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        })
    }
    
    func updateProgress(progress: Float) {
        progressBar.progress = progress
    }
    
    func updateQuestion() {
        questionLabel.text = quizBrain.getQuestionText()
    }
 
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle ?? ""
        let userIsCorrect = quizBrain.isCorrect(answer: userAnswer)
        if(userIsCorrect) {
            sender.backgroundColor = UIColor.green
            nextQuestion()
        } else {
            // show error
            sender.backgroundColor = UIColor.red
        }
    }
    
    func delayBlockFor(milliSeconds: Int, block: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: .now() + DispatchTimeInterval.milliseconds(milliSeconds),
            execute: block
        )
    }
    

}

