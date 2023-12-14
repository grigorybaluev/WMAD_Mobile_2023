//
//  PedalImageCell.swift
//  mtl_asm
//
//  Created by MacBook on 14.06.2023.
//

import UIKit
import OneFingerRotation
import SwiftUI

class PedalImageCell: UITableViewCell {
//  var pedalCellImageView = UIImageView()
  var pedalCellImageView = UIImageView()
  var pedal: Pedal!
  var knob1 = UIImageView()
  var knob2 = UIImageView()
  var knob3 = UIImageView()
  var knob4 = UIImageView()
  var onOffLight1 = UIView()
  var initialRotation = 0.0
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    commonInit()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    commonInit()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
//    addPanGestureRecognizer()
    addRotationGestureRecognizer()
    print("awakeFromNib!!!!!!!!!!")
  }
  
  private func commonInit() {
    // Initialize and configure subviews, add gesture recognizer, etc.
//    addPanGestureRecognizer()
    addRotationGestureRecognizer()
    print("commonInit()")
  }
  
  func addPanGestureRecognizer() {
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//    knob1.addGestureRecognizer(panGesture)
    self.contentView.addGestureRecognizer(panGesture)
//    knob1.addGestureRecognizer(panGesture)
    
    print("addPanGestureRecognizer()")
  }
  
  func addRotationGestureRecognizer() {
//    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
//    knob1.addGestureRecognizer(panGesture)
    knob1.addGestureRecognizer(rotationGesture)
//    knob1.addGestureRecognizer(panGesture)
    print("addRotationGestureRecognizer()")
  }
  
  @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
    print("handlePan")
//    let translation = gesture.translation(in: knob1)
//    let translation = gesture.translation(in: pedalCellImageView)
    let translation = gesture.translation(in: self.contentView)
//    let translation = gesture.translation(in: superview)
//    let translation = gesture.translation(in: nil)
    
    // Check if the gesture's location is within the desired range
//    let location = gesture.location(in: nil)
//    let minX: CGFloat = 0
//    let maxX: CGFloat = 200
//    let minY: CGFloat = 0
//    let maxY: CGFloat = 200
//
//    if location.x >= minX && location.x <= maxX && location.y >= minY && location.y <= maxY {
//      // Perform actions based on the translation within the restricted area
//      // For example, update constraints, change alpha, etc.
//      // You can also pass the translation or other information to another method
//
//      let angularDisplacement = sqrt(pow(translation.x, 2) + pow(translation.y, 2)) / 1000
//      var delta = 0.0
//
//      if translation.y < 0 {
//        delta = initialRotation - angularDisplacement
//      }
//      else if translation.y > 0 {
//        delta = initialRotation + angularDisplacement
//      }
//      knob1.transform = CGAffineTransform(rotationAngle: CGFloat(delta))
//      initialRotation = CGFloat(delta)
//      let rotationMax = 2.4
//      if initialRotation < -rotationMax {
//        initialRotation = -rotationMax
//      } else if initialRotation > rotationMax {
//        initialRotation = rotationMax
//      }
//
//      // Reset the translation to avoid cumulative changes
//      gesture.setTranslation(.zero, in: knob1)
//    }
    
    
    let angularDisplacement = sqrt(pow(translation.x, 2) + pow(translation.y, 2)) / 1000
    var delta = 0.0

    if translation.y < 0 {
      delta = initialRotation - angularDisplacement
    }
    else if translation.y > 0 {
      delta = initialRotation + angularDisplacement
    }
    knob1.transform = CGAffineTransform(rotationAngle: CGFloat(delta))
    
    initialRotation = CGFloat(delta)
    let rotationMax = 2.4
    if initialRotation < -rotationMax {
      initialRotation = -rotationMax
    } else if initialRotation > rotationMax {
      initialRotation = rotationMax
    }
  }
  
  @objc func handleRotation(_ gesture: UIRotationGestureRecognizer) {
    print("handleRotation")
    
    if gesture.state == .began || gesture.state == .changed {
      print("startstartstartstart")
      // Relative offset from the start of the gesture
//      let offset = gesture.
//
//      // Ignore moves to the left of the starting point
//      let right = max(offset.x, 0)
//
//      // Only rotate up to 75 degrees - just an example
//      let angleDeg = min(right / box.bounds.size.width * 90, 75)
//
//      // Create and set the rotation transform on the green box
//      let rotate = CGAffineTransform(rotationAngle: angleDeg / 180 * .pi)
//      box.transform = rotate
    }
  }
  
  func updateImage() {
    pedalCellImageView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(pedalCellImageView)
    pedalCellImageView.layer.cornerRadius = 20
    pedalCellImageView.layer.masksToBounds = true
    
    switch pedal.id {
    case 0:
      print("Count To 5")

      NSLayoutConstraint.activate([
        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        pedalCellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        pedalCellImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
        pedalCellImageView.heightAnchor.constraint(equalToConstant: 540)
      ])

      let knobImage1 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      let knobImage2 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      let knobImage3 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      let knobImage4 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      knob1 = knobImage1
      knob2 = knobImage2
      knob3 = knobImage3
      knob4 = knobImage4
      let knobImages = [knobImage1, knobImage2, knobImage3, knobImage4]
      for (index, knobImage) in knobImages.enumerated() {
        contentView.addSubview(knobImage)
        
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        let yStep = 88
//        print(CGFloat(-5 + yStep*index))

        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -87).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-207 + yStep*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 63).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 63).isActive = true
      }

      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
//      onOffLight.
      onOffLight.layer.cornerRadius = 11
      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 70).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 22).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 22).isActive = true
      onOffLight1 = onOffLight
//    case 0:
//      print("Count To 5")
//
//      NSLayoutConstraint.activate([
//        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//        pedalCellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//        pedalCellImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
//        pedalCellImageView.heightAnchor.constraint(equalToConstant: 540)
//      ])
//
//      let knobImage1 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
//
//      knob1 = knobImage1
//
//      contentView.addSubview(knobImage1)
//      knobImage1.translatesAutoresizingMaskIntoConstraints = false
//      let yStep = 88
////        print(CGFloat(-5 + yStep*index))
//
//      knobImage1.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -87).isActive = true
////        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
//      knobImage1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-207)).isActive = true
//      knobImage1.heightAnchor.constraint(equalToConstant: 63).isActive = true
//      knobImage1.widthAnchor.constraint(equalToConstant: 63).isActive = true
      
      
//      let onOffLight = UIView()
//      onOffLight.translatesAutoresizingMaskIntoConstraints = false
//      contentView.addSubview(onOffLight)
//      onOffLight.backgroundColor = .red
//      onOffLight.alpha = 0.0
////      onOffLight.
//      onOffLight.layer.cornerRadius = 11
//      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 70).isActive = true
//      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 15).isActive = true
//      onOffLight.heightAnchor.constraint(equalToConstant: 22).isActive = true
//      onOffLight.widthAnchor.constraint(equalToConstant: 22).isActive = true
//      onOffLight1 = onOffLight
      
    case 1:
      print("Too Positive")
      NSLayoutConstraint.activate([
        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        pedalCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        pedalCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        pedalCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
      ])
      
      let knobImage1 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      let knobImage2 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      let knobImage3 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      let knobImage4 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      knob1 = knobImage1
      knob2 = knobImage2
      knob3 = knobImage3
      knob4 = knobImage4
      let knobImages = [knobImage1, knobImage2]
      let knobImages2 = [knobImage3, knobImage4]
      for (index, knobImage) in knobImages.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        let yStep = 110
//        print(CGFloat(-5 + yStep*index))
        
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 44).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-100 + yStep*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
      }
      for (index, knobImage) in knobImages2.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        let yStep = 110
//        print(CGFloat(-5 + yStep*index))
        
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -140).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-100 + yStep*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 135).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 103).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight
    case 2:
      print("PURPLL")
      
      NSLayoutConstraint.activate([
        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        pedalCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        pedalCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        pedalCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
      ])
    case 3:
      print("Your and You're")
      NSLayoutConstraint.activate([
        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        pedalCellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        pedalCellImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
        pedalCellImageView.heightAnchor.constraint(equalToConstant: 540)
      ])
      
      let knobImage1 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      let knobImage2 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      knob1 = knobImage1
      knob2 = knobImage2
      let knobImages = [knobImage1, knobImage2]
      for (index, knobImage) in knobImages.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        let yStep = 188
//        print(CGFloat(-5 + yStep*index))
        
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -42).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-168 + yStep*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
//      onOffLight.
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -41).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -68).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight
      
    case 4:
      print("UPPERS")
      NSLayoutConstraint.activate([
        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        pedalCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        pedalCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        pedalCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
      ])
      
      let knobImage1 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
      let knobImage2 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
      let knobImage3 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
      let knobImage4 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
      knob1 = knobImage1
      knob2 = knobImage2
      knob3 = knobImage3
      knob4 = knobImage4
      let knobImages = [knobImage1, knobImage2]
      let knobImages2 = [knobImage3, knobImage4]
      for (index, knobImage) in knobImages.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-85)).isActive = true
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: CGFloat(44 + 90*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
      }
      for (index, knobImage) in knobImages2.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: CGFloat(-140 + 90*index)).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 135).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 103).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight

    case 5:
      print("Positive Overdrive")
      NSLayoutConstraint.activate([
        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        pedalCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        pedalCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        pedalCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
      ])
      
      let knobImage1 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      let knobImage2 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      let knobImage3 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      let knobImage4 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
      knob1 = knobImage1
      knob2 = knobImage2
      knob3 = knobImage3
      knob4 = knobImage4
      let knobImages = [knobImage1, knobImage2]
      let knobImages2 = [knobImage3, knobImage4]
      for (index, knobImage) in knobImages.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        let yStep = 110
//        print(CGFloat(-5 + yStep*index))
        
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 44).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-100 + yStep*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
      }
      for (index, knobImage) in knobImages2.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        let yStep = 110
//        print(CGFloat(-5 + yStep*index))
        
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -140).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-100 + yStep*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 135).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 103).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight

    case 6:
      print("Ça pis Sa")
      
      NSLayoutConstraint.activate([
        pedalCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        pedalCellImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        pedalCellImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
        pedalCellImageView.heightAnchor.constraint(equalToConstant: 540)
      ])
      
      let knobImage1 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
      let knobImage2 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
      knob1 = knobImage1
      knob2 = knobImage2
      let knobImages = [knobImage1, knobImage2]
      for (index, knobImage) in knobImages.enumerated() {
        contentView.addSubview(knobImage)
        knobImage.translatesAutoresizingMaskIntoConstraints = false
        let yStep = 188
//        print(CGFloat(-5 + yStep*index))
        
        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -42).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-168 + yStep*index)).isActive = true
        knobImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        knobImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
//      onOffLight.
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -41).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -68).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight
      
//      guard let gr = UITapGestureRecognizer(coder: NSCoder()) else { return }
//      tapPiece(gr)
      
      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))

      // Add the gesture recognizer to the view
      pedalCellImageView.addGestureRecognizer(tapGesture)
      
    default:
      print("no pedal")
    }
  }
  
  @objc func handleTap(_ gesture: UITapGestureRecognizer) {
    // Handle the tap gesture here
    print("Tap gesture detected!")
    
    // You can access additional information, such as the tap location
    let tapLocation = gesture.location(in: pedalCellImageView)
    print("Tap location: \(tapLocation)")
  }
  
  @IBAction func tapPiece(_ gestureRecognizer : UITapGestureRecognizer ) {
    print("tap Piece")
    guard gestureRecognizer.view != nil else { return }
    
    if gestureRecognizer.state == .ended {      // Move the view down and to the right when tapped.
      let animator = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut, animations: {
        gestureRecognizer.view!.center.x += 100
        gestureRecognizer.view!.center.y += 100
      })
      animator.startAnimation()
    }
  }
  //  pedalCellImageView.translatesAutoresizingMaskIntoConstraints = false
//  view.addSubview(pedalCellImageView)
//  pedalCellImageView.
  
  func updateImageRotationAngle(_ controlCell: ControlTableViewCell, _ targetKnob: TargetKnob) {
    switch targetKnob{
    case .YoureVolKnob:
      knob1.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob1Angle))
    case .YoureToneKnob:
      knob2.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob2Angle))
    case .CountKnob1:
      knob1.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob1Angle))
    case .CountKnob2:
      knob2.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob2Angle))
    case .CountKnob3:
      knob3.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob3Angle))
    case .CountKnob4:
      knob4.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob4Angle))
    }
  }
  
  func updateSwitch(_ controlCell: ControlTableViewCell, _ switchTarget: SwitchTarget) {
    switch switchTarget {
    case .YourOnOffLight:
      let targetAlpha: CGFloat = controlCell.switch1state ? 0.0 : 0.5
      UIView.animate(withDuration: 0.3) {
        self.onOffLight1.alpha = targetAlpha
      }
    }
  }
}


enum TargetKnob {
  case YoureVolKnob
  case YoureToneKnob
  case CountKnob1
  case CountKnob2
  case CountKnob3
  case CountKnob4
}

enum SwitchTarget {
  case YourOnOffLight
}

//struct KnobImageView: View {
//  var imageName: String
//  var body: some View {
//    Image(imageName)
////      .imageScale(.large)
////      .foregroundColor(.accentColor)
////      .padding()
////      .rotationEffect(Angle(degrees: 45.0))
//      .simpleRotationInertia()
//  }
//  
//  init(imageName: String) {
//    self.imageName = imageName
//  }
//}
