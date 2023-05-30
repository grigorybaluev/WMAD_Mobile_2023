//
//  UserCollectionViewController.swift
//  13_GuidedProject_Habits
//
//  Created by MacBook on 29.05.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class UserCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
  
  typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
  
  enum ViewModel {
      typealias Section = Int
  
      struct Item: Hashable {
          let user: User
          let isFollowed: Bool
  
          func hash(into hasher: inout Hasher) {
              hasher.combine(user)
          }
  
          static func ==(_ lhs: Item, _ rhs: Item) -> Bool {
              return lhs.user == rhs.user
          }
      }
  }
  
  struct Model {
      var usersByID = [String:User]()
      var followedUsers: [User] {
          return Array(usersByID.filter { Settings.shared.followedUserIDs.contains($0.key) }.values)
      }
  }
  
  var dataSource: DataSourceType!
  var model = Model()

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
//    }
}
