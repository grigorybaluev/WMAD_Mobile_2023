//
//  StartViewController.swift
//  mtl_asm
//
//  Created by MacBook on 14.12.2023.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
  
  let logoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "mtlasm_logo"))
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Add the logo image view to the view hierarchy
    view.addSubview(logoImageView)
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    
    // Center the logo image view
    NSLayoutConstraint.activate([
      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      logoImageView.widthAnchor.constraint(equalToConstant: 200), // Adjust width as needed
      logoImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust height as needed
    ])
    
    // Start the animation after the view has appeared
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Change to 5 for a 5-second delay
      self.animateLogoFadeOut()
    }
  }
  
  func animateLogoFadeOut() {
    UIView.animate(withDuration: 1.0, animations: {
      self.logoImageView.alpha = 0.0
      print("logo")
    })
  }
  
  func transitionToNextScreen() {
    // Replace this with the code to transition to your app's main screen or another screen
    // For example, you might use a UINavigationController to push the next view controller
//    guard let nextViewController = self.navigationController else {
//      print("no luck")
//      return
//
//    } // Replace with your desired view controller
    let nextViewController = PedalTableViewController()
    navigationController?.pushViewController(nextViewController, animated: false)
    print("push")
  }
}
