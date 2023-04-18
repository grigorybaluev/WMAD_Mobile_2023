//
//  ViewController.swift
//  AutolayoutProgrammatic
//
//  Created by MacBook on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {
  var orangeButton = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
  var redButton = UIButton(type: .system)
  let purpleView: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = .purple
    return v
  }()
  
  // When 'view' is loaded to the memory, this method gets called!
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(orangeButton)
    view.addSubview(redButton)
    // set constrains for the system button after adding subview
    
    // when you're using autolayout programmatically, you must set translatesAutoresizingMaskIntoConstraints to 'false'
    redButton.translatesAutoresizingMaskIntoConstraints = false
    redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    redButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    redButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    redButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
//    leadingAnchor
//    trailingAncho
//    bottomAnchor
//    topAnchor
//    widthAnchor
//    heightAnchor
//    centerXAnchor
//    centerYAnchor
    
    orangeButton.backgroundColor = .orange
    orangeButton.setTitle("Orange button", for: .normal)
    redButton.backgroundColor = .red
    redButton.setTitle("Red button", for: .normal)
    
    view.addSubview(purpleView)
//    purpleView.backgroundColor = .purple
//    purpleView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      purpleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      purpleView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
      purpleView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0),
      purpleView.heightAnchor.constraint(equalToConstant: 70)
    ])

    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    return
  }


}

