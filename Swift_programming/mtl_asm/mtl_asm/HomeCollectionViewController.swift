//
//  HomeCollectionViewController.swift
//  mtl_asm
//
//  Created by MacBook on 08.06.2023.
//

import UIKit

private let reuseIdentifier = "PedalCell"

class HomeCollectionViewController: UICollectionViewController {
  private let pedals = [("Count to 5", "CountTo5.png"),
                        ("PURPLL", "PURPLL.png"),
                        ("Too Positive", "TooPositive.png"),
                        ("Your And You're", "YourAndYou're.png")]
  
//  private var pedalsJSON: [Pedal] = []

  override func viewDidLoad() {
    super.viewDidLoad()
//    let flowLayout = UICollectionViewFlowLayout()
//    flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//    collectionView.collectionViewLayout = flowLayout
    
    collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    
//    fetchItemsFromJSON { [weak self] (pedalsJSON) in
//      if let pedalsJSON = pedalsJSON {
//        self?.pedalsJSON = pedalsJSON
//        DispatchQueue.main.async {
//          self?.collectionView.reloadData()
//        }
//      }
//      print("check")
//      print(self?.pedalsJSON)
//    }
    
    let pedalTextLabel = UILabel()
    view.addSubview(pedalTextLabel)
    pedalTextLabel.translatesAutoresizingMaskIntoConstraints = false
    pedalTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    pedalTextLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    pedalTextLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    pedalTextLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  private func generateLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .fractionalHeight(1.0)
    )
    
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(1.0),
      heightDimension: .absolute(120.0)
    )
    
    let group = NSCollectionLayoutGroup.horizontal(
      layoutSize: groupSize,
      subitem: item,
      count: 1
    )
      
    let section = NSCollectionLayoutSection(group: group)
    let layout = UICollectionViewCompositionalLayout(section: section)
    return layout
  }
  
//  @IBSegueAction func goToPedal(_ coder: NSCoder, sender: Any?) -> PedalViewController? {
//    guard let cell = sender as? PedalCollectionViewCell, let indexPath = collectionView.indexPath(for: cell) else {
//      return nil
//    }
//    print("cell tapped")
//    
//    let selectedItemId = indexPath.row
//    return PedalViewController(coder: coder, selectedItemId: selectedItemId)
//  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return pedals.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PedalCollectionViewCell
//    cell.PedalCellLabel.text = pedals[indexPath.item].0
//    cell.backgroundView?.largeContentImage = UIImage(named: pedals[indexPath.item].1)
//    cell.backgroundColor = .black
//
//    return cell
    
//    if let imageData = try? Data(contentsOf: NSDataAsset(name: URL(from: <#T##Decoder#>) pedals[indexPath.item].1)),
//       let image = UIImage(data: imageData) {
//      cell.backgroundColor = UIColor(patternImage: image)
//    }
    cell.backgroundImageView.image = UIImage(named: pedals[indexPath.item].1)
    return cell
    
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedItem = pedals[indexPath.item]
    print("Selected item: \(selectedItem)")
  }
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "GoToPedal" {
//      if let nextViewController = segue.destination as? PedalViewController, let selectedItemId = sender as? Int
//      {
//        nextViewController.selectedItemId = selectedItemId
//      }
//    }
//  }
  
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    // Calculate the desired size of the cell based on its content
//    // Return the size as a CGSize object
//    
//    // Example: Calculate the size based on the length of the item's title
//    let item = pedals[indexPath.item]
//    let width: CGFloat = 150
//    let height: CGFloat = 300 // Set the desired height of the cell
//    
//    return CGSize(width: width, height: height)
//  }
}
