//
//  WelcomeViewController.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 25.04.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let welcomeLabel = UILabel()
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    welcomeLabel.text = "Which Animal Are You?"
    welcomeLabel.font = UIFont(name: "Georgia", size: 30)
    
    let startQuizButton = UIButton(type: .system)
    startQuizButton.translatesAutoresizingMaskIntoConstraints = false
    startQuizButton.setTitle("Begin Personality Quiz", for: .normal)
    startQuizButton.titleLabel?.font = UIFont(name: "System", size: 15)
    startQuizButton.addTarget(self, action: #selector(goToQuestions), for: .touchUpInside)
    
    let welcomeStackView = UIStackView(frame: CGRect(x: 100, y: 100, width: 100, height: 500))
    welcomeStackView.addArrangedSubview(welcomeLabel)
    welcomeStackView.addArrangedSubview(startQuizButton)
    view.addSubview(welcomeStackView)
    
    let dogEmoji = UILabel()
    dogEmoji.text = "🐶"
    view.addSubview(dogEmoji)
    dogEmoji.translatesAutoresizingMaskIntoConstraints = false
    dogEmoji.font = dogEmoji.font.withSize(45)
    dogEmoji.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    dogEmoji.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    dogEmoji.widthAnchor.constraint(equalToConstant: 50).isActive = true
    dogEmoji.heightAnchor.constraint(equalToConstant: 50).isActive = true

    let rabbitEmoji = UILabel()
    rabbitEmoji.text = "🐰"
    view.addSubview(rabbitEmoji)
    rabbitEmoji.translatesAutoresizingMaskIntoConstraints = false
    rabbitEmoji.font = rabbitEmoji.font.withSize(45)
    rabbitEmoji.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    rabbitEmoji.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    rabbitEmoji.widthAnchor.constraint(equalToConstant: 50).isActive = true
    rabbitEmoji.heightAnchor.constraint(equalToConstant: 50).isActive = true

    let catEmoji = UILabel()
    catEmoji.text = "🐱"
    view.addSubview(catEmoji)
    catEmoji.translatesAutoresizingMaskIntoConstraints = false
    catEmoji.font = catEmoji.font.withSize(45)
    catEmoji.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    catEmoji.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    catEmoji.widthAnchor.constraint(equalToConstant: 50).isActive = true
    catEmoji.heightAnchor.constraint(equalToConstant: 50).isActive = true

    let turtleEmoji = UILabel()
    turtleEmoji.text = "🐢"
    view.addSubview(turtleEmoji)
    turtleEmoji.translatesAutoresizingMaskIntoConstraints = false
    turtleEmoji.font = turtleEmoji.font.withSize(45)
    turtleEmoji.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    turtleEmoji.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    turtleEmoji.widthAnchor.constraint(equalToConstant: 50).isActive = true
    turtleEmoji.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    welcomeStackView.translatesAutoresizingMaskIntoConstraints = false
    welcomeStackView.axis = .vertical
    welcomeStackView.alignment = .center
    welcomeStackView.distribution = .fillEqually
    welcomeStackView.spacing = 0
    
    welcomeStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    welcomeStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    welcomeStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
    welcomeStackView.heightAnchor.constraint(equalToConstant: 75).isActive = true
  }
  
  @objc func goToQuestions() {
    let questionsVC = QuestionsNavigationController()
    questionsVC.modalPresentationStyle = .fullScreen
    self.present(questionsVC, animated: true, completion: nil)
  }
  
//  @objc func goToQuestions() {
//      var questionsVC = QuestionsNavigationController()
////      navigationController?.pushViewController(questionsVC, animated: true)
//
//      window?.rootViewController = questionsVC
//    }
}
