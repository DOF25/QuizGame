//
//  InOrderStrategy.swift
//  QuizGame
//
//  Created by Крылов Данила  on 03.11.2021.
//

import UIKit

final class InOrderStrategy: OrderStrategy {

    func makeChoosenOrder(questions: [Question], completion: @escaping([Question]) -> Void) {

        let questions = questions
        completion(questions)
    }



}
