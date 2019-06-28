//
//  score.swift
//  QuizQuis
//
//  Created by Carlos Modinez on 17/06/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import Foundation



class Score : NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(valor, forKey: "valor")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        valor = aDecoder.decodeInteger(forKey: "valor")
    }
    
    var nome : String
    var valor : Int
    
    init(nome : String, valor : Int) {
        self.nome = nome
        self.valor = valor
    }
    
    convenience override init() {
        self.init(nome: "", valor : 0)
    }
    
}
