//
//  RandomOrderStrategy.swift
//  QuizGame
//
//  Created by Крылов Данила  on 03.11.2021.
//

import UIKit

final class RandomOrderStrategy: OrderStrategy {

    func makeChoosenOrder(questions: [Question], completion: @escaping([Question]) -> Void) {
        
        let questions = questions.shuffled()
        completion(questions)
    }


}
