//
//  AddRegistrationTableViewController.swift
//  09_Lab_ComplexInputScreens
//
//  Created by MacBook on 21.05.2023.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var firstNameTextField: UITextField!
  
  @IBOutlet weak var checkInDatePicker: UIDatePicker!
  @IBOutlet weak var checkOutDatePicker: UIDatePicker!
  
  @IBOutlet weak var checkInDateLabel: UILabel!
  @IBOutlet weak var checkOutDateLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let midnightToday = Calendar.current.startOfDay(for: Date())
    checkInDatePicker.minimumDate = midnightToday
    checkInDatePicker.date = midnightToday
    
    updateDateViews()
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  @IBAction func doneBarButtonTapped(_ sender: Any) {
    let firstName = firstNameTextField.text ?? ""
    let lastName = lastNameTextField.text ?? ""
    let email = emailTextField.text ?? ""
    let checkInDate = checkInDatePicker.date
    let checkOutDate = checkOutDatePicker.date
    
    print("DONE TAPPED")
    print("firstName: \(firstName)")
    print("lastName: \(lastName)")
    print("email: \(email)")
    print("checkIn: \(checkInDate)")
    print("checkOut: \(checkOutDate)")
  }
  
  private func updateDateViews() {
    checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
    checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
  }

  
  @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
    updateDateViews()
  }
  
  let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
  let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
  let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
  let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
  
  
  var isCheckInDatePickerVisible: Bool = false {
    didSet {
      checkInDatePicker.isHidden = !isCheckInDatePickerVisible
    }
  }
  
  var isCheckOutDatePickerVisible: Bool = false {
    didSet {
      checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
    }
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath {
    case checkInDatePickerCellIndexPath where
      isCheckInDatePickerVisible == false:
      return 0
    case checkOutDatePickerCellIndexPath where
      isCheckOutDatePickerVisible == false:
      return 0
    default:
      return 40
//      return UITableView.automaticDimension
    }
  }
  
  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath {
    case checkInDatePickerCellIndexPath:
      return 190
    case checkOutDatePickerCellIndexPath:
      return 190
    default:
//      return 40
      return UITableView.automaticDimension
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { tableView.deselectRow(at: indexPath, animated: true)
    
    if indexPath == checkInDateLabelCellIndexPath && isCheckOutDatePickerVisible == false {
      isCheckInDatePickerVisible.toggle()
    } else if indexPath == checkOutDateLabelCellIndexPath && isCheckInDatePickerVisible == false {
      isCheckOutDatePickerVisible.toggle()
    } else if indexPath == checkInDateLabelCellIndexPath || indexPath == checkOutDateLabelCellIndexPath {
      isCheckInDatePickerVisible.toggle()
      isCheckOutDatePickerVisible.toggle()
    } else {
      return
    }
    
    tableView.beginUpdates()
    tableView.endUpdates()
  }
  
  // MARK: - Table view data source
  
  //    override func numberOfSections(in tableView: UITableView) -> Int {
  //        // #warning Incomplete implementation, return the number of sections
  //        return 0
  //    }
  //
  //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  //        // #warning Incomplete implementation, return the number of rows
  //        return 0
  //    }
  
  /*
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
   
   // Configure the cell...
   
   return cell
   }
   */
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
