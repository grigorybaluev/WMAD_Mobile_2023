//
//  PedalView.swift
//  mtl_asm
//
//  Created by MacBook on 13.12.2023.
//

import Foundation
import UIKit
import OneFingerRotation
import SwiftUI

class PedalImageView: UIView {
  //  var pedalCellImageView = UIImageView()
  var pedalImageView = UIImageView()
  var pedal: Pedal!
  var knob1 = UIImageView()
  var knob2 = UIImageView()
  var knob3 = UIImageView()
  var knob4 = UIImageView()
  var knobs = [UIView]()
  var onOffLight1 = UIView()
  var initialRotation = 0.0
  
  
  
  func updateImage() {
    super.addSubview(pedalImageView)
    pedalImageView.translatesAutoresizingMaskIntoConstraints = false
    
    pedalImageView.layer.cornerRadius = 20
    pedalImageView.layer.masksToBounds = true
    
    switch pedal.id {
    case 0:
      print("Count To 5")
      
      NSLayoutConstraint.activate([
        pedalImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8),
        pedalImageView.centerXAnchor.constraint(equalTo: super.centerXAnchor),
        pedalImageView.widthAnchor.constraint(equalTo: super.widthAnchor, multiplier: 0.75),
        pedalImageView.heightAnchor.constraint(equalToConstant: 540)
      ])
      
      //      let knobImage1 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      //      let knobImage2 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      //      let knobImage3 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      //      let knobImage4 = UIImageView(image: UIImage(named: "CountTo5Knob.png"))
      
      //      let knobImage1 = KnobImageView(imageName: "CountTo5Knob.png")
      
      let knobSize = CGFloat(70)
      
      //      let k1hc = UIHostingController(rootView: KnobImageView(imageName: "CountTo5Knob", size: knobSize))
      //      let k2hc = UIHostingController(rootView: KnobImageView(imageName: "CountTo5Knob", size: knobSize))
      //      let k3hc = UIHostingController(rootView: KnobImageView(imageName: "CountTo5Knob", size: knobSize))
      //      let k4hc = UIHostingController(rootView: KnobImageView(imageName: "CountTo5Knob", size: knobSize))
//      var knobs: [UIView] = []
      
      
      //      for (index, k) in knobs.enumerated() {
      for index in 0..<4 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "CountTo5Knob", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        
        let yStep = 90
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: -87).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(-310 + yStep*index)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      
    case 1:
      print("Too Positive")
      
      NSLayoutConstraint.activate([
        pedalImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8),
        pedalImageView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 8),
        pedalImageView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -8),
        pedalImageView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -250)
      ])
      
      let knobSize = CGFloat(80)
      let yStep = 110
      let yOffset = -225
      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "YourAndYou're_knob_outline", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: 44).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(yOffset + yStep*index)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "YourAndYou're_knob_outline", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: -140).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(yOffset + yStep*index)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      super.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: 135).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: 103).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight
    case 2:
      print("PURPLL")
      
      NSLayoutConstraint.activate([
        pedalImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8),
        pedalImageView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 8),
        pedalImageView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -8),
        pedalImageView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -430)
      ])
    case 3:
      print("Your and You're")
      NSLayoutConstraint.activate([
        pedalImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8),
        pedalImageView.centerXAnchor.constraint(equalTo: super.centerXAnchor),
        pedalImageView.widthAnchor.constraint(equalTo: super.widthAnchor, multiplier: 0.75),
        pedalImageView.heightAnchor.constraint(equalToConstant: 540)
      ])
      
      let knobSize = CGFloat(85)
      let yStep = 185
      let yOffset = -262

      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "YourAndYou're_knob_outline", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: -40).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(yOffset + yStep*index)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      
//      let knobImage1 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
//      let knobImage2 = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
//      knob1 = knobImage1
//      knob2 = knobImage2
//      let knobImages = [knobImage1, knobImage2]
//      for (index, knobImage) in knobImages.enumerated() {
//        contentView.addSubview(knobImage)
//        knobImage.translatesAutoresizingMaskIntoConstraints = false
//        let yStep = 188
//        //        print(CGFloat(-5 + yStep*index))
//
//        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -42).isActive = true
//        //        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-168 + yStep*index)).isActive = true
//        knobImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        knobImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
//      }
//
//      let onOffLight = UIView()
//      onOffLight.translatesAutoresizingMaskIntoConstraints = false
//      contentView.addSubview(onOffLight)
//      onOffLight.backgroundColor = .red
//      onOffLight.alpha = 0.0
//      //      onOffLight.
//      onOffLight.layer.cornerRadius = 9
//      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -41).isActive = true
//      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -68).isActive = true
//      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight1 = onOffLight
      
    case 4:
      print("UPPERS")
      NSLayoutConstraint.activate([
        pedalImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8),
        pedalImageView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 8),
        pedalImageView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -8),
        pedalImageView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -250)
      ])
      
      let knobSize = CGFloat(75)
      let xStep = 90
//      let yOffset = -207
      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "UPPERS_knob", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: CGFloat(-140 + xStep*index)).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(-135)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "UPPERS_knob", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: CGFloat(44 + xStep*index)).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(-207)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      
//      for index in 0..<2 {
//        var k = UIHostingController(rootView: KnobImageView(imageName: "UPPERS_knob", size: knobSize))
//        super.addSubview(k.view)
//        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
//        k.view.translatesAutoresizingMaskIntoConstraints = false
//        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: -140).isActive = true
//        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(yOffset + yStep*index)).isActive = true
//        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
//        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
//        knobs.append(k.view)
//      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      super.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: 135).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: 103).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight
//      let knobImage1 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
//      let knobImage2 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
//      let knobImage3 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
//      let knobImage4 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
//      knob1 = knobImage1
//      knob2 = knobImage2
//      knob3 = knobImage3
//      knob4 = knobImage4
//      let knobImages = [knobImage1, knobImage2]
//      let knobImages2 = [knobImage3, knobImage4]
//      for (index, knobImage) in knobImages.enumerated() {
//        contentView.addSubview(knobImage)
//        knobImage.translatesAutoresizingMaskIntoConstraints = false
//
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-85)).isActive = true
//        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: CGFloat(44 + 90*index)).isActive = true
//        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
//        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
//      }
//      for (index, knobImage) in knobImages2.enumerated() {
//        contentView.addSubview(knobImage)
//        knobImage.translatesAutoresizingMaskIntoConstraints = false
//
//        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: CGFloat(-140 + 90*index)).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
//        knobImage.heightAnchor.constraint(equalToConstant: 73).isActive = true
//        knobImage.widthAnchor.constraint(equalToConstant: 73).isActive = true
//      }
//
//      let onOffLight = UIView()
//      onOffLight.translatesAutoresizingMaskIntoConstraints = false
//      contentView.addSubview(onOffLight)
//      onOffLight.backgroundColor = .red
//      onOffLight.alpha = 0.0
//      onOffLight.layer.cornerRadius = 9
//      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 135).isActive = true
//      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 103).isActive = true
//      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight1 = onOffLight
//
    case 5:
      print("Positive Overdrive")
      NSLayoutConstraint.activate([
        pedalImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8),
        pedalImageView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 8),
        pedalImageView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -8),
        pedalImageView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -250)
      ])
      
      let knobSize = CGFloat(80)
      let yStep = 110
      let yOffset = -225
      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "YourAndYou're_knob_outline", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: 44).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(yOffset + yStep*index)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "YourAndYou're_knob_outline", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: -140).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(yOffset + yStep*index)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      
      let onOffLight = UIView()
      onOffLight.translatesAutoresizingMaskIntoConstraints = false
      super.addSubview(onOffLight)
      onOffLight.backgroundColor = .red
      onOffLight.alpha = 0.0
      onOffLight.layer.cornerRadius = 9
      onOffLight.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: 135).isActive = true
      onOffLight.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: 103).isActive = true
      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
      onOffLight1 = onOffLight
      
//
//      let onOffLight = UIView()
//      onOffLight.translatesAutoresizingMaskIntoConstraints = false
//      contentView.addSubview(onOffLight)
//      onOffLight.backgroundColor = .red
//      onOffLight.alpha = 0.0
//      onOffLight.layer.cornerRadius = 9
//      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 135).isActive = true
//      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 103).isActive = true
//      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight1 = onOffLight
//
    case 6:
      print("Ça pis Sa")
      
      NSLayoutConstraint.activate([
        pedalImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 8),
        pedalImageView.centerXAnchor.constraint(equalTo: super.centerXAnchor),
        pedalImageView.widthAnchor.constraint(equalTo: super.widthAnchor, multiplier: 0.75),
        pedalImageView.heightAnchor.constraint(equalToConstant: 540)
      ])
      
      let knobSize = CGFloat(85)
      let yStep = 185
      let yOffset = -262

      for index in 0..<2 {
        var k = UIHostingController(rootView: KnobImageView(imageName: "UPPERS_knob", size: knobSize))
        super.addSubview(k.view)
        k.view.backgroundColor = UIColor(white: CGFloat(0), alpha: CGFloat(0))
        k.view.translatesAutoresizingMaskIntoConstraints = false
        k.view.centerXAnchor.constraint(equalTo: super.centerXAnchor, constant: -40).isActive = true
        k.view.centerYAnchor.constraint(equalTo: super.centerYAnchor, constant: CGFloat(yOffset + yStep*index)).isActive = true
        k.view.heightAnchor.constraint(equalToConstant: 63).isActive = true
        k.view.widthAnchor.constraint(equalToConstant: 63).isActive = true
        knobs.append(k.view)
      }
      
//      let knobImage1 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
//      let knobImage2 = UIImageView(image: UIImage(named: "UPPERS_knob.png"))
//      knob1 = knobImage1
//      knob2 = knobImage2
//      let knobImages = [knobImage1, knobImage2]
//      for (index, knobImage) in knobImages.enumerated() {
//        contentView.addSubview(knobImage)
//        knobImage.translatesAutoresizingMaskIntoConstraints = false
//        let yStep = 188
//        //        print(CGFloat(-5 + yStep*index))
//
//        knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -42).isActive = true
//        //        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -45).isActive = true
//        knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: CGFloat(-168 + yStep*index)).isActive = true
//        knobImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        knobImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
//      }
//
//      let onOffLight = UIView()
//      onOffLight.translatesAutoresizingMaskIntoConstraints = false
//      contentView.addSubview(onOffLight)
//      onOffLight.backgroundColor = .red
//      onOffLight.alpha = 0.0
//      //      onOffLight.
//      onOffLight.layer.cornerRadius = 9
//      onOffLight.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -41).isActive = true
//      onOffLight.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -68).isActive = true
//      onOffLight.heightAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight.widthAnchor.constraint(equalToConstant: 18).isActive = true
//      onOffLight1 = onOffLight
//
//      //      guard let gr = UITapGestureRecognizer(coder: NSCoder()) else { return }
//      //      tapPiece(gr)
//
//      let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//
//      // Add the gesture recognizer to the view
//      pedalCellImageView.addGestureRecognizer(tapGesture)
      
    default:
      print("no pedal")
    }
  }
  
  //  func updateImageRotationAngle(_ controlCell: ControlTableViewCell, _ targetKnob: TargetKnob) {
  //    switch targetKnob{
  //    case .YoureVolKnob:
  //      knob1.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob1Angle))
  //    case .YoureToneKnob:
  //      knob2.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob2Angle))
  //    case .CountKnob1:
  //      knob1.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob1Angle))
  //    case .CountKnob2:
  //      knob2.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob2Angle))
  //    case .CountKnob3:
  //      knob3.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob3Angle))
  //    case .CountKnob4:
  //      knob4.transform = CGAffineTransform(rotationAngle: CGFloat(controlCell.knob4Angle))
  //    }
  //  }
  //
  //  func updateSwitch(_ controlCell: ControlTableViewCell, _ switchTarget: SwitchTarget) {
  //    switch switchTarget {
  //    case .YourOnOffLight:
  //      let targetAlpha: CGFloat = controlCell.switch1state ? 0.0 : 0.5
  //      UIView.animate(withDuration: 0.3) {
  //        self.onOffLight1.alpha = targetAlpha
  //      }
  //    }
  //  }
}


struct KnobImageView: View {
  var imageName: String
  var size: CGFloat
  @State var knobValue: Double = 0.5
  var body: some View {
    Image(imageName)
    //      .imageScale(.small)
    //      .foregroundColor(.accentColor)
    //      .padding()
    //      .rotationEffect(Angle(degrees: 45.0))
    //      .simpleRotationInertia()
      .resizable()
      .frame(width: size, height: size)
      .knobRotation(
          knobValue: $knobValue,
          minAngle: -165,
          maxAngle: +165,
          onKnobValueChanged: { newValue in
            knobValue = newValue
          },
          animation: .spring()
        )
//      .simpleRotation()
  }
  
  init(imageName: String, size: CGFloat) {
    self.imageName = imageName
    self.size = size
  }
}
