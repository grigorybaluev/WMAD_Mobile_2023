//
//  Question.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 24.05.2023.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
