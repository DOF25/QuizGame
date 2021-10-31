//
//  GameController.swift
//  QuizGame
//
//  Created by Крылов Данила  on 28.10.2021.
//

import UIKit

//MARK: - GameContorller Delegate

protocol GameControllerDelegate: AnyObject {

    func gameDidEndWith(_ result: Double, questionsCount: Double)
}

final class GameController: UIViewController {

//MARK: - Public property

    weak var delegate: GameControllerDelegate?

//MARK: - Private property

    private var questions = [Question]()
    private var numberOfQuestion = 0
    private var solvedQuestions = 0.0


    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    private let answerButton1: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        return button

    }()
    private let answerButton2: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private let answerButton3: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    private let answerButton4: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    private let congratLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemTeal
        label.numberOfLines = 0
        label.text = "Поздравляю, вы верно ответили на все вопросы!"
        label.alpha = 0
        return label
    }()

    private let returnButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemTeal
        button.setTitleColor(.black, for: .normal)
        button.alpha = 0
        button.setTitle("Главное меню", for: .normal)
        return button
    }()


//MARK: - Life Cycle

    init(delegate: GameControllerDelegate? = nil ) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        setupUI()
        addQuestions()
        setupQuestionsAndAnswers(questions)
    }

//MARK: - Setup UI Elements

    private func setupUI() {

        view.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5)
        ])

        view.addSubview(answerButton1)
        NSLayoutConstraint.activate([
            answerButton1.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            answerButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            answerButton1.heightAnchor.constraint(equalToConstant: 40),
            answerButton1.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.5 + 30)

        ])
        answerButton1.addTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)

        view.addSubview(answerButton2)
        NSLayoutConstraint.activate([
            answerButton2.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10),
            answerButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            answerButton2.heightAnchor.constraint(equalToConstant: 40),
            answerButton2.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.5 + 30)

        ])
        answerButton2.addTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)

        view.addSubview(answerButton3)
        NSLayoutConstraint.activate([
            answerButton3.topAnchor.constraint(equalTo: answerButton1.bottomAnchor, constant: 5),
            answerButton3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            answerButton3.heightAnchor.constraint(equalToConstant: 40),
            answerButton3.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.5 + 30)
        ])
        answerButton3.addTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)

        view.addSubview(answerButton4)
        NSLayoutConstraint.activate([
            answerButton4.topAnchor.constraint(equalTo: answerButton2.bottomAnchor, constant: 5),
            answerButton4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            answerButton4.heightAnchor.constraint(equalToConstant: 40),
            answerButton4.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.5 + 30)
        ])
        answerButton4.addTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)

        view.addSubview(congratLabel)
        NSLayoutConstraint.activate([
            congratLabel.topAnchor.constraint(equalTo: answerButton4.bottomAnchor, constant: 50),
            congratLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            congratLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5)
        ])

        view.addSubview(returnButton)
        NSLayoutConstraint.activate([
            returnButton.topAnchor.constraint(equalTo: congratLabel.bottomAnchor, constant: 100),
            returnButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            returnButton.heightAnchor.constraint(equalToConstant: 40),
            returnButton.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.5)
        ])
        returnButton.addTarget(self, action: #selector(backToMenu), for: .touchUpInside)
    }

//MARK: Setup Questions

    private func addQuestions() {
        questions.append(Question(question: "Вопрос 1. Самое глубокое озеро в мире?",
                                  possibleAnswers: ["Байкал","Селигер","Каспийское море","Титикака"],
                                  rightAnswerIndex: 0))
        questions.append(Question(question: "Вопрос 2. Как называется набор закусок в Восточном Средиземноморье?",
                                  possibleAnswers: ["Низе","Рафл","Мезе","Рован"],
                                  rightAnswerIndex: 2))
        questions.append(Question(question: "Вопрос 3. Как по-другому называется внешняя поверхность сердечной мышцы человека?",
                                  possibleAnswers: ["Сердечная сумка","Сердечный мешок","Сердечный карман","Сердцеточие"],
                                  rightAnswerIndex: 0))
        questions.append(Question(question: "Вопрос 4. Как называется самый древний континент?",
                                  possibleAnswers: ["Евразия","Лавразия","Гондвана","Пангея"],
                                  rightAnswerIndex: 3))
        questions.append(Question(question: "Вопрос 5. Китай, Индия и Шри-Ланка являются тремя крупнейшими производителями чая в мире. Какая страна четвертая?",
                                  possibleAnswers: ["ЮАР","Перу","Кения","Япония"],
                                  rightAnswerIndex: 2))
    }

    private func checkAnswer(_ question: Question, answer: String) -> Bool {

        let rightAnswer = question.rightAnswerIndex
        if answer == question.possibleAnswers[rightAnswer] {
            return true
        }
        return false
    }

    private func setupQuestionsAndAnswers(_ questions: [Question]) {

        if numberOfQuestion < questions.count {

            let question = questions[numberOfQuestion]
            questionLabel.text = question.question
            answerButton1.setTitle(question.possibleAnswers[0], for: .normal)
            answerButton2.setTitle(question.possibleAnswers[1], for: .normal)
            answerButton3.setTitle(question.possibleAnswers[2], for: .normal)
            answerButton4.setTitle(question.possibleAnswers[3], for: .normal)
        }
        else {

            delegate?.gameDidEndWith(solvedQuestions, questionsCount: Double(questions.count))
            Game.shared.addRecord()
            Game.shared.gameSession = nil
            congratLabel.alpha = 1
            returnButton.alpha = 1
            answerButton1.removeTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)
            answerButton2.removeTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)
            answerButton3.removeTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)
            answerButton4.removeTarget(self, action: #selector(answerQuestion(_:)), for: .touchUpInside)
        }
    }

    @objc func answerQuestion(_ sender: UIButton) {

        if checkAnswer(questions[numberOfQuestion], answer: sender.titleLabel?.text ?? "") {

            solvedQuestions += 1
            numberOfQuestion += 1
            setupQuestionsAndAnswers(questions)

        } else {
            
            delegate?.gameDidEndWith(solvedQuestions, questionsCount: Double(questions.count))
            Game.shared.addRecord()
            Game.shared.gameSession = nil
            let alert = UIAlertController(title: "Вы проиграли!", message: "Попробуйте снова", preferredStyle: .alert)
            let action = UIAlertAction(title: "Вернуться в главное меню", style: .default) { [weak self] action in
                guard let self = self else { return }
                let vc = StartController()
                self.present(vc, animated: true)
            }
            alert.addAction(action)
            present(alert, animated: true)
        }

    }

    @objc func backToMenu() {

        if returnButton.alpha == 1 {
            self.dismiss(animated: true)
        }

    }
}
