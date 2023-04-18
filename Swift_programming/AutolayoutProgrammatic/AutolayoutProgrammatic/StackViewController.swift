//
//  StackViewController.swift
//  AutolayoutProgrammatic
//
//  Created by MacBook on 17.04.2023.
//

import UIKit

class StackViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let lb1 = UILabel()
    lb1.text = "Label1"
    lb1.backgroundColor = .red
    lb1.widthAnchor.constraint(equalToConstant: 200).isActive = true
    
    let lb2 = UILabel()
    lb2.text = "Label2"
    lb2.backgroundColor = .red
    
    let lb3 = UILabel()
    lb3.text = "Label3"
    lb3.backgroundColor = .red
    
    let lb4 = UILabel()
    lb4.text = "Label4"
    lb4.backgroundColor = .red
    
    let lb5 = UILabel()
    lb5.text = "Label5"
    lb5.backgroundColor = .red
    
    let stackView = UIStackView(arrangedSubviews: [UIView(), lb1, lb2, lb3, lb4, lb5, UIView()])
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .equalSpacing
    stackView.spacing = 50
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stackView)
    
    stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    
  }
  
}
