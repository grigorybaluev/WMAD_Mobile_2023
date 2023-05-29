//
//  MenuItemDetailViewController.swift
//  12_GuidedProject_Restaurant
//
//  Created by MacBook on 18.05.2023.
//

import UIKit

@MainActor
class MenuItemDetailViewController: UIViewController {
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var detailTextLabel: UITextView!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var addToOrderButton: UIButton!
  let menuItem: MenuItem
  
  init?(coder: NSCoder, menuItem: MenuItem) {
    self.menuItem = menuItem
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  func updateUI() {
    nameLabel.text = menuItem.name
    priceLabel.text = menuItem.price.formatted(.currency(code: "usd"))
    detailTextLabel.text = menuItem.detailText
  }
  
  @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
    UIView.animate(withDuration: 0.5, delay: 0,
                   usingSpringWithDamping: 0.7, initialSpringVelocity: 0.1,
                   options: [], animations: {
      self.addToOrderButton.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
      self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }, completion: nil)
    
    MenuController.shared.order.menuItems.append(menuItem)

  }
  
  
}

