//
//  ToDoCell.swift
//  10_GuidedProject_List
//
//  Created by MacBook on 11.06.2023.
//

import UIKit

protocol ToDoCellDelegate: AnyObject {
  func checkmarkTapped(sender: ToDoCell)
}


class ToDoCell: UITableViewCell {
  

  weak var delegate: ToDoCellDelegate?

  @IBOutlet weak var isCompleteButton: UIButton!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  @IBAction func completeButtonTapped(_ sender: UIButton) {
    delegate?.checkmarkTapped(sender: self)
  }
}
