//
//  TabelaScoresViewController.swift
//  QuizTeste
//
//  Created by Carlos Modinez on 12/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class TabelaScoresViewController: UIViewController {

    
    @IBOutlet weak var lblNomePrimeiro: UILabel!
    @IBOutlet weak var lblValorPrimeiro: UILabel!
    
    @IBOutlet weak var lblNomeSegundo: UILabel!
    @IBOutlet weak var lblValorSegundo: UILabel!
    
    @IBOutlet weak var lblNomeTerceiro: UILabel!
    @IBOutlet weak var lblvalorTerceiro: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        let melhoresPontuacoes = getMelhoresPontuacoes()
        configurarPagina(scores: melhoresPontuacoes)
        super.viewDidLoad()
    }
    
    func configurarPagina(scores : [Score]) {
    
        lblNomePrimeiro.text = "---"
        lblValorPrimeiro.text = "0"
        
        lblNomeSegundo.text = "---"
        lblValorSegundo.text = "0"
        
        lblNomeTerceiro.text = "---"
        lblvalorTerceiro.text = "0"
        
        if scores.count > 2 {
            lblNomePrimeiro.text = scores[0].nome
            lblValorPrimeiro.text = String(scores[0].valor)
            
            lblNomeSegundo.text = scores[1].nome
            lblValorSegundo.text = String(scores[1].valor)
            
            lblNomeTerceiro.text = scores[2].nome
            lblvalorTerceiro.text = String(scores[2].valor)
        }
        
        else if scores.count == 2 {
            lblNomePrimeiro.text = scores[0].nome
            lblValorPrimeiro.text = String(scores[0].valor)
        
            lblNomeSegundo.text = scores[1].nome
            lblValorSegundo.text = String(scores[1].valor)
        }
        
        else if scores.count == 1 {
            lblNomePrimeiro.text = scores[0].nome
            lblValorPrimeiro.text = String(scores[0].valor)
        }
    }
    
    func getMelhoresPontuacoes() -> [Score] {
        var melhoresPontuacoes : [Score] = []
        var aux : Score
        
        for i in 0..<Repositorio.shared.scores.count {
            for j in 0..<Repositorio.shared.scores.count {
                if Repositorio.shared.scores[i].valor > Repositorio.shared.scores[j].valor {
                    aux = Repositorio.shared.scores[i]
                    Repositorio.shared.scores[i] = Repositorio.shared.scores[j]
                    Repositorio.shared.scores[j] = aux
                }
            }
        }
        
        for i in 0..<Repositorio.shared.scores.count {
            melhoresPontuacoes.append(Repositorio.shared.scores[i])
        }
        return melhoresPontuacoes
    }
}
