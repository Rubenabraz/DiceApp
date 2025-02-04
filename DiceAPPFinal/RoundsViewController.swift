import UIKit

class RoundsViewController: UIViewController {

    var numberOfPlayers: Int?
    let image = ["dado1", "dado2", "dado3", "dado4", "dado5", "dado6"]
    var randomDice: Int = 0
    var randomDice1 : Int = 0

    @IBOutlet weak var RodadasLabel: UILabel!
    @IBOutlet weak var LabelRodardados: UILabel!
    @IBOutlet weak var Dados: UIImageView!
    @IBOutlet weak var Jogadores: UILabel!
    @IBOutlet weak var Dados1: UIImageView!
    @IBOutlet weak var DefineJogadoresLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let players = numberOfPlayers {
            print("Número de jogadores: \(players)")
            Jogadores.text = "Número de jogadores: \(players)"
        }
    }
    
    @IBAction func RollDice(_ sender: UIButton) {
        randomDice = Int.random(in: 1...6) 
    
        Dados.image = UIImage(named: image[randomDice - 1])
        RodadasLabel.text = "Vão ser jogadas \(randomDice) rondas"
        if let players = numberOfPlayers {
        Jogadores.text = "Número de jogadores: \(players)"
            
        
        randomDice1 = Int.random(in: 1...6)
        Dados1.image = UIImage(named: image[randomDice1 - 1])
        DefineJogadoresLabel.text = "Vão ser jogados \(randomDice1) dados"
            
        }
    }
    
    @IBAction func StartGame(_ sender: UIButton) {
        performSegue(withIdentifier: "startGameSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGameSegue",
           let destinationVC = segue.destination as? ViewController {
            destinationVC.numberOfRounds = randomDice
            destinationVC.numberOfPlayers = numberOfPlayers
            destinationVC.numberOfDices = randomDice1
        }
    }
}
