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


//MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setupStartGameButton()
        setupResultsButton()
    }

    private func setupStartGameButton() {

        view.addSubview(startGameButton)
        NSLayoutConstraint.activate([
            startGameButton.topAnchor.constraint(equalTo: view.topAnchor, constant: (view.bounds.height/2 - 70)),
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
    }

    @objc func startGame() {

        let gameController = GameController()
        present(gameController, animated: true)
    }


}

