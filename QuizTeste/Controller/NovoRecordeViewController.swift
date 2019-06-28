//
//  NovoRecordeViewController.swift
//  QuizQuis
//
//  Created by Carlos Modinez on 19/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class NovoRecordeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnJogarNovamente: UIButton!
    @IBOutlet weak var inputTxtNome: UITextField!
    @IBOutlet weak var lblPontuacao: UILabel!
    var newScore = Score()

    override func viewDidLoad() {
        super.viewDidLoad()
        inputTxtNome.delegate = self
        lblPontuacao.text = String(Repositorio.shared.pontuacao)
        newScore.valor = Repositorio.shared.pontuacao
        ajustarBordasDoBotao(botao: btnJogarNovamente)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTxtNome.resignFirstResponder()
        return true
    }
    @IBAction func addNome(_ sender: UITextField) {
        newScore.nome = sender.text!
    }
    
    @IBAction func jogarNovamentePressed(_ sender: Any) {
        Repositorio.shared.scores.append(newScore)
        Repositorio.shared.pontuacao = 0
        Repositorio.shared.numeroDeErros = 0
        Repositorio.shared.numeroDeVidas = 3
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func ajustarBordasDoBotao (botao : UIButton){
        botao.layer.cornerRadius = 15
    }


}
