//
//  QuestionsViewController.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 26.04.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
  let answers: [[Answer?]] = [[], [], []]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let manager = FileManager.default
    guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
    let fileUrl = url.appendingPathComponent("Answers.plist")
    try! manager.createFile(atPath: fileUrl.path, contents: nil, attributes: nil)
    
    view.backgroundColor = .white
    
    let questionsStackView = UIStackView()
    
    
    questionsStackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(questionsStackView)
    questionsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
    questionsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -350).isActive = true
    questionsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    questionsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    questionsStackView.alignment = .fill
    questionsStackView.distribution = .equalSpacing
    questionsStackView.axis = .vertical
    
    let foodQuestButt = UIButton(type: .system)
    foodQuestButt.translatesAutoresizingMaskIntoConstraints = false
    foodQuestButt.setTitle("Question 1: What Food Do You Prefer?", for: .normal)
    foodQuestButt.titleLabel?.font = UIFont(name: "System", size: 15)
    questionsStackView.addArrangedSubview(foodQuestButt)
    foodQuestButt.addTarget(self, action: #selector(goToFoodQuestionVC(_:)), for: .touchUpInside)
    
    let activitiesQuestButt = UIButton(type: .system)
    activitiesQuestButt.translatesAutoresizingMaskIntoConstraints = false
    activitiesQuestButt.setTitle("Question 2: Which activities do you enjoy?", for: .normal)
    activitiesQuestButt.titleLabel?.font = UIFont(name: "System", size: 15)
    questionsStackView.addArrangedSubview(activitiesQuestButt)
    activitiesQuestButt.addTarget(self, action: #selector(goToActivitiesQuestionVC(_:)), for: .touchUpInside)
    
    let carQuestButt = UIButton(type: .system)
    carQuestButt.translatesAutoresizingMaskIntoConstraints = false
    carQuestButt.setTitle("Question 3: How much do you enjoy car rides?", for: .normal)
    carQuestButt.titleLabel?.font = UIFont(name: "System", size: 15)
    questionsStackView.addArrangedSubview(carQuestButt)
    carQuestButt.addTarget(self, action: #selector(goToCarQuestionVC(_:)), for: .touchUpInside)
    
  }
  
  @objc func goToFoodQuestionVC(_ sender: UIButton) {
    print("check")
    navigationController?.pushViewController(FoodQuestionViewController(), animated: true)
  }
  
  @objc func goToActivitiesQuestionVC(_ sender: UIButton) {
    print("check")
    navigationController?.pushViewController(ActivitiesQuestionViewController(), animated: true)
  }
  
  @objc func goToCarQuestionVC(_ sender: UIButton) {
    print("check")
    navigationController?.pushViewController(CarQuestionViewController(), animated: true)
  }

}
