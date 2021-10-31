//
//  Game.swift
//  QuizGame
//
//  Created by Крылов Данила  on 29.10.2021.
//

import UIKit

struct Record: Codable {
    let percentage: Int
    let date: Date
}

final class Game {

    static let shared = Game()

    var gameSession: GameSession? = nil

    private let resultsCareTaker = ResultsCareTaker()

    private(set) var records = [Record]() {
        didSet {
            resultsCareTaker.save(records)
        }
    }

    private init() {
        self.records = self.resultsCareTaker.upload()
    }

    func addRecord() {

        guard let result = gameSession?.result,
              let questionsCount = gameSession?.questionsCount else { return }
        let percentage = Int((result / questionsCount) * 100)
        let record = Record(percentage: percentage, date: Date())
        self.records.append(record)
    }

    func clearRecords() {

        self.records.removeAll()
    }
}
