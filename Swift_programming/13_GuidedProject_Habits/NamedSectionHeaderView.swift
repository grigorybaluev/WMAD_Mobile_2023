//
//  NamedSectionHeaderView.swift
//  13_GuidedProject_Habits
//
//  Created by MacBook on 30.05.2023.
//

import UIKit

class NamedSectionHeaderView: UICollectionReusableView {
  let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = UIFont.boldSystemFont(ofSize: 17)
    
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func setupView() {
    backgroundColor = .systemGray5
    
    addSubview(nameLabel)
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
