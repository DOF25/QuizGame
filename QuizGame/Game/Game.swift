//
//  Game.swift
//  QuizGame
//
//  Created by Крылов Данила  on 29.10.2021.
//

import UIKit

struct Record {
    let result: Int
    let questionsCount: Int
    let data: Data
}

final class Game {

    static let shared = Game()

    let gameSession: GameSession?
    var records = [Record]()

    private init() {}
}
