//
//  ViewController.swift
//  05_Assignment_3_ StoriesNavigationController
//
//  Created by MacBook on 20.04.2023.
//

import UIKit

class ViewController: UIViewController {

  
  override func viewDidLoad() {
    super.viewDidLoad()
//    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: StartViewController(), action: #selector(rightBarButtonTapped))
  }

  @IBAction func homeButton(_ sender: UIBarButtonItem) {
    navigationController?.popToRootViewController(animated: true)
  }
}

