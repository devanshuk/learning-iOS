//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Devanshu Kaushik on 07/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
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
    
    private var questionNumber = 0
    
    func getQuestionText() -> String {
        return quiz[questionNumber].label
    }
    
    mutating func nextQuestion() {
        if(questionNumber < quiz.count - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber+1)/Float(quiz.count)
    }
    
    func isCorrect(answer: String) -> Bool {
        return quiz[questionNumber].answer == answer
    }
    
    
}
