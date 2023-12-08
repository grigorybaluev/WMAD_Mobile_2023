//
//  PedalImageCell.swift
//  mtl_asm
//
//  Created by MacBook on 14.06.2023.
//

import UIKit

class PedalImageCell: UITableViewCell {
//  var pedalCellImageView = UIImageView()
  var pedalCellImageView = UIImageView()
  var pedal: Pedal!
  var knob1 = UIImageView()
  var knob2 = UIImageView()
  var knob3 = UIImageView()
  var knob4 = UIImageView()
  var onOffLight1 = UIView()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
