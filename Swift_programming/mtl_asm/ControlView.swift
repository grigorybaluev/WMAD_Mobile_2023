//
//  ControlTableView.swift
//  mtl_asm
//
//  Created by MacBook on 13.12.2023.
//

import Foundation
import UIKit
import OneFingerRotation
import SwiftUI

//class ControlTableViewCell: UITableViewCell {
class ControlView: UIView {
  var pedal: Pedal!
  var slider1 = UISlider()
  var slider2 = UISlider()
  var slider3 = UISlider()
  var slider4 = UISlider()
  var switch1 = UISwitch()

  var knob1Angle: Float = 0.5
  var knob2Angle: Float = 0.5
  var knob3Angle: Float = 0.5
  var knob4Angle: Float = 0.5
  var knobAngles: [Float] = []
  var switch1state: Bool = false
//  var controlCell: ControlTableViewCell?
//  weak var delegate: ControlTableViewCellDelegate?
  
  
  
  func addControls() {
    
    let mixLabel = UILabel()
    mixLabel.text = "MIX"
    mixLabel.translatesAutoresizingMaskIntoConstraints = false
    mixLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
    
    let mixSlider = UISlider()
    mixSlider.translatesAutoresizingMaskIntoConstraints = false
    mixSlider.minimumValue = Float.pi * (-0.9)
    mixSlider.maximumValue = Float.pi * 0.9
    mixSlider.setValue(0, animated: false)
    mixSlider.tintColor = pedal.textColor
    //      mixSlider.addTarget(self, action: #selector(CountMixSliderValueChanged(_:)), for: .valueChanged)
    slider1 = mixSlider
    
    
    
    let onOffLabel = UILabel()
    onOffLabel.text = "ON/OFF"
    onOffLabel.translatesAutoresizingMaskIntoConstraints = false
    onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
    
    lazy var onOffSwitch: UISwitch = {
      let onOffSwitch = UISwitch()
      onOffSwitch.isOn = false
      onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
      onOffSwitch.tintColor = pedal.color
      onOffSwitch.onTintColor = pedal.textColor
      //        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
      return onOffSwitch
    }()
    
//    let randomButton = UIButton(type: .roundedRect)
//    randomButton.setTitle("Randomize", for: .normal)
//    randomButton.addTarget(self, action: #selector(randomizeButtonTapped), for: .touchUpInside)
//    randomButton.backgroundColor = pedal.color
//    randomButton.setTitleColor(pedal.textColor, for: .normal)
//    randomButton.layer.cornerRadius = 8
    
    let horStackView1 = UIStackView()
    horStackView1.axis = .horizontal
    horStackView1.addArrangedSubview(mixLabel)
    horStackView1.addArrangedSubview(mixSlider)
    horStackView1.translatesAutoresizingMaskIntoConstraints = false
    horStackView1.alignment = .fill
    horStackView1.distribution = .fill
    horStackView1.spacing = 25
    
    let horStackView2 = UIStackView()
    horStackView2.axis = .horizontal
    horStackView2.addArrangedSubview(onOffLabel)
    horStackView2.addArrangedSubview(onOffSwitch)
//    horStackView2.addArrangedSubview(randomButton)
    horStackView2.translatesAutoresizingMaskIntoConstraints = false
    horStackView2.alignment = .center
    horStackView2.distribution = .fill
    horStackView2.spacing = 25
    
    let vertStackView = UIStackView()
    vertStackView.axis = .vertical
    vertStackView.addArrangedSubview(horStackView1)
    vertStackView.addArrangedSubview(horStackView2)
    super.addSubview(vertStackView)
    vertStackView.translatesAutoresizingMaskIntoConstraints = false
    vertStackView.alignment = .fill
    vertStackView.distribution = .fillEqually
    
    let labelWidth = CGFloat(85)
    mixLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
    //      dir1Label.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
    //      lenLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
    //      fbkLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
    onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
    
    vertStackView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 10).isActive = true
    vertStackView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -10).isActive = true
    vertStackView.topAnchor.constraint(equalTo: super.topAnchor, constant: 10).isActive = true
    vertStackView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -10).isActive = true
    
    
    knobAngles = [knob1Angle, knob2Angle, knob3Angle, knob4Angle]
  }
//
//  @objc func randomizeButtonTapped() {
//    print("Button tapped!")
//    knob1Angle = Float.random(in: 0.1..<0.9)
//    knob2Angle = Float.random(in: 0.1..<0.9)
//    knob3Angle = Float.random(in: 0.1..<0.9)
//    knob4Angle = Float.random(in: 0.1..<0.9)
//    knobAngles = [knob1Angle, knob2Angle, knob3Angle, knob4Angle]
//    print(knobAngles)
//  }
//
//  @objc func onOffSwitchValueChanged(_ sender: UISwitch) {
//    delegate?.requestSwitchUpdate(self, .YourOnOffLight)
//    if sender.isOn {
//      // Switch is turned on
//      print("Switch1 is ON")
//      switch1state = true
//    } else {
//      // Switch is turned off
//      print("Switch1 is OFF")
//      switch1state = false
//    }
//  }
//
//  @objc func YourVolSliderValueChanged(_ sender: UISlider) {
//    delegate?.requestImageAngleUpdate(self, .YoureVolKnob)
//    knob1Angle = sender.value
//    print("knob 1 angle: ", knob1Angle)
//  }
//
//  @objc func YourToneSliderValueChanged(_ sender: UISlider) {
//    delegate?.requestImageAngleUpdate(self, .YoureToneKnob)
//    knob2Angle = sender.value
//    print("knob 2 angle: ", knob2Angle)
//  }
//
//  @objc func CountMixSliderValueChanged(_ sender: UISlider) {
//    delegate?.requestImageAngleUpdate(self, .CountKnob1)
//    knob1Angle = sender.value
//  }
//
//  @objc func CountDir1SliderValueChanged(_ sender: UISlider) {
//    delegate?.requestImageAngleUpdate(self, .CountKnob2)
//    knob2Angle = sender.value
//  }
//
//  @objc func CountLenSliderValueChanged(_ sender: UISlider) {
//    delegate?.requestImageAngleUpdate(self, .CountKnob3)
//    knob3Angle = sender.value
//  }
//
//  @objc func CountFbkSliderValueChanged(_ sender: UISlider) {
//    delegate?.requestImageAngleUpdate(self, .CountKnob4)
//    knob4Angle = sender.value
//  }
//
//  func requestImageAngleUpdate(_ cell: ControlTableViewCell, _ targetKnob: TargetKnob) {
//    print("request image angle update")
//  }
//
//  func requestSwitchUpdate(_ cell: ControlTableViewCell, _ switchTarget: SwitchTarget) {
//    print("request switch update")
//  }
}



