//
//  ViewController.swift
//  Light
//
//  Created by MacBook on 13.04.2023.
//

import UIKit

class ViewController: UIViewController {
  var lightOn = true

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  fileprivate func updateUI() {
    if lightOn {
      view.backgroundColor = .white
    } else {
      view.backgroundColor = .black
    }
  }
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    lightOn.toggle()
    updateUI()
  }
}

