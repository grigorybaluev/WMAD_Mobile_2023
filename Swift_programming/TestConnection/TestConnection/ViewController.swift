import UIKit

class ViewController: UIViewController {

    // UI elements
    var buttons = [UIButton]()
    var boardSize: CGFloat = 0
    var currentPlayer = "X"
    var gameState = Array(repeating: Array(repeating: "", count: 3), count: 3)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Button setup
        setupButtons()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateBoardLayout()
    }

    func setupButtons() {
        boardSize = min(view.frame.width, view.frame.height) * 0.9
        let xStart = (view.frame.width - boardSize) / 2
        let yStart = (view.frame.height - boardSize) / 2 + 50 // Add 50 to yStart to account for removing label

        for row in 0..<3 {
            for col in 0..<3 {
                let button = UIButton(frame: CGRect(x: xStart + (CGFloat(col) * (boardSize / 3)),
                                                    y: yStart + (CGFloat(row) * (boardSize / 3)),
                                                    width: boardSize / 3,
                                                    height: boardSize / 3))

                button.setTitle("", for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: boardSize / 9, weight: .bold) // Change font size
                button.setTitleColor(UIColor.black, for: .normal) // Change text color
                button.layer.borderWidth = 1.0
                button.tag = row * 10 + col
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

                buttons.append(button)
                view.addSubview(button)
            }
        }
    }

    func updateBoardLayout() {
        boardSize = min(view.frame.width, view.frame.height) * 0.9
        let xStart = (view.frame.width - boardSize) / 2
        let yStart = (view.frame.height - boardSize) / 2 + 50 // Add 50 to yStart to account for removing label

        for (index, button) in buttons.enumerated() {
            let row = index / 3
            let col = index % 3

            button.frame = CGRect(x: xStart + (CGFloat(col) * (boardSize / 3)),
                                   y: yStart + (CGFloat(row) * (boardSize / 3)),
                                   width: boardSize / 3,
                                   height: boardSize / 3)

            button.titleLabel?.font = UIFont.systemFont(ofSize: boardSize / 9, weight: .bold) // Change font size
        }
    }

    @objc func buttonTapped(_ sender: UIButton) {
        let row = sender.tag / 10
        let col = sender.tag % 10

        if gameState[row][col] == "" {
            gameState[row][col] = currentPlayer
            sender.setTitle(currentPlayer, for: .normal)
            sender.setTitleColor(UIColor.black, for: .normal) // Change text color
            currentPlayer = currentPlayer == "X" ? "O" : "X"
        }
        sender.isEnabled = false
        updateLabel()
    }

    func updateLabel() {
        if winner() != "" {
            let winnerText = "Player " + winner() + " wins!"
            let alert = UIAlertController(title: "Game Over", message: winnerText, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
                self.resetGame()
            }))
            present(alert, animated: true)
        } else if isDraw() {
            let alert = UIAlertController(title: "Game Over", message: "Draw!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
                self.resetGame()
            }))
            present(alert, animated: true)
        }
    }

    func winner() -> String {
        var winner = ""

        for row in 0..<3 {
            if gameState[row][0] == gameState[row][1] && gameState[row][1] == gameState[row][2] && gameState[row][0] != "" {
                winner = gameState[row][0]
            }
        }

        for col in 0..<3 {
            if gameState[0][col] == gameState[1][col] && gameState[1][col] == gameState[2][col] && gameState[0][col] != "" {
                winner = gameState[0][col]
            }
        }

        if gameState[0][0] == gameState[1][1] && gameState[1][1] == gameState[2][2] && gameState[0][0] != "" {
          winner = gameState[0][0]
          }

              if gameState[0][2] == gameState[1][1] && gameState[1][1] == gameState[2][0] && gameState[0][2] != "" {
                  winner = gameState[0][2]
              }
           
              if winner == "" && isDraw() {
                  winner = "draw"
              }
           
              return winner
          }
           
          func isDraw() -> Bool {
              for row in 0..<3 {
                  for col in 0..<3 {
                      if gameState[row][col] == "" {
                          return false
                      }
                  }
              }
              return true
          }
           
          func resetGame() {
              for button in buttons {
                  button.isEnabled = true
                  button.setTitle("", for: .normal)
                  button.setTitleColor(UIColor.blue, for: .normal) // Change text color back to blue
              }
           
              currentPlayer = "X"
              gameState = Array(repeating: Array(repeating: "", count: 3), count: 3)
          }

          }
