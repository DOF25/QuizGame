//
//  Question.swift
//  QuizGame
//
//  Created by Крылов Данила  on 28.10.2021.
//

import Foundation

struct Question: Codable {

    let question: String
    let possibleAnswers: [String]
    let rightAnswerIndex: Int
}
