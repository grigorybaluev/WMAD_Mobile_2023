//
//  PedalTableViewController.swift
//  mtl_asm
//
//  Created by MacBook on 13.06.2023.
//

import UIKit

class PedalTableViewController: UITableViewController {

  let pedals: [Pedal] = [
    Pedal(name: "Count To 5", id: 0, detailText: "Sampler", image: UIImage(named: "CountTo5_edit.png")!),
    Pedal(name: "Too Positive", id: 1, detailText: "Detail", image: UIImage(named: "TooPositive.png")!),
    Pedal(name: "PURPLL", id: 2, detailText: "Synth", image: UIImage(named: "PURPLL.png")!),
    Pedal(name: "Your and You're", id: 3, detailText: "Delay", image: UIImage(named: "YourAndYou're_edit1.png")!),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pedals.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PedalCell", for: indexPath) as! PedalTableViewCell
    cell.selectionStyle = .none
    let pedal = pedals[indexPath.row]
    cell.pedalImageView.image = pedal.image
    cell.pedalImageView.layer.cornerRadius = 20
    cell.pedalImageView.layer.masksToBounds = true

    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pedal = pedals[indexPath.row]
    let detailTVC = DetailTableViewController()
    detailTVC.pedal = pedal
    navigationController?.pushViewController(detailTVC, animated: true)
  }

}
