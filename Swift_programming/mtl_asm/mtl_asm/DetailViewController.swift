//
//  DetailViewController.swift
//  mtl_asm
//
//  Created by MacBook on 13.12.2023.
//

import Foundation
import SwiftUI
import UIKit
import OneFingerRotation

class DetailViewController: UIViewController {
  var pedal: Pedal!
  var knob1 = UIImageView()
  var knob2 = UIImageView()
  var knob3 = UIImageView()
  var knob4 = UIImageView()
  var pedalImage = PedalImageView()
  
  var slider1 = UISlider()
  var slider2 = UISlider()
  var slider3 = UISlider()
  var slider4 = UISlider()
  var switch1 = UISwitch()

  var knob1Angle: Float = 0.0
  var knob2Angle: Float = 0.0
  var knob3Angle: Float = 0.0
  var knob4Angle: Float = 0.0
  var switch1state: Bool = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = pedal.name
    super.view.backgroundColor = .black
    
    pedalImage = PedalImageView()
    pedalImage.pedal = pedal
    pedalImage.pedalImageView.image = pedal.image
    super.view.addSubview(pedalImage)
    pedalImage.updateImage()
    
    
    pedalImage.translatesAutoresizingMaskIntoConstraints = false
    
    var NBHeight = CGFloat(0.0)
    
//    if let navigationController = self.navigationController {
//      // You can use the navigationController here
//      print("Found navigation controller: \(navigationController)")
//
//      // Get the bottom anchor of the navigation bar
//      let topNBAnchor = navigationController.navigationBar.topAnchor
//      NBHeight = navigationController.navigationBar.frame.minY
//
//    } else {
//      print("No navigation controller found.")
//      NBHeight = 100.0
//    }
    
    print(NBHeight)
    NSLayoutConstraint.activate([
      pedalImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
      pedalImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      pedalImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      pedalImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
    
    let controlView = ControlView()
    super.view.addSubview(controlView)
    controlView.translatesAutoresizingMaskIntoConstraints = false
    controlView.pedal = pedal
    controlView.addControls()
    print("check Y: ", pedalImage.frame.height)
    print("check Y: ", pedalImage.frame.maxY)
    print("check Y: ", pedalImage.frame.minY)
    NSLayoutConstraint.activate([
      controlView.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 650),
      controlView.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -80),
      controlView.leadingAnchor.constraint(equalTo: super.view.leadingAnchor),
      controlView.trailingAnchor.constraint(equalTo: super.view.trailingAnchor)
    ])
    
    
    let randomButton = UIButton(type: .roundedRect)
    randomButton.setTitle("Randomize", for: .normal)
    randomButton.addTarget(self, action: #selector(randomizeButtonTapped), for: .touchUpInside)
    randomButton.backgroundColor = pedal.color
    randomButton.setTitleColor(pedal.textColor, for: .normal)
    randomButton.layer.cornerRadius = 8
    super.view.addSubview(randomButton)
    randomButton.translatesAutoresizingMaskIntoConstraints = false
    
    randomButton.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 200).isActive = true
    randomButton.trailingAnchor.constraint(equalTo: super.view.trailingAnchor, constant: -12).isActive = true
    randomButton.topAnchor.constraint(equalTo: super.view.topAnchor, constant: 715).isActive = true
    randomButton.bottomAnchor.constraint(equalTo: super.view.bottomAnchor, constant: -100).isActive = true
    
    
    
    
    // Create an info button
    let infoButton = UIButton(type: .infoLight)
    infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
    
    // Create a bar button item with the info button
    let infoBarButtonItem = UIBarButtonItem(customView: infoButton)
    
    // Set the bar button item as the right bar button item of the navigation item
    navigationItem.rightBarButtonItem = infoBarButtonItem
  }
  
  @objc func infoButtonTapped() {
    // Handle the info button tap event
    print("Info button tapped!")
//    let pedal = pedals[indexPath.row]
    
//    let detailTVC = DetailTableViewController()
//    detailTVC.pedal = pedal
//    navigationController?.pushViewController(detailTVC, animated: true)
    let pedalInfoVC = PedalInfoTableViewController()
    pedalInfoVC.pedal = pedal
    navigationController?.pushViewController(pedalInfoVC, animated: true)
  }
  
  @objc func randomizeButtonTapped() {
    print("Button tapped!")
    var n = 0
    if [0, 1, 4, 5].contains([pedal.id]) {
      n = 4
    } else if pedal.id == 2 {
      return
    } else {
      n = 2
    }
    for i in 0..<n {
      self.pedalImage.knobs[i].transform = CGAffineTransform(rotationAngle: CGFloat(Float.random(in: -0.9..<0.9)*180))
    }
  }
}
