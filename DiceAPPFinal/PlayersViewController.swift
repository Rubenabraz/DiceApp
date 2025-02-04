

import UIKit

class PlayersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        JogadoresTextField.returnKeyType = .done
        JogadoresTextField.autocorrectionType = .no
        JogadoresTextField.becomeFirstResponder()
    }


    @IBOutlet weak var NumerojogadoresLabel: UILabel!
    
    
    @IBOutlet weak var JogadoresTextField: UITextField!
    
    
    
    @IBAction func Insert(_ sender: UIButton) {
            if let jogadoresText = JogadoresTextField.text, let numeroDeJogadores = Int(jogadoresText) {
                // Armazenar o número de jogadores numa variável
                let numeroDeJogadoresArmazenado = numeroDeJogadores
                
                // Atualizar o label
                NumerojogadoresLabel.text = "Número de jogadores: \(numeroDeJogadoresArmazenado)"
                
                // Salvar o número de jogadores usando UserDefaults para persistência
                UserDefaults.standard.set(numeroDeJogadoresArmazenado, forKey: "numeroDeJogadores")
            } else {
                // Mostrar um alerta se o texto inserido não for um número válido
                let alert = UIAlertController(title: "Erro", message: "Por favor, insira um número válido.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    
}
