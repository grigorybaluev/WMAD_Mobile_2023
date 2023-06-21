//
//  SettingsTableViewController.swift
//  mtl_asm
//
//  Created by MacBook on 20.06.2023.
//

import UIKit

class SettingsTableViewController: UITableViewController {
  
  let sections = ["Input", "Presets"]
  let cells = ["Input": ["Microphone", "Line In", "Audio 1", "Audio 2", "Audio 3"], "Presets": ["Preset 1", "Preset 2", "Preset 3"]]
  var selectedCells: [Int: IndexPath] = [:]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return cells[sections[section]]!.count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section]
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = indexPath.section
    let row = indexPath.row
    var cellIdentifier: String
    
    if section == 0 {
      cellIdentifier = "InputCell"
    } else {
      cellIdentifier = "PresetCell"
    }
    tableView.register(ControlTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    
    cell.textLabel?.text = cells[sections[section]]![row]
    
    // Set the accessory type based on the selected state
    if selectedCells[section] == indexPath {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let section = indexPath.section
    
    // Deselect the previously selected cell in the section
    if let previousSelectedIndexPath = selectedCells[section] {
      tableView.cellForRow(at: previousSelectedIndexPath)?.accessoryType = .none
    }
    
    // Select the new cell
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    selectedCells[section] = indexPath
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  
  
}
