//
//  OrderConfirmationViewController.swift
//  12_GuidedProject_Restaurant
//
//  Created by MacBook on 09.06.2023.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
  
  @IBOutlet weak var confirmationLabel: UILabel!
  let minutesToPrepare: Int
  
  override func viewDidLoad() {
    super.viewDidLoad()
    confirmationLabel.numberOfLines = 0
    confirmationLabel.text = "Thank you for your order! Your wait time is approximately \(minutesToPrepare) minutes."
  }
  
  init?(coder: NSCoder, minutesToPrepare: Int) {
    self.minutesToPrepare = minutesToPrepare
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
