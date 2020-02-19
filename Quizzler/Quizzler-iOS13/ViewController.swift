//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let quiz = [
        Question(text: "2 + 4 = 5", answer: false),
        Question(text: "3 + 1 = 4", answer: true),
    ]
    
    var currentQuestionNumber = 0
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = Bool(sender.currentTitle!.lowercased())
        let rightAnswer = quiz[currentQuestionNumber].answer

        if userAnswer == rightAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        if currentQuestionNumber + 1 < quiz.count {
            currentQuestionNumber += 1
        } else {
            currentQuestionNumber = 0
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz[currentQuestionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

        progressBar.progress = Float(currentQuestionNumber + 1) / Float(quiz.count)
    }
}
