//
//  foodQuestion.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 26.04.2023.
//

import UIKit

class FoodQuestionViewController: UIViewController {
  var answers: Answer1?
  
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
    option1Label.font = UIFont(name: "System", size: 20)
    
    let singleSwitchButton1 = UISwitch()
    
    let option1 = UIStackView()
    option1.translatesAutoresizingMaskIntoConstraints = false
    option1.axis = .horizontal
    option1.alignment = .center
    option1.distribution = .fill
    option1.spacing = 0
    option1.addArrangedSubview(option1Label)
    option1.addArrangedSubview(singleSwitchButton1)
    
    let option2Label = UILabel()
    option2Label.translatesAutoresizingMaskIntoConstraints = false
    option2Label.text = "Fish"
    option2Label.font = UIFont(name: "System", size: 20)
    
    let singleSwitchButton2 = UISwitch()
    
    let option2 = UIStackView()
    option2.translatesAutoresizingMaskIntoConstraints = false
    option2.axis = .horizontal
    option2.alignment = .center
    option2.distribution = .fill
    option2.spacing = 0
    option2.addArrangedSubview(option2Label)
    option2.addArrangedSubview(singleSwitchButton2)
    
    let option3Label = UILabel()
    option3Label.translatesAutoresizingMaskIntoConstraints = false
    option3Label.text = "Carrots"
    option3Label.font = UIFont(name: "System", size: 20)
    
    let singleSwitchButton3 = UISwitch()
    
    let option3 = UIStackView()
    option3.translatesAutoresizingMaskIntoConstraints = false
    option3.axis = .horizontal
    option3.alignment = .center
    option3.distribution = .fill
    option3.spacing = 0
    option3.addArrangedSubview(option3Label)
    option3.addArrangedSubview(singleSwitchButton3)
    
    let option4Label = UILabel()
    option4Label.translatesAutoresizingMaskIntoConstraints = false
    option4Label.text = "Corn"
    option4Label.font = UIFont(name: "System", size: 20)
    
    let singleSwitchButton4 = UISwitch()
    
    let option4 = UIStackView()
    option4.translatesAutoresizingMaskIntoConstraints = false
    option4.axis = .horizontal
    option4.alignment = .center
    option4.distribution = .fill
    option4.spacing = 0
    option4.addArrangedSubview(option4Label)
    option4.addArrangedSubview(singleSwitchButton4)
    
    let submitAnswerButton = UIButton(type: .system)
    submitAnswerButton.translatesAutoresizingMaskIntoConstraints = false
    submitAnswerButton.setTitle("Submit Answer", for: .normal)
    submitAnswerButton.titleLabel?.font = UIFont(name: "System", size: 15)
    submitAnswerButton.addTarget(self, action: #selector(submitFoodAndGoToQuestionsVC(_:)), for: .touchUpInside)
    
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
//    singleSwitchButton1.state
    answers = Answer1(singleSwitch1: singleSwitchButton1.state,
                        singleSwitch2: singleSwitchButton2.state,
                        singleSwitch3: singleSwitchButton3.state,
                        singleSwitch4: singleSwitchButton4.state)
  }
  
  @objc func submitFoodAndGoToQuestionsVC(_ sender: UIButton) {
    print("submit food")
    
    
    
//    answers = Question1(singleSwitch1: singleswitchbutton, singleSwitch2: <#T##Bool#>, singleSwitch3: <#T##Bool#>, singleSwitch4: <#T##Bool#>)
    
    let manager = FileManager.default
    guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
    let fileUrl = url.appendingPathComponent("Answers.plist")
    var data = try! Data(contentsOf: fileUrl)
    
    print(data)
    
    print(answers)
    
    let encoder = PropertyListEncoder()
    let encodedData = try! encoder.encode(answers)
    try! encodedData.write(to: fileUrl)
    
    data = try! Data(contentsOf: fileUrl)
    let decoder = PropertyListDecoder()
    let arr = try! decoder.decode(Answer1.self, from: data)
    print(arr)
    
    

//    let currentAnswers = questions[0].answers
//
//    switch sender {
//    case singleButton1:
//      answersChosen.append(currentAnswers[0])
//    case singleButton2:
//      answersChosen.append(currentAnswers[1])
//    case singleButton3:
//      answersChosen.append(currentAnswers[2])
//    case singleButton4:
//      answersChosen.append(currentAnswers[3])
//    default:
//      break
//    }
    
//    let encoder = PropertyListEncoder()
    
    
    navigationController?.popToRootViewController(animated: true)
    
  }
  
}

struct Answer1: Codable {
  let singleSwitch1: Bool
  let singleSwitch2: Bool
  let singleSwitch3: Bool
  let singleSwitch4: Bool
}
