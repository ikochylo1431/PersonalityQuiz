//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Illya Kochylo on 2/28/18.
//  Copyright © 2018 Illya Kochylo. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func beginButtonPushed(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "resultSegue", sender: nil)
        
    }
    
    
    
   

}

