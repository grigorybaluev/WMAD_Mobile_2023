//
//  ViewController.swift
//  04_ApplePie
//
//  Created by MacBook on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {
  var listOfWords = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
  let incorrectMovesAllowed = 7
  var totalWins = 0
  var totalLosses = 0
  
  @IBOutlet weak var treeImageView: UIImageView!
  @IBOutlet weak var correctWordLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet var letterButtons: [UIButton]!
  var currentGame: Game!
  
  @IBAction func letterButtonPressed(_ sender: UIButton) {
    sender.isEnabled = false
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    newRound()
  }

  func newRound() {
    let newWord = listOfWords.removeFirst()
    currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
    updateUI()
  }
  
  func updateUI() {
    scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
  }

}
