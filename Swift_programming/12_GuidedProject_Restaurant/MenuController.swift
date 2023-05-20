//
//  MenuController.swift
//  12_GuidedProject_Restaurant
//
//  Created by MacBook on 18.05.2023.
//

import Foundation

class MenuController {
  let baseURL = URL(string: "http://localhost:8080/")!
  typealias MinutesToPrepare = Int
  
  func fetchCategories() async throws -> [String] {
    print("fetchCategories start")
    let categoriesURL = baseURL.appendingPathComponent("categories")
    print("categoriesURL")
    print(categoriesURL)
//    let (data, response) = try await URLSession.shared.data(from: categoriesURL)
//
//
//    print("(data, response)")
//
//    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//      throw MenuControllerError.categoriesNotFound
//    }
//
//    print("httpResponse")
//
//    let decoder = JSONDecoder()
//    let categoriesResponse = try decoder.decode(CategoriesResponse.self, from: data)
    
//    print(categoriesResponse.categories)
//    return categoriesResponse.categories
    return ["appetizers","salads","soups","entrees","desserts","sandwiches"]
    
  }
  
  func fetchMenuItems(forCategory categoryName: String) async throws ->
  [MenuItem] {
    let baseMenuURL = baseURL.appendingPathComponent("menu")
    var components = URLComponents(url: baseMenuURL,
                                   resolvingAgainstBaseURL: true)!
    components.queryItems = [URLQueryItem(name: "category",
                                          value: categoryName)]
    let menuURL = components.url!
    let (data, response) = try await URLSession.shared.data(from: menuURL)
    
    guard let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200 else {
        throw MenuControllerError.menuItemsNotFound
    }
    
    let decoder = JSONDecoder()
    let menuResponse = try decoder.decode(MenuResponse.self, from: data)
    
    return menuResponse.items
  }
  
  func submitOrder(forMenuIDs menuIDs: [Int]) async throws -> MinutesToPrepare {
    let orderURL = baseURL.appendingPathComponent("order")
    
    var request = URLRequest(url: orderURL)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let menuIdsDict = ["menuIds": menuIDs]
    let jsonEncoder = JSONEncoder()
    let jsonData = try? jsonEncoder.encode(menuIdsDict)
    request.httpBody = jsonData
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw MenuControllerError.orderRequestFailed
    }
    
    let decoder = JSONDecoder()
    let orderResponse = try decoder.decode(OrderResponse.self, from: data)
    
    return orderResponse.prepTime
  }
}

enum MenuControllerError: Error, LocalizedError {
  case categoriesNotFound
  case menuItemsNotFound
  case orderRequestFailed
  
}
