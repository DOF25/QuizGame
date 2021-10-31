//
//  ResultsCareTaker.swift
//  QuizGame
//
//  Created by Крылов Данила  on 30.10.2021.
//

import UIKit

final class ResultsCareTaker {

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let key = "Record"

    func save(_ records: [Record]) {

        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: self.key)
        } catch {
            print(error)
        }

    }

    func upload() -> [Record] {

        guard let data = UserDefaults.standard.data(forKey: self.key) else { return [] }
        return (try? decoder.decode([Record].self, from: data)) ?? []
    }
}
