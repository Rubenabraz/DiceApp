import UIKit

class PPlayersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TextFieldPlayers.returnKeyType = .done
        TextFieldPlayers.autocorrectionType = .no
        TextFieldPlayers.becomeFirstResponder()
    }

    @IBOutlet weak var TextFieldPlayers: UITextField!
    @IBOutlet weak var jogadoresLabel: UILabel!
    
    @IBAction func Insert(_ sender: UIButton) {
        if let jogadores = Int(TextFieldPlayers.text!) {
    
            if jogadores >= 2 && jogadores <= 5 {
                let numberOfPlayers = jogadores
                

                jogadoresLabel.text = "Número de jogadores: \(numberOfPlayers)"
                
                performSegue(withIdentifier: "ShowRoundsSegue", sender: numberOfPlayers)
            } else {
                let alert = UIAlertController(title: "Erro", message: "Por favor, insira um número de jogadores entre 2 e 5.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Erro", message: "Por favor, insira um número válido.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRoundsSegue",
           let destinationVC = segue.destination as? RoundsViewController,
           let jogadores = sender as? Int {
            destinationVC.numberOfPlayers = jogadores
        }
    }
}
