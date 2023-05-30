//
//  HabitCollectionViewController.swift
//  13_GuidedProject_Habits
//
//  Created by MacBook on 29.05.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class HabitCollectionViewController: UICollectionViewController {
  
  // Keep track of async tasks so they can be cancelled when appropriate
  var habitsRequestTask: Task<Void, Never>? = nil
  deinit { habitsRequestTask?.cancel() }
  
  typealias DataSourceType = UICollectionViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
  
  enum ViewModel {
    enum Section: Hashable, Comparable {
      case favorites
      case category(_ category: Category)
      
      static func < (lhs: Section, rhs: Section) -> Bool {
        switch (lhs, rhs) {
        case (.category(let l), .category(let r)):
          return l.name < r.name
        case (.favorites, _):
          return true
        case (_, .favorites):
          return false
        }
      }
    }
    typealias Item = Habit
  }
  
  struct Model {
    var habitsByName = [String: Habit]()
    var favoriteHabits: [Habit] {
      return Settings.shared.favoriteHabits
    }
  }
  
  var dataSource: DataSourceType!
  var model = Model()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = createDataSource()
    collectionView.dataSource = dataSource
    collectionView.collectionViewLayout = createLayout()
  }
  
  func update() {
    habitsRequestTask?.cancel()
    habitsRequestTask = Task {
      if let habits = try? await HabitRequest().send() {
        self.model.habitsByName = habits
      } else {
        self.model.habitsByName = [:]
      }
      self.updateCollectionView()
      
      habitsRequestTask = nil
    }
  }
  
  func updateCollectionView() {
    let itemsBySection = model.habitsByName.values.reduce(into: [ViewModel.Section: [ViewModel.Item]]()) { partial, habit in
      let item = habit
      let section: ViewModel.Section
      if model.favoriteHabits.contains(habit) {
        section = .favorites
      } else {
        section = .category(habit.category)
      }
      partial[section, default: []].append(item)
    }
    let sectionIDs = itemsBySection.keys.sorted()
    dataSource.applySnapshotUsing(sectionIDs: sectionIDs, itemsBySection: itemsBySection)
  }
  
  func createDataSource() -> DataSourceType {
    let dataSource = DataSourceType(collectionView: collectionView) {
      (collectionView, indexPath, item) in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Habit", for: indexPath) as! UICollectionViewListCell
      
      var content = cell.defaultContentConfiguration()
      content.text = item.name
      cell.contentConfiguration = content
      
      return cell
    }
    return dataSource
  }
  
  func createLayout() -> UICollectionViewCompositionalLayout {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .absolute(44))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
    //    let group = NSCollectionLayoutGroup(layoutSize: groupSize)
    //      .horizontal
    
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                    leading: 10, bottom: 0, trailing: 10)
    
    return UICollectionViewCompositionalLayout(section: section)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    update()
  }
  
}


