//
//  APIService.swift
//  13_GuidedProject_Habits
//
//  Created by MacBook on 29.05.2023.
//

import Foundation

struct HabitRequest: APIRequest {
  typealias Response = [String: Habit]
  
  var habitName: String?
  
  var path: String { "/habits" }
}

