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
        Question(label: "A slug's blood is green.", answer: "True"),
        Question(label: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(label: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(label: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(label: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(label: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(label: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(label: "Google was originally called 'Backrub'.", answer: "True"),
        Question(label: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(label: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(label: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(label: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = 0.0
        loadQuestionNumber(0)
    }
    
    func loadQuestionNumber(_ num: Int) {
        questionLabel.text = quiz[num].label
    }
    
    func nextQuestion() {
        progressBar.progress = Float(questionNumber+1)/Float(quiz.count)
        if(questionNumber < quiz.count - 1) {
            questionNumber += 1
            loadQuestionNumber(questionNumber)
        }
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if(sender.currentTitle == quiz[questionNumber].answer) {
            nextQuestion()
        } else {
            // show error
        }
    }
    

}

