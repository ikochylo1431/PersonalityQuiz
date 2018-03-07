//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Illya Kochylo on 3/7/18.
//  Copyright © 2018 Illya Kochylo. All rights reserved.
//

import Foundation


struct Question {
    var text: String
    var type: ResponseType
    var answear: [Answear]
}

enum ResponseType {
    case single,multiple,ranged
}

struct Answear {
    var text: String
    var type: AnimalType
}
