//
//  QuestionsNavigationController.swift
//  07_GuidedProject2_PersonalityQuiz
//
//  Created by MacBook on 26.04.2023.
//

import UIKit

class QuestionsNavigationController: UINavigationController {
  
  override func viewDidLoad() {
    self.pushViewController(QuestionsViewController(), animated: true)
  }
}
