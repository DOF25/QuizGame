//
//  OrderStrategy.swift
//  QuizGame
//
//  Created by Крылов Данила  on 02.11.2021.
//

import UIKit

enum Order {

    case inOrder
    case randomly
}

protocol OrderStrategy {

    func makeChoosenOrder(questions: [Question], completion: @escaping([Question]) -> Void)

}
