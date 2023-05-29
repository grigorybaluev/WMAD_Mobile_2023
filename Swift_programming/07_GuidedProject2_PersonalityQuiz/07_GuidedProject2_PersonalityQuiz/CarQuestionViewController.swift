//
//  foodQuestion.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 26.04.2023.
//

import UIKit

class CarQuestionViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let questionLabel = UILabel()
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    questionLabel.text = "Which activities do you enjoy?"
    questionLabel.font = UIFont(name: "Georgia", size: 23)
    
    let option1Label = UILabel()
    option1Label.translatesAutoresizingMaskIntoConstraints = false
    option1Label.text = "Steak"
    option1Label.font = UIFont(name: "Swimming", size: 20)
    
    let switchButton1 = UISwitch()
    
    let option1 = UIStackView()
    option1.translatesAutoresizingMaskIntoConstraints = false
    option1.axis = .horizontal
    option1.alignment = .center
    option1.distribution = .fill
    option1.spacing = 0
    option1.addArrangedSubview(option1Label)
    option1.addArrangedSubview(switchButton1)
    
    let option2Label = UILabel()
    option2Label.translatesAutoresizingMaskIntoConstraints = false
    option2Label.text = "Fish"
    option2Label.font = UIFont(name: "Sleeping", size: 20)
    
    let switchButton2 = UISwitch()
    
    let option2 = UIStackView()
    option2.translatesAutoresizingMaskIntoConstraints = false
    option2.axis = .horizontal
    option2.alignment = .center
    option2.distribution = .fill
    option2.spacing = 0
    option2.addArrangedSubview(option2Label)
    option2.addArrangedSubview(switchButton2)
    
    let option3Label = UILabel()
    option3Label.translatesAutoresizingMaskIntoConstraints = false
    option3Label.text = "Carrots"
    option3Label.font = UIFont(name: "Cuddling", size: 20)
    
    let switchButton3 = UISwitch()
    
    let option3 = UIStackView()
    option3.translatesAutoresizingMaskIntoConstraints = false
    option3.axis = .horizontal
    option3.alignment = .center
    option3.distribution = .fill
    option3.spacing = 0
    option3.addArrangedSubview(option3Label)
    option3.addArrangedSubview(switchButton3)
    
    let option4Label = UILabel()
    option4Label.translatesAutoresizingMaskIntoConstraints = false
    option4Label.text = "Corn"
    option4Label.font = UIFont(name: "Eating", size: 20)
    
    let switchButton4 = UISwitch()
    
    let option4 = UIStackView()
    option4.translatesAutoresizingMaskIntoConstraints = false
    option4.axis = .horizontal
    option4.alignment = .center
    option4.distribution = .fill
    option4.spacing = 0
    option4.addArrangedSubview(option4Label)
    option4.addArrangedSubview(switchButton4)
    
    let submitAnswerButton = UIButton(type: .system)
    submitAnswerButton.translatesAutoresizingMaskIntoConstraints = false
    submitAnswerButton.setTitle("Submit Answer", for: .normal)
    submitAnswerButton.titleLabel?.font = UIFont(name: "System", size: 15)
    submitAnswerButton.addTarget(self, action: #selector(submitActivitiesAndGoToQuestionsVC(_:)), for: .touchUpInside)
    
    let CarQuestionViewController = UIStackView()
    CarQuestionViewController.translatesAutoresizingMaskIntoConstraints = false
    CarQuestionViewController.axis = .vertical
    CarQuestionViewController.alignment = .center
    CarQuestionViewController.distribution = .fillEqually
    CarQuestionViewController.spacing = 0
    view.addSubview(CarQuestionViewController)
    CarQuestionViewController.addArrangedSubview(questionLabel)
    CarQuestionViewController.addArrangedSubview(option1)
    CarQuestionViewController.addArrangedSubview(option2)
    CarQuestionViewController.addArrangedSubview(option3)
    CarQuestionViewController.addArrangedSubview(option4)
    CarQuestionViewController.addArrangedSubview(submitAnswerButton)
    option1.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option2.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option3.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option4.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    
    CarQuestionViewController.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    CarQuestionViewController.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    CarQuestionViewController.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
    
    
    
    
  }
  
  @objc func submitActivitiesAndGoToQuestionsVC(_ sender: UIButton) {
    print("submit")
//    let questionsVC = QuestionsViewController()
//    questionsVC.modalPresentationStyle = .overFullScreen
    navigationController?.popToRootViewController(animated: true)
  }
  
}
