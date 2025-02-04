import UIKit

class ViewController: UIViewController {
    
    var numberOfDices: Int?
    var numberOfRounds: Int?
    var currentRound = 1
    var currentPlayer = 1
    var scores: [Int] = []
    var playerScores: [Int] = []
    var winnerName: String = ""
    var numberOfPlayers: Int? {
        didSet {
            if let players = numberOfPlayers {
                playerScores = Array(repeating: 0, count: players)
            }
        }
    }

    @IBOutlet weak var RondaLabel: UILabel!
    @IBOutlet weak var PlayerTurn: UILabel!
    @IBOutlet weak var ScoreBoardLabel: UILabel!
    @IBOutlet weak var Dice1: UIImageView!
    @IBOutlet weak var Dice2: UIImageView!
    @IBOutlet weak var Dice4: UIImageView!
    @IBOutlet weak var Dice3: UIImageView!
    @IBOutlet weak var Dice5: UIImageView!
    @IBOutlet weak var Dice6: UIImageView!
    @IBOutlet weak var ScoreBoardButton: UIButton!
    @IBOutlet weak var SomaLabel: UILabel!
    @IBOutlet weak var DiceNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        if let dices = numberOfDices {
            DiceNumber.text = "Numero de dados por turno : \(dices)"
        }
        
        if let rounds = numberOfRounds {
            RondaLabel.text = "Ronda \(currentRound) de \(rounds)"
        }
        
        updatePlayerTurnLabel()
        

        if let scoreBoardButton = ScoreBoardButton {
            scoreBoardButton.isEnabled = false
        } else {
            print("ScoreBoardButton is nil")
        }
    }

    @IBAction func Roll(_ sender: UIButton) {
        guard let dados = numberOfDices else {
            return
        }

          var total = 0

          if dados >= 1 {
              let rodar = Int.random(in: 1...6)
              total += rodar
              Dice1.image = UIImage(named: "dado\(rodar)")
          } else {
              Dice1.image = nil
          }

          if dados >= 2 {
              let rodar = Int.random(in: 1...6)
              total += rodar
              Dice2.image = UIImage(named: "dado\(rodar)")
          } else {
              Dice2.image = nil
          }

          if dados >= 3 {
              let rodar = Int.random(in: 1...6)
              total += rodar
              Dice3.image = UIImage(named: "dado\(rodar)")
          } else {
              Dice3.image = nil
          }

          if dados >= 4 {
              let rodar = Int.random(in: 1...6)
              total += rodar
              Dice4.image = UIImage(named: "dado\(rodar)")
          } else {
              Dice4.image = nil
          }

          if dados >= 5 {
              let rodar = Int.random(in: 1...6)
              total += rodar
              Dice5.image = UIImage(named: "dado\(rodar)")
          } else {
              Dice5.image = nil
          }

          if dados >= 6 {
              let rodar = Int.random(in: 1...6)
              total += rodar
              Dice6.image = UIImage(named: "dado\(rodar)")
          } else {
              Dice6.image = nil
          }

          playerScores[currentPlayer - 1] += total
          SomaLabel.text = playerScores.enumerated().map { "Jogador \($0.offset + 1): \($0.element)" }.joined(separator: " - ")
          scores.append(total)

        if let rounds = numberOfRounds {
                  if currentPlayer < playerScores.count {
                      currentPlayer += 1
                  } else {
                      currentPlayer = 1
                      if currentRound < rounds {
                          currentRound += 1
                      } else {
                          PlayerTurn.text = "Jogo Acabou"
                          ScoreBoardButton?.isEnabled = true
                          if let maxScore = playerScores.max(),
                             let winnerIndex = playerScores.firstIndex(of: maxScore) {
                              winnerName = "Jogador \(winnerIndex + 1)"
                          }
                          return
                      }
                  }
                  RondaLabel.text = "Ronda \(currentRound) de \(rounds)"
                  updatePlayerTurnLabel()
              }
          }

    @IBAction func ScoreBoard(_ sender: UIButton) {
        performSegue(withIdentifier: "showScoreBoardSegue", sender: self)
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showScoreBoardSegue" {
            if let destinationVC = segue.destination as? ScoreBoardViewController {
                destinationVC.winnerName = winnerName
                destinationVC.scores = scores.map { "Jogador \(scores.firstIndex(of: $0)! + 1): \($0)" }
            }
        }
    }

    // Atualiza do jogador atual.
    private func updatePlayerTurnLabel() {
        if let playerTurnLabel = PlayerTurn {
            playerTurnLabel.text = "Jogador \(currentPlayer)"
        } else {
            print("PlayerTurn label is nil")
        }
    }
}
