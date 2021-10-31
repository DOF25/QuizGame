//
//  CellForRecords.swift
//  QuizGame
//
//  Created by Крылов Данила  on 30.10.2021.
//

import UIKit

final class CellForRecords: UITableViewCell {


    let recordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.backgroundColor = .black
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraintsForLabels()
        contentView.backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setConstraintsForLabels() {

        contentView.addSubview(recordLabel)
        NSLayoutConstraint.activate([
            recordLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            recordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4)
        ])

        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -10 )
        ])
    }

    func configure(_ record: Record) {

        recordLabel.text = "\(record.percentage) %"
        dateLabel.text = DateFormatter.localizedString(
            from: record.date,
            dateStyle: .short,
            timeStyle: .short)
    }
}
