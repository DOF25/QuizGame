//
//  StartController.swift
//  QuizGame
//
//  Created by Крылов Данила  on 28.10.2021.
//

import UIKit

final class StartController : UIViewController {

//MARK: - Private Property

    private let startGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать игру", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()
    private let resultsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Результаты", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()
    private let settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Настройки", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()


//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setupStartGameButton()
        setupResultsButton()
        setupSettingsButton()
    }

    private func setupStartGameButton() {

        view.addSubview(startGameButton)
        NSLayoutConstraint.activate([
            startGameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.bounds.height/2 - 100)),
            startGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGameButton.heightAnchor.constraint(equalToConstant: 30),
            startGameButton.widthAnchor.constraint(equalToConstant: view.bounds.width - 100)
        ])

        startGameButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
    }

    private func setupResultsButton() {

        view.addSubview(resultsButton)
        NSLayoutConstraint.activate([
            resultsButton.topAnchor.constraint(equalTo: startGameButton.bottomAnchor, constant: 10),
            resultsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultsButton.heightAnchor.constraint(equalToConstant: 30),
            resultsButton.widthAnchor.constraint(equalTo: startGameButton.widthAnchor)
        ])

        resultsButton.addTarget(self, action: #selector(showRecords), for: .touchUpInside)
    }

    private func setupSettingsButton() {

        view.addSubview(settingsButton)
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: resultsButton.bottomAnchor, constant: 10),
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: 30),
            settingsButton.widthAnchor.constraint(equalTo: startGameButton.widthAnchor)
        ])

        settingsButton.addTarget(self, action: #selector(pushSettingsController), for: .touchUpInside)
    }

    @objc func startGame() {

        let gameSession = GameSession()
        Game.shared.gameSession = gameSession
        let gameController = GameController(delegate: gameSession)
        present(gameController, animated: true)
    }

    @objc func showRecords() {

        let recordsController = RecordsController()
        present(recordsController, animated: true)
    }

    @objc func pushSettingsController() {

        let settingsController = SettingsController()
        present(settingsController, animated: true)
//        navigationController?.pushViewController(settingsController, animated: true)
    }


}

