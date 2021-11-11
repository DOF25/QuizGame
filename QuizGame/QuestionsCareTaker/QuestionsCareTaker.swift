//
//  QuestionsCareTaker.swift
//  QuizGame
//
//  Created by Крылов Данила  on 11.11.2021.
//

import UIKit

final class QuestionsCareTaker {

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "Question"

    func save(_ questions: [Question]) {

        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.setValue(data, forKey: self.key)
        } catch {
            print(error)
        }
    }

    func upload() -> [Question] {

        guard let data = UserDefaults.standard.data(forKey: self.key) else { return [] }
        return (try? decoder.decode([Question].self, from: data)) ?? []
    }
}

