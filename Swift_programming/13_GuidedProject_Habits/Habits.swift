//
//  Habits.swift
//  13_GuidedProject_Habits
//
//  Created by MacBook on 29.05.2023.
//

import Foundation

struct Habit {
  let name: String
  let category: Category
  let info: String
}

extension Habit: Codable { }


extension Habit: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(name)
  }
  
  static func == (lhs: Habit, rhs: Habit) -> Bool {
    return lhs.name == rhs.name
  }
}