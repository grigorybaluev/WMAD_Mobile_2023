//
//  PresetsTableViewController.swift
//  mtl_asm
//
//  Created by MacBook on 14.12.2023.
//

import Foundation
import UIKit

class PresetsTableViewController: UITableViewController {
  
  var dataArray: [String] = ["Preset1", "Preset2", "Preset3"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    let insetHeight = view.bounds.height / 2
//    tableView.contentInset = UIEdgeInsets(top: insetHeight, left: 0, bottom: insetHeight, right: 0)
    // Register a cell for displaying array values
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    // Set up the first section with the text field and button
    let firstSection = Section(items: [Item.textFieldButton])
    
    // Set up the second section with the array values
    let secondSection = Section(items: dataArray.map { Item.label($0) })
    
    // Set the sections for the table view
    sections = [firstSection, secondSection]
    tableView.isEditing = false
//    let loadPresetButton = UIButton(type: .roundedRect)
//    loadPresetButton.setTitle("Load Preset", for: .normal)
////    loadPresetButton.addTarget(self, action: #selector(randomizeButtonTapped), for: .touchUpInside)
//    loadPresetButton.backgroundColor = .lightGray
//    loadPresetButton.setTitleColor(.darkText, for: .normal)
//    loadPresetButton.layer.cornerRadius = 8
//    view.addSubview(loadPresetButton)
//    loadPresetButton.translatesAutoresizingMaskIntoConstraints = false
//
//    tableView.contentInsetAdjustmentBehavior = .never
//    if let navigationController = self.navigationController {
//      let stableView = navigationController.view
//      loadPresetButton.centerXAnchor.constraint(equalTo: navigationController.view.centerXAnchor, constant: 0).isActive = true
//      loadPresetButton.centerYAnchor.constraint(equalTo: navigationController.view.centerYAnchor, constant: 300).isActive = true
//      loadPresetButton.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
//      loadPresetButton.widthAnchor.constraint(equalToConstant: CGFloat(120)).isActive = true
//    } else {
//      loadPresetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//      loadPresetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 300).isActive = true
//      loadPresetButton.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
//      loadPresetButton.widthAnchor.constraint(equalToConstant: CGFloat(120)).isActive = true
//    }
//    loadPresetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    loadPresetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 300).isActive = true
//    loadPresetButton.heightAnchor.constraint(equalToConstant: CGFloat(40)).isActive = true
//    loadPresetButton.widthAnchor.constraint(equalToConstant: CGFloat(120)).isActive = true
    
  }
  
  // Enum to represent different types of items in the table view
  enum Item {
    case textFieldButton
    case label(String)
  }
  
  // Struct to represent a section in the table view
  struct Section {
    var items: [Item]
  }
  
  // Array of sections
  var sections: [Section] = []
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].items.count
  }
  
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    // Specify the editing style for each cell
    return indexPath.section == 1 ? .delete : .none
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      // Delete the item from the data array and the table view
      dataArray.remove(at: indexPath.row)
      sections[1].items.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let section = sections[indexPath.section]
    let item = section.items[indexPath.row]
    
    switch item {
    case .textFieldButton:
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      let textField = UITextField(frame: cell.contentView.bounds.insetBy(dx: 12, dy: 5))
      textField.placeholder = "Type Preset Name"
      textField.borderStyle = .roundedRect
      textField.tag = 123 // Set a tag to identify the text field later
      cell.contentView.addSubview(textField)
      
      let button = UIButton(type: .system)
      button.setTitle("Save Preset", for: .normal)
      button.tintColor = .lightGray
      button.frame = CGRect(x: textField.frame.maxX-20, y: 5, width: 120, height: 30)
      button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
      cell.contentView.addSubview(button)
      
      return cell
      
    case .label(let text):
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.textLabel?.text = text
      return cell
    }
  }
  
  @objc func saveButtonTapped() {
    // Get the text field by tag
    if let textField = view.viewWithTag(123) as? UITextField,
       let text = textField.text, !text.isEmpty {
      
      // Save the text to the array and update the table view
      dataArray.append(text)
      
      let newIndexPath = IndexPath(row: sections[1].items.count, section: 1)
      sections[1].items.append(.label(text))
      tableView.insertRows(at: [newIndexPath], with: .automatic)
      
      // Clear the text field
      textField.text = nil
    }
  }
}
