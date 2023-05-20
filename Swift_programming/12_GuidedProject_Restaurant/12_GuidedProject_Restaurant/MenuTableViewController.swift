//
//  MenuTableViewController.swift
//  12_GuidedProject_Restaurant
//
//  Created by MacBook on 18.05.2023.
//

import UIKit

class MenuTableViewController: UIViewController {
  
  let category: String
  let menuController = MenuController()
  var menuItems = [MenuItem]()
  
  
  
  init?(coder: NSCoder, category: String) {
    self.category = category
    print(category)
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = category.capitalized
    
    Task.init {
      do {
        let menuItems = try await
        menuController.fetchMenuItems(forCategory: category)
        updateUI(with: menuItems)
      } catch {
        displayError(error, title: "Failed to Fetch Menu Items for \(self.category)")
      }
    }
  }
  func updateUI(with menuItems: [MenuItem]) {
    self.menuItems = menuItems
//    self.tableView.reloadData()
  }
  
  func displayError(_ error: Error, title: String) {
    guard let _ = viewIfLoaded?.window else { return }
    let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
}

