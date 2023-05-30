//
//  Settings.swift
//  13_GuidedProject_Habits
//
//  Created by MacBook on 29.05.2023.
//

import Foundation

struct Settings {
  static var shared = Settings()
  
  private let defaults = UserDefaults.standard
  
  private func archiveJSON<T: Encodable>(value: T, key: String) {
    let data = try! JSONEncoder().encode(value)
    let string = String(data: data, encoding: .utf8)
    defaults.set(string, forKey: key)
  }
  
  private func unarchiveJSON<T: Decodable>(key: String) -> T? {
    guard let string = defaults.string(forKey: key),
          let data = string.data(using: .utf8) else {
      return nil
    }
    return try! JSONDecoder().decode(T.self, from: data)
  }
  
  var favoriteHabits: [Habit] {
    get {
      return unarchiveJSON(key: Setting.favoriteHabits) ?? []
    }
    set {
      archiveJSON(value: newValue, key: Setting.favoriteHabits)
    }
  }
}

enum Setting {
  static let favoriteHabits = "favoriteHabits"
}

