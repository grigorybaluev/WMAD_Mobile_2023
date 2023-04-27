//
//  LoginViewController.swift
//  08_Assignment_5_InstagramPost
//
//  Created by MacBook on 27.04.2023.
//

import UIKit

class LoginViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let profilePicture = UIImageView()
    profilePicture.image = UIImage(named: "open_mac")
    profilePicture.contentMode = .scaleAspectFill
    profilePicture.clipsToBounds = true
    profilePicture.layer.cornerRadius = view.safeAreaLayoutGuide.layoutFrame.width/4
    view.addSubview(profilePicture)
    profilePicture.translatesAutoresizingMaskIntoConstraints = false
    
    profilePicture.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65).isActive = true

    profilePicture.widthAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width/2).isActive = true
    profilePicture.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.width/2).isActive = true
    
    let inputStackView = UIStackView()
    inputStackView.translatesAutoresizingMaskIntoConstraints = false
    
    let inputNameEmail = UITextField()
    inputNameEmail.font = UIFont(name: "System", size: 14)
    inputNameEmail.placeholder = "User Name / email address"
    inputNameEmail.borderStyle = .roundedRect
    inputStackView.addArrangedSubview(inputNameEmail)
    
    let inputPassword = UITextField()
    inputPassword.font = UIFont(name: "System", size: 14)
    inputPassword.placeholder = "Password"
    inputPassword.borderStyle = .roundedRect
    inputStackView.addArrangedSubview(inputPassword)
    
    view.addSubview(inputStackView)
    
    inputStackView.axis = .vertical
    inputStackView.alignment = .center
    inputStackView.distribution = .equalSpacing
    inputStackView.spacing = 5
    
//    inputStackView.backgroundColor = .red
    inputStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    inputStackView.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 50).isActive = true
    inputStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
    inputStackView.heightAnchor.constraint(equalToConstant: 105).isActive = true
    
    inputNameEmail.heightAnchor.constraint(equalToConstant: 50).isActive = true
    inputNameEmail.widthAnchor.constraint(equalTo: inputStackView.widthAnchor).isActive = true
    inputPassword.heightAnchor.constraint(equalToConstant: 50).isActive = true
    inputPassword.widthAnchor.constraint(equalTo: inputStackView.widthAnchor).isActive = true
    
    let buttonsStackView = UIStackView()
    buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
    
    
    let loginButton = UIButton()
    loginButton.backgroundColor = .blue
    loginButton.layer.cornerRadius = 5
    loginButton.setTitle("Login", for: .normal)
    loginButton.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(loginButton)
//    loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//    loginButton.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 100).isActive = true
//    loginButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
//    loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    let loginWithFBButton = UIButton()
    loginWithFBButton.backgroundColor = .gray
    loginWithFBButton.setTitleColor(.white, for: .normal)
    loginWithFBButton.layer.cornerRadius = 5
    loginWithFBButton.setTitle("Login With Facebook", for: .normal)
    loginWithFBButton.translatesAutoresizingMaskIntoConstraints = false
//    view.addSubview(loginButton)
//    loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//    loginButton.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 100).isActive = true
//    loginButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
//    loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    view.addSubview(buttonsStackView)
    
    buttonsStackView.axis = .vertical
    buttonsStackView.alignment = .center
    buttonsStackView.distribution = .equalSpacing
    buttonsStackView.spacing = 5
    
//    inputStackView.backgroundColor = .red
    buttonsStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    buttonsStackView.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 100).isActive = true
    buttonsStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
    buttonsStackView.heightAnchor.constraint(equalToConstant: 105).isActive = true
    
    buttonsStackView.addArrangedSubview(loginButton)
    buttonsStackView.addArrangedSubview(loginWithFBButton)
    
    loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    loginButton.widthAnchor.constraint(equalTo: buttonsStackView.widthAnchor).isActive = true
    
    loginWithFBButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    loginWithFBButton.widthAnchor.constraint(equalTo: buttonsStackView.widthAnchor, multiplier: 0.8).isActive = true
    
    loginButton.addTarget(self, action: #selector(goToPost), for: .touchUpInside)
    
//    let forgotPasswordButton = UIButton(type: .system)
//    forgotPasswordButton.backgroundColor = .red
//    forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = true
//    forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
//    view.addSubview(forgotPasswordButton)
//    forgotPasswordButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//    forgotPasswordButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//    forgotPasswordButton.heightAnchor.constraint(equalToConstant: 300).isActive = true
//    forgotPasswordButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
  }
  
  @objc func goToPost() {
    let postVC = PostViewController()
    postVC.modalPresentationStyle = .popover
    self.present(postVC, animated: true, completion: nil)
  }
}
