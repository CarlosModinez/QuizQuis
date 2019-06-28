//
//  GameOverViewController.swift
//  QuizTeste
//
//  Created by Carlos Modinez on 11/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var btnJogarNovamente: UIButton!
    @IBOutlet weak var lblPontuacao: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPontuacao.text = String(Repositorio.shared.pontuacao)
        Repositorio.shared.scores.append(Score(nome: "---", valor: Repositorio.shared.pontuacao))
        ajustarBordasDoBotao(botao: btnJogarNovamente)
    }
    

    @IBAction func jogarNovamentePressed(_ sender: Any) {
        Repositorio.shared.pontuacao = 0
        Repositorio.shared.numeroDeErros = 0
        Repositorio.shared.numeroDeVidas = 3
        self.navigationController?.popToRootViewController(animated: true)
    }
    func ajustarBordasDoBotao (botao : UIButton){
        botao.layer.cornerRadius = 15
    }
}
