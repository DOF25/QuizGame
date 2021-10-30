//
//  GameSession.swift
//  QuizGame
//
//  Created by Крылов Данила  on 29.10.2021.
//

import UIKit

final class GameSession: UIViewController {

    var result = 0
    var questionsCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        let gameController = GameController()
        gameController.delegate = self

    }
    
}

extension GameSession: GameControllerDelegate {

    func gameDidEndWith(_ result: Int, questionsCount: Int) {

        self.result = result
        self.questionsCount = questionsCount

    }
}