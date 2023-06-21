//
//  DetailViewController.swift
//  mtl_asm
//
//  Created by MacBook on 13.06.2023.
//

import UIKit

class DetailViewController: UIViewController {

  var pedal: Pedal!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .orange
//    print(pedal)
    print(pedal.image)
    
    let detailImage = UIImageView(image: pedal.image)
    detailImage.layer.cornerRadius = 30
    detailImage.layer.masksToBounds = true
    
    view.addSubview(detailImage)
    
    if let imgWidth = detailImage.image?.size.width, let imgHeight = detailImage.image?.size.height {
      print("im here")
      let imageAspectRation = imgWidth / imgHeight
//      detailImage.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.width / imageAspectRation).isActive = true
      let safeAreaAspectRation = view.safeAreaLayoutGuide.layoutFrame.size.width / view.safeAreaLayoutGuide.layoutFrame.size.height
      
      print(imageAspectRation, safeAreaAspectRation)
      if imageAspectRation < safeAreaAspectRation {
        if let tabBarHeight = tabBarController?.tabBar.frame.size.height {
          print("Tab bar height: \(tabBarHeight)")
          detailImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
        }
        
        
      } else {
//        detailImage.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.width / imageAspectRation).isActive = true
        if let tabBarHeight = tabBarController?.tabBar.frame.size.height, let navigationBarHeight = navigationController?.navigationBar.frame.size.height {
          print("Tab bar height: \(tabBarHeight)")
          detailImage.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.height-tabBarHeight*2).isActive = true
        }
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        detailImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        detailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
      }
    }
    
    
//    detailImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
    
//    if let imgWidth = detailImage.image?.size.width, let imgHeight = detailImage.image?.size.height {
//      let imageAspectRation = imgWidth / imgHeight
//      detailImage.heightAnchor.constraint(equalToConstant: view.safeAreaLayoutGuide.layoutFrame.size.width / imageAspectRation).isActive = true
//    } else {
//      detailImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1).isActive = true
//    }
    
    
    
    detailImage.contentMode = .scaleToFill
    
    
    
    
//    let tabBar = UITabBar()
//    view.addSubview(tabBar)
//    tabBar.translatesAutoresizingMaskIntoConstraints = true
//    tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    tabBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    
    
    
    
    
    
    
//    switch pedal.name {
//    case "Count To 5":
//      print("count to 5")
//
//    default:
//      print("other")
//    }
    
//    print(pedalDetailImage)
    
//    if let detailImage = pedalDetailImage { detailImage.image = pedal.image }
    
  
  }

}
