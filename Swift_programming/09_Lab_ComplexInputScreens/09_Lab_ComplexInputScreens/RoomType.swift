//
//  RoomType.swift
//  09_Lab_ComplexInputScreens
//
//  Created by MacBook on 09.05.2023.
//

import Foundation

struct RoomType: Equatable {
  var id: Int
  var name: String
  var shortName: String
  var price: Int
  //Equatable Protocol Implementation for RoomType
  static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
    return lhs.id == rhs.id
  }
}
