//
//  ResponseModels.swift
//  12_GuidedProject_Restaurant
//
//  Created by MacBook on 18.05.2023.
//

import Foundation

struct MenuResponse: Codable {
  let items: [MenuItem]
}

struct CategoriesResponse: Codable {
  let categories: [String]
}

struct OrderResponse: Codable {
  let prepTime: Int
  
  enum CodingKeys: String, CodingKey {
    case prepTime = "preparation_time"
  }
}
