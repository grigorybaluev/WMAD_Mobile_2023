//
//  QuestionsViewController.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 26.04.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    let foodQuestButt = UIButton(type: .system)
    foodQuestButt.translatesAutoresizingMaskIntoConstraints = false
    foodQuestButt.setTitle("Question 1: What Food Do You Prefer?", for: .normal)
    foodQuestButt.titleLabel?.font = UIFont(name: "System", size: 15)
    view.addSubview(foodQuestButt)

    view.addSubview(foodQuestButt)
    foodQuestButt.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    foodQuestButt.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    foodQuestButt.addTarget(self, action: #selector(goToFoodQuestionVC(_:)), for: .touchUpInside)
    
  }
  
  @objc func goToFoodQuestionVC(_ sender: UIButton) {
    print("check")
    navigationController?.pushViewController(FoodQuestionViewController(), animated: true)
  }

}
