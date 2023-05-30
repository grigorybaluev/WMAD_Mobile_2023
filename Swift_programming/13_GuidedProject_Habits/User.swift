//
//  User.swift
//  13_GuidedProject_Habits
//
//  Created by MacBook on 30.05.2023.
//

import Foundation

struct User {
  let id: String
  let name: String
  let color: Color?
  let bio: String?
}

extension User: Codable { }

extension User: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func ==(_ lhs: User, _ rhs: User) -> Bool {
    return lhs.id == rhs.id
  }
}
