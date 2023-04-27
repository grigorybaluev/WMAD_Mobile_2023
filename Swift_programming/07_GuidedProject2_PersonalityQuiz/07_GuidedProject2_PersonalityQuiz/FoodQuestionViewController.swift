//
//  foodQuestion.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 26.04.2023.
//

import UIKit

class FoodQuestionViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let questionLabel = UILabel()
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    questionLabel.text = "What Food Do You Prefer?"
    questionLabel.font = UIFont(name: "Georgia", size: 23)
    
    let option1Label = UILabel()
    option1Label.translatesAutoresizingMaskIntoConstraints = false
    option1Label.text = "Food option 1"
    option1Label.font = UIFont(name: "System", size: 20)
    
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
    option2Label.text = "Food option 2"
    option2Label.font = UIFont(name: "System", size: 20)
    
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
    option3Label.text = "Food option 3"
    option3Label.font = UIFont(name: "System", size: 20)
    
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
    option4Label.text = "Food option 4"
    option4Label.font = UIFont(name: "System", size: 20)
    
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
    
    let foodQuestionStackView = UIStackView()
    foodQuestionStackView.translatesAutoresizingMaskIntoConstraints = false
    foodQuestionStackView.axis = .vertical
    foodQuestionStackView.alignment = .center
    foodQuestionStackView.distribution = .fillEqually
    foodQuestionStackView.spacing = 0
    view.addSubview(foodQuestionStackView)
    foodQuestionStackView.addArrangedSubview(questionLabel)
    foodQuestionStackView.addArrangedSubview(option1)
    foodQuestionStackView.addArrangedSubview(option2)
    foodQuestionStackView.addArrangedSubview(option3)
    foodQuestionStackView.addArrangedSubview(option4)
    foodQuestionStackView.addArrangedSubview(submitAnswerButton)
    option1.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option2.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option3.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    option4.widthAnchor.constraint(equalTo: questionLabel.widthAnchor).isActive = true
    
    foodQuestionStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    foodQuestionStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    foodQuestionStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
  }
}
