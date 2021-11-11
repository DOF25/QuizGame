//
//  GameSession.swift
//  QuizGame
//
//  Created by Крылов Данила  on 29.10.2021.
//

import UIKit

final class GameSession: UIViewController {

    var result = Observable<Double>(0.0)
    var questionsCount = 0.0
    var numberOfQuestion = 0
    var percentage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension GameSession: GameControllerDelegate {

    func gameDidEndWith(_ result: Double, questionsCount: Double) {

        self.result.value = result
        self.questionsCount = questionsCount

    }

    func solvedQuestions(_ result: Double) {

        self.result.value = result
    }
}
