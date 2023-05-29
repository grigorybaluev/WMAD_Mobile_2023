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
      enum Section: Hashable {
          case favorites
          case category(_ category: Category)
      }
      typealias Item = Habit
  }
  
  struct Model {
      var habitsByName = [String: Habit]()
  }
  
  var dataSource: DataSourceType!
  var model = Model()
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
  }
  
}
