//
//  foodQuestion.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 26.04.2023.
//

import UIKit

class ActivitiesQuestionViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let questionLabel = UILabel()
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    questionLabel.text = "Which activities do you enjoy?"
    questionLabel.font = UIFont(name: "Georgia", size: 23)
    
    let option1Label = UILabel()
    option1Label.translatesAutoresizingMaskIntoConstraints = false
    option1Label.text = "Swimming"
    option1Label.font = UIFont(name: "System", size: 20)
    
    let multipleSwitchButton1 = UISwitch()
    
    let option1 = UIStackView()
    option1.translatesAutoresizingMaskIntoConstraints = false
    option1.axis = .horizontal
    option1.alignment = .center
    option1.distribution = .fill
    option1.spacing = 0
    option1.addArrangedSubview(option1Label)
    option1.addArrangedSubview(multipleSwitchButton1)
    
    let option2Label = UILabel()
    option2Label.translatesAutoresizingMaskIntoConstraints = false
    option2Label.text = "Sleeping"
    option2Label.font = UIFont(name: "System", size: 20)
    
    let multipleSwitchButton2 = UISwitch()
    
    let option2 = UIStackView()
    option2.translatesAutoresizingMaskIntoConstraints = false
    option2.axis = .horizontal
    option2.alignment = .center
    option2.distribution = .fill
    option2.spacing = 0
    option2.addArrangedSubview(option2Label)
    option2.addArrangedSubview(multipleSwitchButton2)
    
    let option3Label = UILabel()
    option3Label.translatesAutoresizingMaskIntoConstraints = false
    option3Label.text = "Cuddling"
    option3Label.font = UIFont(name: "System", size: 20)
    
    let multipleSwitchButton3 = UISwitch()
    
    let option3 = UIStackView()
    option3.translatesAutoresizingMaskIntoConstraints = false
    option3.axis = .horizontal
    option3.alignment = .center
    option3.distribution = .fill
    option3.spacing = 0
    option3.addArrangedSubview(option3Label)
    option3.addArrangedSubview(multipleSwitchButton3)
    
    let option4Label = UILabel()
    option4Label.translatesAutoresizingMaskIntoConstraints = false
    option4Label.text = "Eating"
    option4Label.font = UIFont(name: "System", size: 20)
    
    let multipleSwitchButton4 = UISwitch()
    
    let option4 = UIStackView()
    option4.translatesAutoresizingMaskIntoConstraints = false
    option4.axis = .horizontal
    option4.alignment = .center
    option4.distribution = .fill
    option4.spacing = 0
    option4.addArrangedSubview(option4Label)
    option4.addArrangedSubview(multipleSwitchButton4)
    
    let submitAnswerButton = UIButton(type: .system)
    submitAnswerButton.translatesAutoresizingMaskIntoConstraints = false
    submitAnswerButton.setTitle("Submit Answer", for: .normal)
    submitAnswerButton.titleLabel?.font = UIFont(name: "System", size: 15)
    submitAnswerButton.addTarget(self, action: #selector(submitActivitiesAndGoToQuestionsVC(_:)), for: .touchUpInside)
    
    let ActivitiesQuestionViewController = UIStackView()
    ActivitiesQuestionViewController.translatesAutoresizingMaskIntoConstraints = false
    ActivitiesQuestionViewController.axis = .vertical
    ActivitiesQuestionViewController.alignment = .center
    ActivitiesQuestionViewController.distribution = .fillEqually
    ActivitiesQuestionViewController.spacing = 0
    view.addSubview(ActivitiesQuestionViewController)
    ActivitiesQuestionViewController.addArrangedSubview(questionLabel)
    ActivitiesQuestionViewController.addArrangedSubview(option1)
    ActivitiesQuestionViewController.addArrangedSubview(option2)
    ActivitiesQuestionViewController.addArrangedSubview(option3)
    ActivitiesQuestionViewController.addArrangedSubview(option4)
    ActivitiesQuestionViewController.addArrangedSubview(submitAnswerButton)
    option1.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option2.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option3.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option4.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    
    ActivitiesQuestionViewController.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    ActivitiesQuestionViewController.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    ActivitiesQuestionViewController.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
  }
  
  @objc func submitActivitiesAndGoToQuestionsVC(_ sender: UIButton) {
    print("submit")
//    let questionsVC = QuestionsViewController()
//    questionsVC.modalPresentationStyle = .overFullScreen
    navigationController?.popToRootViewController(animated: true)
  }
  
}
