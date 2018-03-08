//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Illya Kochylo on 3/5/18.
//  Copyright © 2018 Illya Kochylo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
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

        // Do any additional setup after loading the view.
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
