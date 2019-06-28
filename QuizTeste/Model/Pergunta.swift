//
//  Pergunta.swift
//  QuizTeste
//
//  Created by Carlos Modinez on 10/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import Foundation

class Pergunta {
    
    var pergunta : String
    var respostas : [String]
    var posicaoCorreta : Int
    var categoria : Int

    init(pergunta: String, respostas : [String], posicaoCorreta : Int, categoria : Int) {
        self.pergunta = pergunta
        self.respostas = respostas
        self.posicaoCorreta = posicaoCorreta
        self.categoria = categoria
    }
}
