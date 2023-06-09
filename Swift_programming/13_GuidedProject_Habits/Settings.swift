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
  
  mutating func toggleFavorite(_ habit: Habit) {
    var favorites = favoriteHabits
    
    if favorites.contains(habit) {
      favorites = favorites.filter { $0 != habit }
    } else {
      favorites.append(habit)
    }
    
    favoriteHabits = favorites
  }
  
  var followedUserIDs: [String] {
    get {
      return unarchiveJSON(key: Setting.followedUserIDs) ?? []
    }
    set {
      archiveJSON(value: newValue, key: Setting.followedUserIDs)
    }
  }
}

enum Setting {
  static let favoriteHabits = "favoriteHabits"
  static let followedUserIDs = "followedUserIDs"
}

