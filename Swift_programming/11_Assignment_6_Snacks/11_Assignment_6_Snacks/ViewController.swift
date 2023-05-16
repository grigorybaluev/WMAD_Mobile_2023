//
//  ViewController.swift
//  11_Assignment_6_Snacks
//
//  Created by MacBook on 15.05.2023.
//

import UIKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var heightConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func animateHeight() {
    // Change the height of the constraint
    self.heightConstraint.constant = 200
    
    // Animate the changes
    UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.15, initialSpringVelocity: 2, animations: {
      // Call layoutIfNeeded in the animation block
      self.view.layoutIfNeeded()
    })
    
  }
  
  @IBAction func plusButtonPressed(_ sender: Any) {
    print("plus button pressed")
    animateHeight()
  }
  
}

