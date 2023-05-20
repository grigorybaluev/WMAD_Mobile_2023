//
//  Order.swift
//  12_GuidedProject_Restaurant
//
//  Created by MacBook on 18.05.2023.
//

import Foundation

struct Order: Codable {
  var menuItems: [MenuItem]
  
  init(menuItems: [MenuItem] = []) {
    self.menuItems = menuItems
  }
}
