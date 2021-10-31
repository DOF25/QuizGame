//
//  RecordsController.swift
//  QuizGame
//
//  Created by Крылов Данила  on 30.10.2021.
//

import UIKit

final class RecordsController: UITableViewController {

    private let cell = "cell"

    override func viewDidLoad() {

        self.title = "Результаты"
        tableView.register(CellForRecords.self, forCellReuseIdentifier: self.cell)
        tableView.backgroundColor = .black

    }

//MARK: - Table View

//MARK: - Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cell, for: indexPath) as? CellForRecords
        else { return UITableViewCell() }

        let record = Game.shared.records.reversed()[indexPath.row]

        cell.configure(record)
        return cell

    }

//MARK: - TableView delegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
