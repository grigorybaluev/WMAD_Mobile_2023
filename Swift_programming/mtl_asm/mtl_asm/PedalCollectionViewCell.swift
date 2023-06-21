//
//  PedalCollectionViewCell.swift
//  mtl_asm
//
//  Created by MacBook on 08.06.2023.
//

import UIKit

class PedalCollectionViewCell: UICollectionViewCell {
//  var itemName: String? = nil
//  {
//    didSet {
//      if oldValue != itemName {
//        setNeedsUpdateConfiguration()
//      }
//    }
//  }
//  var price: Double? = nil
//  {
//    didSet {
//      if oldValue != price {
//        setNeedsUpdateConfiguration()
//      }
//    }
//  }
//  var image: UIImage? = nil
//  {
//    didSet {
//      if oldValue != image {
//        setNeedsUpdateConfiguration()
//      }
//    }
//  }
  
  var backgroundImageView: UIImageView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
//    backgroundImageView = UIImageView(frame: bounds)
//    backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//    backgroundImageView.contentMode = .scaleAspectFill
//    addSubview(backgroundImageView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    backgroundImageView = UIImageView(frame: bounds)
    backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    backgroundImageView.contentMode = .scaleAspectFill
    addSubview(backgroundImageView)
    
    let pedalTextLabel = UILabel()

    pedalTextLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(pedalTextLabel)

    pedalTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    pedalTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//    pedalTextLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
    pedalTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    pedalTextLabel.text = "LKJD"
    
    
//    let pedalTextButton = UIButton()
//
//    pedalTextButton.translatesAutoresizingMaskIntoConstraints = false
//    addSubview(pedalTextButton)
//
//    pedalTextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//    pedalTextButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//    //    pedalTextButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
//    pedalTextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    pedalTextButton.setTitle("text", for: .normal)
//    //    pedalTextButton.addTarget(self, action: #selector(pedalCellTapped(_:coder:)), for: .touchUpInside)
//    pedalTextButton.addTarget(self, action: #selector(pedalCellTapped(_:coder:)), for: .touchUpInside)
//
    
    
  }
  
  
  
//  override func updateConfiguration(using state: UICellConfigurationState) {
//    var content = defaultContentConfiguration().updated(for: state)
//    content.text = itemName
//    content.secondaryText = price?.formatted(.currency(code: "usd"))
//    content.prefersSideBySideTextAndSecondaryText = true
//    
//    if let image = image {
//      content.image = image
//    } else {
//      content.image = UIImage(systemName: "photo.on.rectangle")
//    }
//    self.contentConfiguration = content
//  }
}


//@objc func pedalCellTapped(_ sender: UIButton, _ coder: NSCoder) -> PedalViewController {
//  // Button action code here
//  print("Button tapped!")
//
//  let collectionView = mtl_asm.HomeCollectionViewController()
//
////    let button = sender as? UIButton
//  let pedalName = sender.title(for: .normal)
//  print("cell tapped")
//  return PedalViewController(coder: coder, selectedItemName: pedalName!)!
//}
