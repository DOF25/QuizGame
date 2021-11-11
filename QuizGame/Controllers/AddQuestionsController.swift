//
//  AddQuestionsController.swift
//  QuizGame
//
//  Created by Крылов Данила  on 11.11.2021.
//

import UIKit

protocol QuestionDelegate: AnyObject {
    func addQuestions(_ questions: [Question])
}

final class AddQuestionsController: UIViewController {

//MARK: - Public property

    weak var delegate: QuestionDelegate?

//MARK: - Private property

    private var userQuestions = [Question]()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Введите вопрос"
        return label
    }()

    private let questionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Вопрос"
        textField.backgroundColor = .white
        return textField
    }()

    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Введите варианты ответа"
        return label
    }()

    private let answerTextField1: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ответ 1"
        textField.backgroundColor = .white
        return textField
    }()

    private let answerTextField2: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ответ 2"
        textField.backgroundColor = .white
        return textField
    }()

    private let answerTextField3: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ответ 3"
        textField.backgroundColor = .white
        return textField
    }()

    private let answerTextField4: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ответ 4"
        textField.backgroundColor = .white
        return textField
    }()

    private let rightAnswerIndex: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Номер правильного ответа"
        textField.backgroundColor = .white
        return textField
    }()

    private let addQuestionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить Вопрос", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        return button
    }()

//MARK: - Life Cycle

    init(delegate: QuestionDelegate) {
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
    }

//MARK: - Private methods

    private func setupUI() {

        view.addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(questionTextField)
        NSLayoutConstraint.activate([
            questionTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 5),
            questionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            questionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            questionTextField.heightAnchor.constraint(equalToConstant: 60)
        ])

        view.addSubview(answerLabel)
        NSLayoutConstraint.activate([
            answerLabel.topAnchor.constraint(equalTo: questionTextField.bottomAnchor, constant: 5),
            answerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(answerTextField1)
        NSLayoutConstraint.activate([
            answerTextField1.topAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 5),
            answerTextField1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            answerTextField1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            answerTextField1.heightAnchor.constraint(equalToConstant: 20)
        ])

        view.addSubview(answerTextField2)
        NSLayoutConstraint.activate([
            answerTextField2.topAnchor.constraint(equalTo: answerTextField1.bottomAnchor, constant: 5),
            answerTextField2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            answerTextField2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            answerTextField2.heightAnchor.constraint(equalToConstant: 20)
        ])

        view.addSubview(answerTextField3)
        NSLayoutConstraint.activate([
            answerTextField3.topAnchor.constraint(equalTo: answerTextField2.bottomAnchor, constant: 5),
            answerTextField3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            answerTextField3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            answerTextField3.heightAnchor.constraint(equalToConstant: 20)
        ])

        view.addSubview(answerTextField4)
        NSLayoutConstraint.activate([
            answerTextField4.topAnchor.constraint(equalTo: answerTextField3.bottomAnchor, constant: 5),
            answerTextField4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            answerTextField4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            answerTextField4.heightAnchor.constraint(equalToConstant: 20)
        ])

        view.addSubview(rightAnswerIndex)
        NSLayoutConstraint.activate([
            rightAnswerIndex.topAnchor.constraint(equalTo: answerTextField4.bottomAnchor, constant: 5),
            rightAnswerIndex.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            rightAnswerIndex.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            rightAnswerIndex.heightAnchor.constraint(equalToConstant: 20)
        ])

        view.addSubview(addQuestionButton)
        NSLayoutConstraint.activate([
            addQuestionButton.topAnchor.constraint(equalTo: rightAnswerIndex.bottomAnchor, constant: 10),
            addQuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addQuestionButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        addQuestionButton.addTarget(self, action: #selector(creatQuestionAction), for: .touchUpInside)
    }

    @objc func creatQuestionAction() {

        createQuestion()
        self.dismiss(animated: true, completion: nil)
    }

    private func createQuestion() {

        guard let questionText = questionTextField.text else { return }
        guard let answer1 = answerTextField1.text else { return }
        guard let answer2 = answerTextField2.text else { return }
        guard let answer3 = answerTextField3.text else { return }
        guard let answer4 = answerTextField4.text else { return }
        guard let rightAnswer = rightAnswerIndex.text else { return }
        let rightAnswerIndex = (Int(rightAnswer) ?? 0) - 1

        let question = Question(question: questionText,
                                possibleAnswers: [answer1, answer2, answer3, answer4],
                                rightAnswerIndex: rightAnswerIndex)

        self.userQuestions.append(question)
        Game.shared.questionsCareTaker.save(userQuestions)
        
        delegate?.addQuestions(userQuestions)
    }
}
