//
//  PedalTableViewController.swift
//  mtl_asm
//
//  Created by MacBook on 13.06.2023.
//

import UIKit
import OneFingerRotation
import SwiftUI

class PedalTableViewController: UITableViewController {

  let pedals: [Pedal] = [
    Pedal(name: "Count To 5", id: 0, detailText: "Sampler", image: UIImage(named: "CountTo5_edit.png")!,
          color: UIColor(red: 60.0 / 255.0, green: 70.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0),
          textColor: UIColor(red: 145.0 / 255.0, green: 160.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)),
    Pedal(name: "Too Positive", id: 1, detailText: "Detail", image: UIImage(named: "TooPositive_edit.png")!, color: UIColor(red: 125.0 / 255.0, green: 90.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0),
          textColor: UIColor(red: 250.0 / 255.0, green: 180.0 / 255.0, blue: 200.0 / 255.0, alpha: 1.0)),
    Pedal(name: "PURPLL", id: 2, detailText: "Synth", image: UIImage(named: "PURPLL_edit.png")!, color: UIColor(red: 80.0 / 255.0, green: 80.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0),
          textColor: UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)),
    Pedal(name: "Your and You're", id: 3, detailText: "Delay", image: UIImage(named: "YourAndYou're_edit1.png")!, color: UIColor(red: 92.0 / 255.0, green: 102.0 / 255.0, blue: 90 / 255.0, alpha: 1.0),
          textColor: UIColor(red: 185.0 / 255.0, green: 205.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)),
    Pedal(name: "UPPERS", id: 4, detailText: "Sampler", image: UIImage(named: "UPPERS_edit.png")!,
          color: UIColor(red: 80.0 / 255.0, green: 80.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0),
                textColor: UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)),
    Pedal(name: "Positive_Overdrive", id: 5, detailText: "Detail", image: UIImage(named: "Positive_Overdrive_edit.png")!, color: UIColor(red: 50.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0),
          textColor: UIColor(red: 110.0 / 255.0, green: 175.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)),
    Pedal(name: "Ça_pis_Sa", id: 6, detailText: "Synth", image: UIImage(named: "Ça_pis_Sa_edit.png")!, color: UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0),
          textColor: UIColor(red: 0.0 / 255.0, green: 0.0 / 255.0, blue: 0.0 / 255.0, alpha: 1.0)),
//    Pedal(name: "856_for_ZELLERSASN", id: 3, detailText: "Delay", image: UIImage(named: "856_for_ZELLERSASN_edit.png")!, color: UIColor(red: 92.0 / 255.0, green: 102.0 / 255.0, blue: 90 / 255.0, alpha: 1.0),
//          textColor: UIColor(red: 185.0 / 255.0, green: 205.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0)),
  ]
  
//  UIColor(red: 185.0 / 255.0, green: 205.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0) your and you're text color original
  
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
    cell.backgroundColor = UIColor.black
    let pedal = pedals[indexPath.row]
    navigationController?.navigationBar.tintColor = UIColor.lightGray
    cell.pedalImageView.image = pedal.image
    cell.pedalImageView.layer.cornerRadius = 20
    cell.pedalImageView.layer.masksToBounds = true
    
    
    let titleLabel = UILabel()
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.text = pedal.name
    titleLabel.font = UIFont(name: "Helvetica Neue Bold", size: 25)
//    titleLabel.alpha = 0.8
    let background = UIView()
    background.translatesAutoresizingMaskIntoConstraints = false
    cell.addSubview(background)
    cell.addSubview(titleLabel)
    background.alpha = 0.7
    background.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 7).isActive = true
    background.topAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
    background.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    background.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -7).isActive = true
    background.backgroundColor = pedal.color
    titleLabel.textColor = pedal.textColor
    
    switch pedal.id {
    case 0:
      print("Count To 5 check")
      titleLabel.trailingAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
      titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 45).isActive = true
      
    case 1:
      print("Too Positive")
      titleLabel.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: 25).isActive = true
      titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 25).isActive = true
      
    case 2:
      print("PURPLL")
      titleLabel.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: -60).isActive = true
      titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 25).isActive = true
      
    case 3:
      print("Your and You're")
      titleLabel.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: 80).isActive = true
      titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
      
    case 4:
      print("UPPERS")
      titleLabel.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: -10).isActive = true
      titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 25).isActive = true
    case 5:
      print("Positive Overdrive")
      titleLabel.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: 70).isActive = true
      titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 25).isActive = true
    case 6:
      print("Ça pis Sa")
      titleLabel.trailingAnchor.constraint(equalTo: cell.centerXAnchor, constant: 40).isActive = true
      titleLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 25).isActive = true
//    case 7:
//      print("856 for ZELLERSASN")
    default:
      print("no pedal")
    }
    
    

    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pedal = pedals[indexPath.row]
//    let detailTVC = DetailTableViewController()
//    detailTVC.pedal = pedal
//    navigationController?.pushViewController(detailTVC, animated: true)
    let detailVC = DetailViewController()
    detailVC.pedal = pedal
    navigationController?.pushViewController(detailVC, animated: true)
  }

}
