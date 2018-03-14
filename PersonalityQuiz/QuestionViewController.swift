//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Illya Kochylo on 3/5/18.
//  Copyright © 2018 Illya Kochylo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var answearChosen: [Answear] = []
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    // single stack view
    @IBOutlet weak var buttonLabel1: UIButton!
    @IBOutlet weak var buttonLabel2: UIButton!
    @IBOutlet weak var buttonLabel3: UIButton!
    @IBOutlet weak var buttonLabel4: UIButton!
    
    
    // multiple stack view
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var swichLabel1: UISwitch!
    
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var swichLabel2: UISwitch!
    
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var swichLabel3: UISwitch!
    
    
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var swichLabel4: UISwitch!
    
    // range stack view
    @IBOutlet weak var rangeLabel1: UILabel!
    @IBOutlet weak var rangeLabel2: UILabel!
    @IBOutlet weak var horizontalSliderLabel: UISlider!
    
    
    
    
    var questionIndex = 0
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answear: [
                    Answear(text: "Steak", type: .dog),
                    Answear(text: "Fish", type: .cat),
                    Answear(text: "Carrotts", type: .rabbit),
                    Answear(text: "Corn", type: .turtle)
            ]),
        
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answear: [
                    Answear(text: "Swimming", type: .turtle),
                    Answear(text: "Sleeping", type: .cat),
                    Answear(text: "Cuddling", type: .rabbit),
                    Answear(text: "Eating", type: .dog)
            ]),
        
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answear: [
                    
                    Answear(text: "I barely notice them", type: .turtle),
                    Answear(text: "I dislike them", type: .cat),
                    Answear(text: "I get a little nervous", type: .rabbit),
                    Answear(text: "I love them", type: .dog)
            
            ])
]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      updateUI()
    
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswears = currentQuestion.answear
        
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
    
        
        questionLabel.text = currentQuestion.text
        progressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswears)
        case .multiple:
            updateMultipleStack(using: currentAnswears)
        case .ranged :
            updateRangeStack(using: currentAnswears)
        }
        
    }
    
    
    func updateSingleStack(using answears: [Answear]) {
        singleStackView.isHidden = false
        buttonLabel1.setTitle(answears[0].text, for: .normal)
        buttonLabel2.setTitle(answears[1].text, for: .normal)
        buttonLabel3.setTitle(answears[2].text, for: .normal)
        buttonLabel4.setTitle(answears[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answears: [Answear]) {
        multipleStackView.isHidden = false
        swichLabel1.isOn = false
        swichLabel2.isOn = false
        swichLabel3.isOn = false
        swichLabel4.isOn = false
        label1.text = answears[0].text
        label2.text = answears[1].text
        label3.text = answears[2].text
        label4.text = answears[3].text
    }
    
    func updateRangeStack(using answears: [Answear])  {
        rangeStackView.isHidden = false
        rangeLabel1.text = answears.first?.text
        rangeLabel2.text = answears.last?.text
    }
    
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    @IBAction func singleAnswearButtonPressed(_ sender: UIButton) {
    
    let currentAnswears = questions[questionIndex].answear
    
        switch sender {
        case buttonLabel1:
            answearChosen.append(currentAnswears[0])
        case buttonLabel2:
            answearChosen.append(currentAnswears[1])
        case buttonLabel3:
            answearChosen.append(currentAnswears[2])
        case buttonLabel4:
            answearChosen.append(currentAnswears[3])
        default:
            break
        }
    nextQuestion()
    
    }
    
    @IBAction func multipleAnswearButtonPressed() {
        let currentAnswear = questions[questionIndex].answear
        
        if swichLabel1.isOn {
            answearChosen.append(currentAnswear[0])
        }
        
        if swichLabel2.isOn {
            answearChosen.append(currentAnswear[1])
        }
        
        if swichLabel3.isOn {
            answearChosen.append(currentAnswear[2])
        }
        
        if swichLabel4.isOn {
            answearChosen.append(currentAnswear[3])
        }
        nextQuestion()
    
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
