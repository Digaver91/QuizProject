//
//  Question.swift
//  QuizProject
//
//  Created by Dmytro Gavrylov on 15.10.2022.
//

import Foundation

struct Question {
    var question: String
    var answers: [Answer]
    var isCorrectChoise: Bool? = false
}
