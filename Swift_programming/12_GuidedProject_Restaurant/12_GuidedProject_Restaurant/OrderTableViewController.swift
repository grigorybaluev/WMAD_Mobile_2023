//
//  OrderTableViewController.swift
//  12_GuidedProject_Restaurant
//
//  Created by MacBook on 18.05.2023.
//

import UIKit

class OrderTableViewController: UITableViewController {
  var order = Order()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(tableView!, selector: #selector(UITableView.reloadData), name: MenuController.orderUpdatedNotification, object: nil)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MenuController.shared.order.menuItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Order", for: indexPath)
    configure(cell, forItemAt: indexPath)
    return cell
  }
  
  func configure(_ cell: UITableViewCell, forItemAt indexPath: IndexPath) {
    let menuItem = MenuController.shared.order.menuItems[indexPath.row]
    
    var content = cell.defaultContentConfiguration()
    content.text = menuItem.name
    content.secondaryText = menuItem.price.formatted(.currency(code: "usd"))
    cell.contentConfiguration = content
  }
  
  
}
