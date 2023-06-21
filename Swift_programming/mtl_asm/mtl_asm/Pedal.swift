//
//  Pedal.swift
//  mtl_asm
//
//  Created by MacBook on 12.06.2023.
//

import Foundation
import UIKit

struct Pedal {
  let name: String
  let id: Int
  let detailText: String
  let image: UIImage
}

//struct Pedal: Codable {
//  var id: Int
//  var name: String
//  var detailText: String
//  //    var price: Double
//  //    var category: String
//  var imageName: String
//  var imageURL: URL
//  //  enum CodingKeys: String, CodingKey {
//  //    case id
//  //    case name
//  //    case detailText = "detail_text"
//  //    //        case price
//  //    //        case category
//  //    case imageName = "image_name"
//  //    case imageURL = "image_url"
//  //  }
//}
//
////func fetchItemsFromJSON(completion: @escaping ([Pedal]?) -> Void) {
////  guard let url = URL(string: "https://drive.google.com/file/d/16S5s8TQrZdLhJMp-VE_Rqmo6Bq-dC3Xt/view?usp=share_link") else {
////    completion(nil)
////    return
////  }
////
////  print("Url", url)
////
////  URLSession.shared.dataTask(with: url) { (data, response, error) in
////    if let error = error {
////      print("error 1")
////      print("Error fetching JSON data: \(error.localizedDescription)")
////      completion(nil)
////      return
////    }
////
////    guard let jsonData = data else {
////      completion(nil)
////      return
////    }
////
////    print(String(data: data!, encoding: .utf8))
////
////    do {
////      let decoder = JSONDecoder()
////      let items = try decoder.decode([Pedal].self, from: jsonData)
////      completion(items)
////    } catch {
////      print("error 2")
////      print("Error decoding JSON data: \(error.localizedDescription)")
////      completion(nil)
////    }
////  }.resume()
////}
//
////func fetchItemsFromJSON(completion: @escaping ([Pedal]?) -> Void) {
////  guard let path = Bundle.main.path(forResource: "/Users/macbook/Documents/study_WMAD/WMAD_Mobile_2023/Swift_programming/mtl_asm/data", ofType: "json") else {
////    completion(nil)
////    print("nil")
////    return
////  }
////
////  do {
////    let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
////    let decoder = JSONDecoder()
////    let items = try decoder.decode([Pedal].self, from: jsonData)
////    completion(items)
////    print("completion")
////  } catch {
////    print("Error decoding local JSON data: \(error.localizedDescription)")
////    completion(nil)
////  }
////}
//
//
////func fetchItemsFromJSON(completion: @escaping ([Pedal]?) -> Void) {
////    guard let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
////        completion(nil)
////        return
////    }
////
////    let fileURL = documentDirectoryURL.appendingPathComponent("data.json")
////
////    do {
////        let jsonData = try Data(contentsOf: fileURL)
////        let decoder = JSONDecoder()
////        let items = try decoder.decode([Pedal].self, from: jsonData)
////        completion(items)
////    } catch {
////        print("Error decoding local JSON data: \(error.localizedDescription)")
////        completion(nil)
////    }
////}
//
//func loadJson(filename fileName: String) -> [Pedal]? {
//  if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//    do {
//      let data = try Data(contentsOf: url)
//      let decoder = JSONDecoder()
//      let jsonData = try decoder.decode([Pedal].self, from: data)
//      return jsonData
//    } catch {
//      print("error:\(error)")
//    }
//  }
//  return nil
//}

