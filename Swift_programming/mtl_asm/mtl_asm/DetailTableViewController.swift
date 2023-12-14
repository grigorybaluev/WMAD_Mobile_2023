import UIKit
import OneFingerRotation
import SwiftUI

class DetailTableViewController: UITableViewController {
  var pedal: Pedal!
  var knob1 = UIImageView()
  var knob2 = UIImageView()
  var knob3 = UIImageView()
  var knob4 = UIImageView()
//  var initialRotation: CGFloat = 0.0
//  var panGesture = UIPanGestureRecognizer()
  
  var parameter: CGFloat = 0.0
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//    draggableView.addGestureRecognizer(panGesture)
//  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(pedal.name)
    navigationItem.title = pedal.name
    tableView.isScrollEnabled = false
    
    
    let hostingController = UIHostingController(rootView: KnobImageView(imageName: "CountTo5Knob", size: 20))
    addChild(hostingController)
    super.view.addSubview(hostingController.view)
    hostingController.didMove(toParent: self)
    
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      hostingController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      hostingController.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
//    panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//    knob1.addGestureRecognizer(panGesture)
//    print("panGesture added")
    
  }
  
  func applyImageViewModifications(_ imageView: UIImageView) {
    // Modify the image view properties
//    knob1.simpleRotation()
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 2
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell?
    
    
    
    if indexPath == IndexPath(row: 0, section: 0) {
      print("test image")
      tableView.register(PedalImageCell.self, forCellReuseIdentifier: "ImageCell")
      let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! PedalImageCell
      cell.pedal = pedal
      cell.backgroundColor = UIColor.black
//      knob1 = cell.knob1
      cell.updateImage()
//      cell.backgroundColor = .white
      cell.pedalCellImageView.image = pedal.image
      cell.selectionStyle = .none
//      cell.knob1 = knob1
//      cell.knob2 = knob2
//      cell.knob3 = knob3
//      cell.knob4 = knob4
      knob1 = cell.knob1
      knob3 = cell.knob3
      knob4 = cell.knob4
      knob2 = cell.knob2
      
      let hostingController = UIHostingController(rootView: KnobImageView(imageName: "CountTo5Knob", size: 20))
      addChild(hostingController)
      cell.addSubview(hostingController.view)
      hostingController.didMove(toParent: self)
      
      hostingController.view.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        hostingController.view.centerXAnchor.constraint(equalTo: cell.trailingAnchor),
        hostingController.view.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
      ])
      
//      OneFingerRotation.
//      cell.commonInit()
//      print("check commonInit()")
      cell.awakeFromNib()
//      knob1.addGestureRecognizer(panGesture)
//      print("add pan gesture")
      
      
      return cell
      
    } else if indexPath == IndexPath(row: 1, section: 0) {
      
      print("test control")
      tableView.register(ControlTableViewCell.self, forCellReuseIdentifier: "ControlCell")
      let cell = tableView.dequeueReusableCell(withIdentifier: "ControlCell", for: indexPath) as! ControlTableViewCell
      cell.backgroundColor = UIColor.black
      cell.pedal = pedal
      cell.delegate = self
      cell.addControls()
      switch pedal.id {
      case 0:
        print("Count To 5")
      case 1:
        print("Too Positive")
      case 2:
        print("PURPLL")
      case 3:
        print("Your and You're")
      default:
        print("no pedal")
      }
      cell.selectionStyle = .none
      return cell
    }
    
    return cell!
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath == IndexPath(row: 0, section: 0) {
      let imgWidth = pedal.image.size.width
      let imgHeight = pedal.image.size.height
      let imgAspectRatio = imgWidth / imgHeight
//      view.safeAreaLayoutGuide.layoutFrame.size.width / imgAspectRatio
      
      switch pedal.id {
      case 0, 3, 6:
        print("Count To 5")
        return 556
      default:
        return view.safeAreaLayoutGuide.layoutFrame.size.width / imgAspectRatio
      }
    } else {
      switch pedal.id {
      case 0:
        print("Count To 5")
        return 220
      case 1:
        print("Too Positive")
        return 125
      case 2:
        print("PURPLL")
        return 125
      case 3:
        print("Your and You're")
        return 125
      case 4:
        print("UPPERS")
        return 220
      case 5:
        print("Positive Overdrive")
        return 125
      case 6:
        print("Ça pis Sa")
        return 125
      default:
        print("no pedal")
        return 60
      }
    }
  }
}

extension DetailTableViewController: ControlTableViewCellDelegate {
  func requestImageAngleUpdate(_ cell: ControlTableViewCell, _ targetKnob: TargetKnob) {
    guard let indexPath = tableView.indexPath(for: cell) else {
      return
    }
    
    let controlCell = tableView.cellForRow(at: indexPath) as? ControlTableViewCell
    
    // Update the angle of the image in the target table view cell
    let targetIndexPath = IndexPath(row: indexPath.row-1, section: indexPath.section)
    let targetCell = tableView.cellForRow(at: targetIndexPath) as? PedalImageCell
    targetCell?.updateImageRotationAngle(controlCell!, targetKnob)
  }
  func requestSwitchUpdate(_ cell: ControlTableViewCell, _ switchTarget: SwitchTarget) {
    print("switch state is ", cell.switch1.state)
    guard let indexPath = tableView.indexPath(for: cell) else {
      return
    }
    
    let controlCell = tableView.cellForRow(at: indexPath) as? ControlTableViewCell
    
    // Update the angle of the image in the target table view cell
    let targetIndexPath = IndexPath(row: indexPath.row-1, section: indexPath.section)
    let targetCell = tableView.cellForRow(at: targetIndexPath) as? PedalImageCell
    targetCell?.updateSwitch(controlCell!, switchTarget)
  }
}


