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

  var knob1Angle: Float = 0.0
  var knob2Angle: Float = 0.0
  var knob3Angle: Float = 0.0
  var knob4Angle: Float = 0.0
  var switch1state: Bool = false
//  var controlCell: ControlTableViewCell?
//  weak var delegate: ControlTableViewCellDelegate?
  
  
  
  func addControls() {
    switch pedal.id {
    case 0:
      print("Count To 5")
      
      let mixLabel = UILabel()
      mixLabel.text = "MIX"
      mixLabel.translatesAutoresizingMaskIntoConstraints = false
      mixLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let mixSlider = UISlider()
      mixSlider.translatesAutoresizingMaskIntoConstraints = false
      mixSlider.minimumValue = Float.pi * (-0.9)
      mixSlider.maximumValue = Float.pi * 0.9
      mixSlider.setValue(0, animated: false)
//      mixSlider.addTarget(self, action: #selector(CountMixSliderValueChanged(_:)), for: .valueChanged)
      slider1 = mixSlider
      
      let dir1Label = UILabel()
      dir1Label.text = "DIR 1"
      dir1Label.translatesAutoresizingMaskIntoConstraints = false
      dir1Label.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let dir1Slider = UISlider()
      dir1Slider.translatesAutoresizingMaskIntoConstraints = false
      dir1Slider.minimumValue = Float.pi * (-0.9)
      dir1Slider.maximumValue = Float.pi * 0.9
      dir1Slider.setValue(0, animated: false)
//      dir1Slider.addTarget(self, action: #selector(CountDir1SliderValueChanged(_:)), for: .valueChanged)
      slider2 = dir1Slider
      
      let lenLabel = UILabel()
      lenLabel.text = "LEN"
      lenLabel.translatesAutoresizingMaskIntoConstraints = false
      lenLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let lenSlider = UISlider()
      lenSlider.translatesAutoresizingMaskIntoConstraints = false
      lenSlider.minimumValue = Float.pi * (-0.9)
      lenSlider.maximumValue = Float.pi * 0.9
      lenSlider.setValue(0, animated: false)
//      lenSlider.addTarget(self, action: #selector(CountLenSliderValueChanged(_:)), for: .valueChanged)
      slider3 = lenSlider
      
      let fbkLabel = UILabel()
      fbkLabel.text = "FBK"
      fbkLabel.translatesAutoresizingMaskIntoConstraints = false
      fbkLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let fbkSlider = UISlider()
      fbkSlider.translatesAutoresizingMaskIntoConstraints = false
      fbkSlider.minimumValue = Float.pi * (-0.9)
      fbkSlider.maximumValue = Float.pi * 0.9
      fbkSlider.setValue(0, animated: false)
//      fbkSlider.addTarget(self, action: #selector(CountFbkSliderValueChanged(_:)), for: .valueChanged)
      slider4 = fbkSlider
      
      let onOffLabel = UILabel()
      onOffLabel.text = "ON/OFF"
      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      lazy var onOffSwitch: UISwitch = {
        let onOffSwitch = UISwitch()
        onOffSwitch.isOn = false
        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
        return onOffSwitch
      }()
      
      let horStackView1 = UIStackView()
      horStackView1.axis = .horizontal
      horStackView1.addArrangedSubview(mixLabel)
      horStackView1.addArrangedSubview(mixSlider)
      horStackView1.translatesAutoresizingMaskIntoConstraints = false
      horStackView1.alignment = .fill
      horStackView1.distribution = .fill
      horStackView1.spacing = 25
      
//      let horStackView2 = UIStackView()
//      horStackView2.axis = .horizontal
//      horStackView2.addArrangedSubview(dir1Label)
//      horStackView2.addArrangedSubview(dir1Slider)
//      horStackView2.translatesAutoresizingMaskIntoConstraints = false
//      horStackView2.alignment = .fill
//      horStackView2.distribution = .fill
//      horStackView2.spacing = 25
//
//      let horStackView3 = UIStackView()
//      horStackView3.axis = .horizontal
//      horStackView3.addArrangedSubview(lenLabel)
//      horStackView3.addArrangedSubview(lenSlider)
//      horStackView3.translatesAutoresizingMaskIntoConstraints = false
//      horStackView3.alignment = .fill
//      horStackView3.distribution = .fill
//      horStackView3.spacing = 25
//
//      let horStackView4 = UIStackView()
//      horStackView4.axis = .horizontal
//      horStackView4.addArrangedSubview(fbkLabel)
//      horStackView4.addArrangedSubview(fbkSlider)
//      horStackView4.translatesAutoresizingMaskIntoConstraints = false
//      horStackView4.alignment = .fill
//      horStackView4.distribution = .fill
//      horStackView4.spacing = 25
      
      let horStackView5 = UIStackView()
      horStackView5.axis = .horizontal
      horStackView5.addArrangedSubview(onOffLabel)
      horStackView5.addArrangedSubview(onOffSwitch)
      horStackView5.translatesAutoresizingMaskIntoConstraints = false
      horStackView5.alignment = .center
      horStackView5.distribution = .fill
      horStackView5.spacing = 25
      
      let vertStackView = UIStackView()
      vertStackView.axis = .vertical
      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(horStackView2)
//      vertStackView.addArrangedSubview(horStackView3)
//      vertStackView.addArrangedSubview(horStackView4)
      vertStackView.addArrangedSubview(horStackView5)
      super.addSubview(vertStackView)
      vertStackView.translatesAutoresizingMaskIntoConstraints = false
      vertStackView.alignment = .fill
      vertStackView.distribution = .fillEqually
      
      let labelWidth = CGFloat(85)
      mixLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      dir1Label.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      lenLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      fbkLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      
      vertStackView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 10).isActive = true
      vertStackView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -10).isActive = true
      vertStackView.topAnchor.constraint(equalTo: super.topAnchor, constant: 10).isActive = true
      vertStackView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -10).isActive = true
      
      
//    case 1:
//      print("Too Positive")
//
//      let volLabel = UILabel()
//      volLabel.text = "VOL"
//      volLabel.translatesAutoresizingMaskIntoConstraints = false
//      volLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let volSlider = UISlider()
//      volSlider.translatesAutoresizingMaskIntoConstraints = false
//      volSlider.minimumValue = Float.pi * (-0.9)
//      volSlider.maximumValue = Float.pi * 0.9
//      volSlider.setValue(0, animated: false)
//      volSlider.addTarget(self, action: #selector(YourVolSliderValueChanged(_:)), for: .valueChanged)
//      slider1 = volSlider
//
//      let toneLabel = UILabel()
//      toneLabel.text = "TONE"
//      toneLabel.translatesAutoresizingMaskIntoConstraints = false
//      toneLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let toneSlider = UISlider()
//      toneSlider.translatesAutoresizingMaskIntoConstraints = false
//      toneSlider.minimumValue = Float.pi * (-0.9)
//      toneSlider.maximumValue = Float.pi * 0.9
//      toneSlider.setValue(0, animated: false)
//      toneSlider.addTarget(self, action: #selector(YourToneSliderValueChanged(_:)), for: .valueChanged)
//
//      let onOffLabel = UILabel()
//      onOffLabel.text = "ON/OFF"
//      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
//      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      lazy var onOffSwitch: UISwitch = {
//        let onOffSwitch = UISwitch()
//        onOffSwitch.isOn = false
//        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
//        return onOffSwitch
//      }()
//
//      let horStackView1 = UIStackView()
//      horStackView1.axis = .horizontal
//      horStackView1.addArrangedSubview(volLabel)
//      horStackView1.addArrangedSubview(volSlider)
//      horStackView1.translatesAutoresizingMaskIntoConstraints = false
//      horStackView1.alignment = .fill
//      horStackView1.distribution = .fill
//      horStackView1.spacing = 25
//
//      let horStackView2 = UIStackView()
//      horStackView2.axis = .horizontal
//      horStackView2.addArrangedSubview(toneLabel)
//      horStackView2.addArrangedSubview(toneSlider)
//      horStackView2.translatesAutoresizingMaskIntoConstraints = false
//      horStackView2.alignment = .fill
//      horStackView2.distribution = .fill
//      horStackView2.spacing = 25
//
//      let horStackView3 = UIStackView()
//      horStackView3.axis = .horizontal
//      horStackView3.addArrangedSubview(onOffLabel)
//      horStackView3.addArrangedSubview(onOffSwitch)
//      horStackView3.translatesAutoresizingMaskIntoConstraints = false
//      horStackView3.alignment = .fill
//      horStackView3.distribution = .fill
//      horStackView3.spacing = 25
//
//      let vertStackView = UIStackView()
//      vertStackView.axis = .vertical
//      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(horStackView2)
//      vertStackView.addArrangedSubview(horStackView3)
//      contentView.addSubview(vertStackView)
//      vertStackView.translatesAutoresizingMaskIntoConstraints = false
//      vertStackView.alignment = .fill
//      vertStackView.distribution = .fillEqually
//
//      let labelWidth = CGFloat(85)
//      volLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      toneLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//
//      vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//      vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//      vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//      vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
//
//    case 2:
//      print("PURPLL")
//
//      let onOffLabel = UILabel()
//      onOffLabel.text = "ON/OFF"
//      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
//      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      lazy var onOffSwitch: UISwitch = {
//        let onOffSwitch = UISwitch()
//        onOffSwitch.isOn = false
//        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
//        return onOffSwitch
//      }()
//
//      let randomButton = UIButton(type: .roundedRect)
//      randomButton.setTitle("Randomize", for: .normal)
//      randomButton.addTarget(self, action: #selector(randomizeButtonTapped), for: .touchUpInside)
//      randomButton.backgroundColor = pedal.color
//      randomButton.setTitleColor(pedal.textColor, for: .normal)
//      randomButton.layer.cornerRadius = 8
//
//
//
//
//      let horStackView1 = UIStackView()
//      horStackView1.axis = .horizontal
//      horStackView1.addArrangedSubview(onOffLabel)
//      horStackView1.addArrangedSubview(onOffSwitch)
//      horStackView1.translatesAutoresizingMaskIntoConstraints = false
//      horStackView1.alignment = .center
//      horStackView1.distribution = .fill
//      horStackView1.spacing = 25
//
//      let vertStackView = UIStackView()
//      vertStackView.axis = .vertical
//      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(randomButton)
////      vertStackView.addArrangedSubview(horStackView2)
////      vertStackView.addArrangedSubview(horStackView3)
//      contentView.addSubview(vertStackView)
//      vertStackView.translatesAutoresizingMaskIntoConstraints = false
//      randomButton.translatesAutoresizingMaskIntoConstraints = false
//      vertStackView.alignment = .fill
//      vertStackView.distribution = .fillEqually
//
////      let labelWidth = CGFloat(85)
////      volLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
////      toneLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
////      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//
//      vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//      vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//      vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//      vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
//
//    case 3:
//      print("Your and You're")
//
//      let volLabel = UILabel()
//      volLabel.text = "VOL"
//      volLabel.translatesAutoresizingMaskIntoConstraints = false
//      volLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let volSlider = UISlider()
//      volSlider.translatesAutoresizingMaskIntoConstraints = false
//      volSlider.minimumValue = Float.pi * (-0.9)
//      volSlider.maximumValue = Float.pi * 0.9
//      volSlider.setValue(0, animated: false)
//      volSlider.addTarget(self, action: #selector(YourVolSliderValueChanged(_:)), for: .valueChanged)
//      slider1 = volSlider
//
//      let toneLabel = UILabel()
//      toneLabel.text = "TONE"
//      toneLabel.translatesAutoresizingMaskIntoConstraints = false
//      toneLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let toneSlider = UISlider()
//      toneSlider.translatesAutoresizingMaskIntoConstraints = false
//      toneSlider.minimumValue = Float.pi * (-0.9)
//      toneSlider.maximumValue = Float.pi * 0.9
//      toneSlider.setValue(0, animated: false)
//      toneSlider.addTarget(self, action: #selector(YourToneSliderValueChanged(_:)), for: .valueChanged)
//
//      let onOffLabel = UILabel()
//      onOffLabel.text = "ON/OFF"
//      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
//      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      lazy var onOffSwitch: UISwitch = {
//        let onOffSwitch = UISwitch()
//        onOffSwitch.isOn = false
//        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
//        return onOffSwitch
//      }()
//
//      let horStackView1 = UIStackView()
//      horStackView1.axis = .horizontal
//      horStackView1.addArrangedSubview(volLabel)
//      horStackView1.addArrangedSubview(volSlider)
//      horStackView1.translatesAutoresizingMaskIntoConstraints = false
//      horStackView1.alignment = .fill
//      horStackView1.distribution = .fill
//      horStackView1.spacing = 25
//
//      let horStackView2 = UIStackView()
//      horStackView2.axis = .horizontal
//      horStackView2.addArrangedSubview(toneLabel)
//      horStackView2.addArrangedSubview(toneSlider)
//      horStackView2.translatesAutoresizingMaskIntoConstraints = false
//      horStackView2.alignment = .fill
//      horStackView2.distribution = .fill
//      horStackView2.spacing = 25
//
//      let horStackView3 = UIStackView()
//      horStackView3.axis = .horizontal
//      horStackView3.addArrangedSubview(onOffLabel)
//      horStackView3.addArrangedSubview(onOffSwitch)
//      horStackView3.translatesAutoresizingMaskIntoConstraints = false
//      horStackView3.alignment = .fill
//      horStackView3.distribution = .fill
//      horStackView3.spacing = 25
//
//      let vertStackView = UIStackView()
//      vertStackView.axis = .vertical
//      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(horStackView2)
//      vertStackView.addArrangedSubview(horStackView3)
//      contentView.addSubview(vertStackView)
//      vertStackView.translatesAutoresizingMaskIntoConstraints = false
//      vertStackView.alignment = .fill
//      vertStackView.distribution = .fillEqually
//
//      let labelWidth = CGFloat(85)
//      volLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      toneLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//
//      vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//      vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//      vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//      vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
//    case 4:
//      print("Uppers")
//
//      let volLabel = UILabel()
//      volLabel.text = "VOL"
//      volLabel.translatesAutoresizingMaskIntoConstraints = false
//      volLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let volSlider = UISlider()
//      volSlider.translatesAutoresizingMaskIntoConstraints = false
//      volSlider.minimumValue = Float.pi * (-0.9)
//      volSlider.maximumValue = Float.pi * 0.9
//      volSlider.setValue(0, animated: false)
//      volSlider.addTarget(self, action: #selector(YourVolSliderValueChanged(_:)), for: .valueChanged)
//      slider1 = volSlider
//
//      let toneLabel = UILabel()
//      toneLabel.text = "TONE"
//      toneLabel.translatesAutoresizingMaskIntoConstraints = false
//      toneLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let toneSlider = UISlider()
//      toneSlider.translatesAutoresizingMaskIntoConstraints = false
//      toneSlider.minimumValue = Float.pi * (-0.9)
//      toneSlider.maximumValue = Float.pi * 0.9
//      toneSlider.setValue(0, animated: false)
//      toneSlider.addTarget(self, action: #selector(YourToneSliderValueChanged(_:)), for: .valueChanged)
//
//      let onOffLabel = UILabel()
//      onOffLabel.text = "ON/OFF"
//      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
//      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      lazy var onOffSwitch: UISwitch = {
//        let onOffSwitch = UISwitch()
//        onOffSwitch.isOn = false
//        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
//        return onOffSwitch
//      }()
//
//      let horStackView1 = UIStackView()
//      horStackView1.axis = .horizontal
//      horStackView1.addArrangedSubview(volLabel)
//      horStackView1.addArrangedSubview(volSlider)
//      horStackView1.translatesAutoresizingMaskIntoConstraints = false
//      horStackView1.alignment = .fill
//      horStackView1.distribution = .fill
//      horStackView1.spacing = 25
//
//      let horStackView2 = UIStackView()
//      horStackView2.axis = .horizontal
//      horStackView2.addArrangedSubview(toneLabel)
//      horStackView2.addArrangedSubview(toneSlider)
//      horStackView2.translatesAutoresizingMaskIntoConstraints = false
//      horStackView2.alignment = .fill
//      horStackView2.distribution = .fill
//      horStackView2.spacing = 25
//
//      let horStackView3 = UIStackView()
//      horStackView3.axis = .horizontal
//      horStackView3.addArrangedSubview(onOffLabel)
//      horStackView3.addArrangedSubview(onOffSwitch)
//      horStackView3.translatesAutoresizingMaskIntoConstraints = false
//      horStackView3.alignment = .fill
//      horStackView3.distribution = .fill
//      horStackView3.spacing = 25
//
//      let vertStackView = UIStackView()
//      vertStackView.axis = .vertical
//      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(horStackView2)
//      vertStackView.addArrangedSubview(horStackView3)
//      contentView.addSubview(vertStackView)
//      vertStackView.translatesAutoresizingMaskIntoConstraints = false
//      vertStackView.alignment = .fill
//      vertStackView.distribution = .fillEqually
//
//      let labelWidth = CGFloat(85)
//      volLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      toneLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//
//      vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//      vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//      vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//      vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
//    case 5:
//      print("Positive Override")
//
//      let volLabel = UILabel()
//      volLabel.text = "VOL"
//      volLabel.translatesAutoresizingMaskIntoConstraints = false
//      volLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let volSlider = UISlider()
//      volSlider.translatesAutoresizingMaskIntoConstraints = false
//      volSlider.minimumValue = Float.pi * (-0.9)
//      volSlider.maximumValue = Float.pi * 0.9
//      volSlider.setValue(0, animated: false)
//      volSlider.addTarget(self, action: #selector(YourVolSliderValueChanged(_:)), for: .valueChanged)
//      slider1 = volSlider
//
//      let toneLabel = UILabel()
//      toneLabel.text = "TONE"
//      toneLabel.translatesAutoresizingMaskIntoConstraints = false
//      toneLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let toneSlider = UISlider()
//      toneSlider.translatesAutoresizingMaskIntoConstraints = false
//      toneSlider.minimumValue = Float.pi * (-0.9)
//      toneSlider.maximumValue = Float.pi * 0.9
//      toneSlider.setValue(0, animated: false)
//      toneSlider.addTarget(self, action: #selector(YourToneSliderValueChanged(_:)), for: .valueChanged)
//
//      let onOffLabel = UILabel()
//      onOffLabel.text = "ON/OFF"
//      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
//      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      lazy var onOffSwitch: UISwitch = {
//        let onOffSwitch = UISwitch()
//        onOffSwitch.isOn = false
//        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
//        return onOffSwitch
//      }()
//
//      let horStackView1 = UIStackView()
//      horStackView1.axis = .horizontal
//      horStackView1.addArrangedSubview(volLabel)
//      horStackView1.addArrangedSubview(volSlider)
//      horStackView1.translatesAutoresizingMaskIntoConstraints = false
//      horStackView1.alignment = .fill
//      horStackView1.distribution = .fill
//      horStackView1.spacing = 25
//
//      let horStackView2 = UIStackView()
//      horStackView2.axis = .horizontal
//      horStackView2.addArrangedSubview(toneLabel)
//      horStackView2.addArrangedSubview(toneSlider)
//      horStackView2.translatesAutoresizingMaskIntoConstraints = false
//      horStackView2.alignment = .fill
//      horStackView2.distribution = .fill
//      horStackView2.spacing = 25
//
//      let horStackView3 = UIStackView()
//      horStackView3.axis = .horizontal
//      horStackView3.addArrangedSubview(onOffLabel)
//      horStackView3.addArrangedSubview(onOffSwitch)
//      horStackView3.translatesAutoresizingMaskIntoConstraints = false
//      horStackView3.alignment = .fill
//      horStackView3.distribution = .fill
//      horStackView3.spacing = 25
//
//      let vertStackView = UIStackView()
//      vertStackView.axis = .vertical
//      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(horStackView2)
//      vertStackView.addArrangedSubview(horStackView3)
//      contentView.addSubview(vertStackView)
//      vertStackView.translatesAutoresizingMaskIntoConstraints = false
//      vertStackView.alignment = .fill
//      vertStackView.distribution = .fillEqually
//
//      let labelWidth = CGFloat(85)
//      volLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      toneLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//
//      vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//      vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//      vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//      vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
//    case 6:
//      print("Ca pis Sa")
//
//      let mixLabel = UILabel()
//      mixLabel.text = "MIX"
//      mixLabel.translatesAutoresizingMaskIntoConstraints = false
//      mixLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let mixSlider = UISlider()
//      mixSlider.translatesAutoresizingMaskIntoConstraints = false
//      mixSlider.minimumValue = Float.pi * (-0.9)
//      mixSlider.maximumValue = Float.pi * 0.9
//      mixSlider.setValue(0, animated: false)
//      mixSlider.addTarget(self, action: #selector(YourVolSliderValueChanged(_:)), for: .valueChanged)
////      slider1 = volSlider
//
//      let onOffLabel = UILabel()
//      onOffLabel.text = "ON/OFF"
//      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
//      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
//
//      let randomButton = UIButton(type: .roundedRect)
//      randomButton.setTitle("Randomize", for: .normal)
//      randomButton.addTarget(self, action: #selector(randomizeButtonTapped), for: .touchUpInside)
//      randomButton.backgroundColor = pedal.color
//      randomButton.setTitleColor(pedal.textColor, for: .normal)
//      randomButton.layer.cornerRadius = 8
//
//      lazy var onOffSwitch: UISwitch = {
//        let onOffSwitch = UISwitch()
//        onOffSwitch.isOn = false
//        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
//        return onOffSwitch
//      }()
//
//      let horStackView1 = UIStackView()
//      horStackView1.axis = .horizontal
//      horStackView1.addArrangedSubview(mixLabel)
//      horStackView1.addArrangedSubview(mixSlider)
//      horStackView1.translatesAutoresizingMaskIntoConstraints = false
//      horStackView1.alignment = .fill
//      horStackView1.distribution = .fill
//      horStackView1.spacing = 25
//
//      let horStackView2 = UIStackView()
//      horStackView2.axis = .horizontal
//      horStackView2.translatesAutoresizingMaskIntoConstraints = false
//      horStackView2.alignment = .fill
//      horStackView2.distribution = .fill
//      horStackView2.spacing = 25
//
//      let horStackView3 = UIStackView()
//      horStackView3.axis = .horizontal
//      horStackView3.addArrangedSubview(onOffLabel)
//      horStackView3.addArrangedSubview(onOffSwitch)
//      horStackView3.translatesAutoresizingMaskIntoConstraints = false
//      horStackView3.alignment = .fill
//      horStackView3.distribution = .fill
//      horStackView3.spacing = 25
//
//      let vertStackView = UIStackView()
//      vertStackView.axis = .vertical
//      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(horStackView2)
//      vertStackView.addArrangedSubview(horStackView3)
//      vertStackView.addArrangedSubview(randomButton)
//      contentView.addSubview(vertStackView)
//      vertStackView.translatesAutoresizingMaskIntoConstraints = false
//      randomButton.translatesAutoresizingMaskIntoConstraints = false
//      vertStackView.alignment = .fill
//      vertStackView.distribution = .fillEqually
//
////      let labelWidth = CGFloat(85)
////      volLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
////      toneLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
////      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
//
//      vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
//      vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
//      vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//      vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
      
    default:
      
      let mixLabel = UILabel()
      mixLabel.text = "MIX"
      mixLabel.translatesAutoresizingMaskIntoConstraints = false
      mixLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let mixSlider = UISlider()
      mixSlider.translatesAutoresizingMaskIntoConstraints = false
      mixSlider.minimumValue = Float.pi * (-0.9)
      mixSlider.maximumValue = Float.pi * 0.9
      mixSlider.setValue(0, animated: false)
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
//        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
        return onOffSwitch
      }()
      
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
      horStackView2.translatesAutoresizingMaskIntoConstraints = false
      horStackView2.alignment = .fill
      horStackView2.distribution = .fill
      horStackView2.spacing = 25
      
      let horStackView3 = UIStackView()
      horStackView3.axis = .horizontal
      horStackView3.translatesAutoresizingMaskIntoConstraints = false
      horStackView3.alignment = .fill
      horStackView3.distribution = .fill
      horStackView3.spacing = 25
      
      let horStackView4 = UIStackView()
      horStackView4.axis = .horizontal
      horStackView4.translatesAutoresizingMaskIntoConstraints = false
      horStackView4.alignment = .fill
      horStackView4.distribution = .fill
      horStackView4.spacing = 25
      
      let horStackView5 = UIStackView()
      horStackView5.axis = .horizontal
      horStackView5.addArrangedSubview(onOffLabel)
      horStackView5.addArrangedSubview(onOffSwitch)
      horStackView5.translatesAutoresizingMaskIntoConstraints = false
      horStackView5.alignment = .center
      horStackView5.distribution = .fill
      horStackView5.spacing = 25
      
      let vertStackView = UIStackView()
      vertStackView.axis = .vertical
      vertStackView.addArrangedSubview(horStackView1)
//      vertStackView.addArrangedSubview(horStackView2)
//      vertStackView.addArrangedSubview(horStackView3)
//      vertStackView.addArrangedSubview(horStackView4)
      vertStackView.addArrangedSubview(horStackView5)
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
    }
  }
//
//  @objc func randomizeButtonTapped() {
//    print("Button tapped!")
//    // Add your button tap logic here
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



