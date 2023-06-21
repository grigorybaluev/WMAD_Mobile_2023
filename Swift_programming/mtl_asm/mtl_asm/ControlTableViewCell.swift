import UIKit

//class ControlTableViewCell: UITableViewCell {
class ControlTableViewCell: UITableViewCell, ControlTableViewCellDelegate {
  var pedal: Pedal!
  var knob: UIImageView!
  var volSlider = UISlider()
  var volKnobAngle: Float = 0.0
  var controlCell: ControlTableViewCell?
  weak var delegate: ControlTableViewCellDelegate?
  
//  let knobImage = UIImageView(image: UIImage(named: "YourAndYou're_knob_outline.png"))
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    
//    contentView.addSubview(knobImage)
//    knobImage.translatesAutoresizingMaskIntoConstraints = false
//    knobImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -42).isActive = true
//    knobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//    knobImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
//    knobImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  func addControls() {
    
    
    switch pedal.id {
    case 0:
      print("Count To 5")
      
    case 1:
      print("Too Positive")
      
    case 2:
      print("PURPLL")
      
    case 3:
      print("Your and You're")
      
      let volLabel = UILabel()
      volLabel.text = "VOL"
      volLabel.translatesAutoresizingMaskIntoConstraints = false
      volLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
//      let volSlider = UISlider()
      volSlider = UISlider()
      volSlider.translatesAutoresizingMaskIntoConstraints = false
//      volSlider.minimumValue = 0
//      volSlider.maximumValue = 100
//      volSlider.setValue(50, animated: false)
      volSlider.minimumValue = Float.pi * (-1)
      volSlider.maximumValue = Float.pi
      volSlider.setValue(0, animated: false)
      volSlider.addTarget(self, action: #selector(volSliderValueChanged(_:)), for: .valueChanged)
      
      let toneLabel = UILabel()
      toneLabel.text = "TONE"
      toneLabel.translatesAutoresizingMaskIntoConstraints = false
      toneLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
      let toneSlider = UISlider()
      toneSlider.translatesAutoresizingMaskIntoConstraints = false
      toneSlider.minimumValue = 0
      toneSlider.maximumValue = 100
      toneSlider.setValue(50, animated: false)
      
      let onOffLabel = UILabel()
      onOffLabel.text = "ON/OFF"
      onOffLabel.translatesAutoresizingMaskIntoConstraints = false
      onOffLabel.font = UIFont(name: "Helvetica Neue Bold", size: 20)
      
//      let onOffSwitch = UISwitch()
      lazy var onOffSwitch: UISwitch = {
        let onOffSwitch = UISwitch()
        onOffSwitch.isOn = false
        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        onOffSwitch.addTarget(self, action: #selector(onOffSwitchValueChanged(_:)), for: .valueChanged)
        return onOffSwitch
      }()
      
      let horStackView1 = UIStackView()
      horStackView1.axis = .horizontal
      horStackView1.addArrangedSubview(volLabel)
      horStackView1.addArrangedSubview(volSlider)
      horStackView1.translatesAutoresizingMaskIntoConstraints = false
      horStackView1.alignment = .fill
      horStackView1.distribution = .fill
      horStackView1.spacing = 25
//      horStackView1.backgroundColor = .red
      
      let horStackView2 = UIStackView()
      horStackView2.axis = .horizontal
      horStackView2.addArrangedSubview(toneLabel)
      horStackView2.addArrangedSubview(toneSlider)
      horStackView2.translatesAutoresizingMaskIntoConstraints = false
      horStackView2.alignment = .fill
      horStackView2.distribution = .fill
      horStackView2.spacing = 25
//      horStackView2.backgroundColor = .orange
      
      let horStackView3 = UIStackView()
      horStackView3.axis = .horizontal
      horStackView3.addArrangedSubview(onOffLabel)
      horStackView3.addArrangedSubview(onOffSwitch)
      horStackView3.translatesAutoresizingMaskIntoConstraints = false
      horStackView3.alignment = .fill
      horStackView3.distribution = .fill
      horStackView3.spacing = 25
//      horStackView3.backgroundColor = .purple
      
      let vertStackView = UIStackView()
      vertStackView.axis = .vertical
      vertStackView.addArrangedSubview(horStackView1)
      vertStackView.addArrangedSubview(horStackView2)
      vertStackView.addArrangedSubview(horStackView3)
      contentView.addSubview(vertStackView)
      vertStackView.translatesAutoresizingMaskIntoConstraints = false
      vertStackView.alignment = .fill
      vertStackView.distribution = .fillEqually
      
      let labelWidth = CGFloat(85)
      volLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      toneLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      onOffLabel.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
      
//      horStackView1.leadingAnchor.constraint(equalTo: vertStackView.leadingAnchor, constant: 30).isActive = true
//      horStackView1.trailingAnchor.constraint(equalTo: vertStackView.trailingAnchor, constant: -30).isActive = true
//      horStackView1.topAnchor.constraint(equalTo: vertStackView.topAnchor, constant: 10).isActive = true
//      horStackView1.bottomAnchor.constraint(equalTo: vertStackView.bottomAnchor, constant: -10).isActive = true
//
//      horStackView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
//      horStackView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
//      horStackView2.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//      horStackView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
      
      vertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
      vertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
      vertStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
      vertStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
      
//      onOffSwitch.centerYAnchor.constraint(equalTo: horStackView3.centerYAnchor).isActive = true
//      onOffSwitch.leadingAnchor.constraint(equalTo: horStackView3.leadingAnchor).isActive = true
      
    default:
      print("no pedal")
    }
  }
  
  @objc func onOffSwitchValueChanged(_ sender: UISwitch) {
    if sender.isOn {
      // Switch is turned on
      print("Switch is ON")
    } else {
      // Switch is turned off
      print("Switch is OFF")
    }
  }
  
  @objc func volSliderValueChanged(_ sender: UISlider) {
    
    
    delegate?.requestImageAngleUpdate(self)
//    let angle = sender.value // Get the current value of the slider
    volKnobAngle = sender.value // Get the current value of the slider
    print(volKnobAngle)
//    knobImage.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
    
//    updateImageRotationAngle(angle)
  }
  
  func requestImageAngleUpdate(_ cell: ControlTableViewCell) {
    print("request image angle update")
  }
  
//  func updateImageRotationAngle(_ newAngle: Float) {
//    knobImage.transform = CGAffineTransform(rotationAngle: CGFloat(newAngle))
//    volSlider.value = newAngle
//  }
}


protocol ControlTableViewCellDelegate: AnyObject {
    func requestImageAngleUpdate(_ cell: ControlTableViewCell)
}



