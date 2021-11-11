//
//  SettingsController.swift
//  QuizGame
//
//  Created by Крылов Данила  on 02.11.2021.
//

import UIKit

final class SettingsController: UIViewController {

//MARK: - Private property

    private let orderLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.text = "Вопросы в случайном порядке"
        return label
    }()

    private let orderSwitch: UISwitch = {
        let swtch = UISwitch()
        swtch.translatesAutoresizingMaskIntoConstraints = false
        return swtch
    }()

//MARK: - Public property

    var typeOfOrder: Order = .inOrder

//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.title = "Настройки"
        setupOrderLabel()
        setupOrderSwitch()

    }

//MARK: - Private Methods

    private func setupOrderLabel() {

        view.addSubview(orderLabel)
        NSLayoutConstraint.activate([
            orderLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            orderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            orderLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            orderLabel.heightAnchor.constraint(equalToConstant: orderSwitch.bounds.height)
        ])
    }

    private func setupOrderSwitch() {

        view.addSubview(orderSwitch)
        NSLayoutConstraint.activate([
            orderSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            orderSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -5)
        ])

        if self.typeOfOrder == .inOrder {
            orderSwitch.setOn(false, animated: true)
        } else {
            orderSwitch.setOn(true, animated: true)
        }
        self.orderSwitch.addTarget(self, action: #selector(chooseOrder(_:)), for: .valueChanged)
    }

//MARK: - Selector fo Switch

    @objc func chooseOrder(_ sender: UISwitch) {

        if sender.isOn {
            self.typeOfOrder = .randomly
            Game.shared.typeOfOrder = self.typeOfOrder
            sender.setOn(true, animated: true)
        } else {
            self.typeOfOrder = .inOrder
            Game.shared.typeOfOrder = self.typeOfOrder
            sender.setOn(false, animated: true)
        }
    }

}
