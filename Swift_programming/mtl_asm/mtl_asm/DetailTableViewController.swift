import UIKit

class DetailTableViewController: UITableViewController {
  var pedal: Pedal!
  var knob1: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(pedal.name)
    navigationItem.title = pedal.name
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
      knob1 = cell.knob1
      cell.updateImage()
//      cell.backgroundColor = .white
      cell.pedalCellImageView.image = pedal.image
      cell.selectionStyle = .none
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
      
      switch pedal.id {
      case 0, 3:
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
//      case 2:
//        print("PURPLL")
      case 3:
        print("Your and You're")
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


