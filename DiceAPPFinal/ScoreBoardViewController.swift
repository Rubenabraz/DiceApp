import UIKit

class ScoreBoardViewController: UIViewController {
    
    var winnerName: String?
    var scores: [String]?

    @IBOutlet weak var ParebensLabel: UILabel!
    @IBOutlet weak var JogadorVencedorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ParebensLabel.text = "Parabéns!"
        JogadorVencedorLabel.text = "Jogador Vencedor: \(winnerName ?? "Desconhecido")"
        
        }
    }

