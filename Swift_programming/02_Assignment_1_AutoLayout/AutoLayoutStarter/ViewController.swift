//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let mainView: UIView = {
    let main = UIView()
    // important when setting contraints programmatically
    main.translatesAutoresizingMaskIntoConstraints = false
    main.backgroundColor = .green
    return main
  }()
  
  let squareButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Square", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
    return butt
  }()
  
  let portraitButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Portrait", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
    return butt
  }()
  
  let landScapeButton: UIButton = {
    let butt = UIButton(type: .system)
    butt.setTitle("Landscape", for: .normal)
    butt.translatesAutoresizingMaskIntoConstraints = false
    butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
    return butt
  }()
  
  var widthAnchor: NSLayoutConstraint?
  var heightAnchor: NSLayoutConstraint?
  
  let purpleBox: UIView = {
    let pBox = UIView()
    pBox.translatesAutoresizingMaskIntoConstraints = false
    pBox.backgroundColor = .purple
    return pBox
  }()
  
  let redBox: UIView = {
    let rBox = UIView()
    rBox.translatesAutoresizingMaskIntoConstraints = false
    rBox.backgroundColor = .red
    return rBox
  }()
  
  let orangeBox1: UIView = {
    let oBox = UIView()
    oBox.translatesAutoresizingMaskIntoConstraints = false
    oBox.backgroundColor = .orange
    return oBox
  }()
  
  let orangeBox2: UIView = {
    let oBox = UIView()
    oBox.translatesAutoresizingMaskIntoConstraints = false
    oBox.backgroundColor = .orange
    return oBox
  }()
  
  func createBlueBox() -> UIView {
    let bBox = UIView()
    bBox.translatesAutoresizingMaskIntoConstraints = false
    bBox.backgroundColor = .blue
    bBox.widthAnchor.constraint(equalToConstant: 75).isActive = true
    bBox.heightAnchor.constraint(equalToConstant: 75).isActive = true
    return bBox
  }
  
  var blueStackView = UIStackView()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    view.addSubview(mainView)
    view.addSubview(purpleBox)
    view.addSubview(redBox)
    view.addSubview(orangeBox1)
    view.addSubview(orangeBox2)
    blueStackView = UIStackView(arrangedSubviews: [UIView(), createBlueBox(), createBlueBox(), createBlueBox(), UIView()])
    blueStackView.axis = .vertical
    blueStackView.alignment = .center
    blueStackView.distribution = .equalSpacing
    blueStackView.spacing = 50
    blueStackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(blueStackView)
    setupLayout()
  }

  fileprivate func setupLayout() {
    // mainView
    mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
    widthAnchor?.isActive = true
    
    heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
    heightAnchor?.isActive = true
    
    // purpleBox
    purpleBox.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    purpleBox.leadingAnchor.constraint(equalToSystemSpacingAfter: mainView.safeAreaLayoutGuide.leadingAnchor, multiplier: 30).isActive = true
    purpleBox.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    purpleBox.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    
    // redBox
    redBox.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    redBox.widthAnchor.constraint(equalToConstant: CGFloat(200)).isActive = true
    redBox.trailingAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    redBox.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
    
    // orangeBox1
    orangeBox1.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10).isActive = true
    orangeBox1.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -10).isActive = true
    orangeBox1.widthAnchor.constraint(equalToConstant: CGFloat(70)).isActive = true
    orangeBox1.trailingAnchor.constraint(equalTo: redBox.trailingAnchor, constant: -10).isActive = true
    
    // orangeBox2
    orangeBox2.topAnchor.constraint(equalTo: redBox.topAnchor, constant: 10).isActive = true
    orangeBox2.bottomAnchor.constraint(equalTo: redBox.bottomAnchor, constant: -10).isActive = true
    orangeBox2.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
    orangeBox2.leadingAnchor.constraint(equalTo: redBox.leadingAnchor, constant: 10).isActive = true
    
    // blueStackView
    blueStackView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
    blueStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    blueStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: mainView.leadingAnchor, multiplier: 0).isActive = true
    blueStackView.trailingAnchor.constraint(equalToSystemSpacingAfter: mainView.trailingAnchor, multiplier: 0).isActive = true
    
    let buttStackView = UIStackView(arrangedSubviews: [
      squareButton, portraitButton, landScapeButton])
    buttStackView.translatesAutoresizingMaskIntoConstraints = false
    buttStackView.axis = .horizontal
    buttStackView.alignment = .center
    buttStackView.distribution = .fillEqually
    
    view.addSubview(buttStackView)
    NSLayoutConstraint.activate([
      buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttStackView.heightAnchor.constraint(equalToConstant: 50),
      buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
      ])
  }

  @objc private func squareTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
  
  @objc private func portraitTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
    
  }
  
  @objc private func landscapeTapped() {
    view.layoutIfNeeded()
    UIView.animate(withDuration: 2.0) {
      self.widthAnchor?.isActive = false
      self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
      self.widthAnchor?.isActive = true
      
      self.heightAnchor?.isActive = false
      self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
      self.heightAnchor?.isActive = true
      self.view.layoutIfNeeded()
    }
  }
}

