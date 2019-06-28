//
//  Repositorio.swift
//  QuizTeste
//
//  Created by Carlos Modinez on 10/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import Foundation

func archiveScore(score:[Score]) -> NSData? {
    do {
        let archivedObject = try NSKeyedArchiver.archivedData(withRootObject: score as NSArray, requiringSecureCoding: false)
        return archivedObject as NSData
    }catch{
        return nil
    }
}

func retrieveScore() -> [Score]? {
    if let unarchivedObject = UserDefaults.standard.object(forKey: "scores") as? NSData {
        return NSKeyedUnarchiver.unarchiveObject(with: (unarchivedObject as NSData) as Data) as? [Score]
    }
    return nil
}

class Repositorio {
    static var shared = Repositorio()
    var scores = [Score] (){
        didSet {
            let archivedObject = archiveScore(score: self.scores)
            UserDefaults.standard.set(archivedObject, forKey: "scores")
        }
    }
    
    var pontuacao = 0
    var numeroDeVidas = 3
    var numeroDeErros = 0
    var listaDePerguntas : [Pergunta] = []

    
    private init() {
        if let scoresSalvos = retrieveScore() {
            self.scores = scoresSalvos
        }
        
        // Categoria de animais
        listaDePerguntas.append(Pergunta(pergunta: "Qual é a única espécie de felino que raramente é encontrados sozinho?",
                                         respostas: ["Leão", "Jaguatirica", "Onça-pintada"],
                                         posicaoCorreta: 0,
                                         categoria : 0))

        listaDePerguntas.append(Pergunta(pergunta: "Qual das espécies de serpentes abaixo é considerada a mais venenosa de todas?",
                                         respostas: ["Serpente egípcia cuspidora", "Sucuri", "Serpente Marinha de Bico"],
                                         posicaoCorreta: 2,
                                         categoria : 0))
        
        listaDePerguntas.append(Pergunta(pergunta: "Entre os egípcios, qual era a punição por matar um gato?",
                                         respostas: ["Ter a orelha cortada", "Prisão eterna", "Pena de morte"],
                                         posicaoCorreta: 2,
                                         categoria : 0))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual o serpente terrestre mais veloz que se tem conhecimento?",
                                         respostas: ["Mamba Negra -  23km/hm", "Jiboia - 30km/h", "Jararaca - 40km/h"],
                                         posicaoCorreta: 0,
                                         categoria: 0))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual o peso médio da cobra Sucuri?",
                                         respostas: ["Cerca de 150 kg", "Cerca de 300 kg", "Cerca de 450 kg"],
                                         posicaoCorreta: 2,
                                         categoria: 0))
        
        listaDePerguntas.append(Pergunta(pergunta: "Quantas patas tem as borboletas?",
                                         respostas: ["0", "4", "6"],
                                         posicaoCorreta: 2,
                                         categoria: 0))
        
        listaDePerguntas.append(Pergunta(pergunta: "A que familia científica pertence o lobo terrestre?",
                                         respostas: ["Felidae", "Hyaenidae ", "Euple ridae"],
                                         posicaoCorreta: 1,
                                         categoria: 0))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual destes animais NÃO é um lagarto?",
                                         respostas: ["Dragão de Komodo", "Monstro de Gila", "Tuatara"],
                                         posicaoCorreta: 2,
                                         categoria: 0))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual é o animal mais rápido?",
                                         respostas: ["Aguia", "Falcão Pelegrino", "Guepardo"],
                                         posicaoCorreta: 1,
                                         categoria: 0))
        
        
        // Categoria Carros
        listaDePerguntas.append(Pergunta(pergunta: "Em que ano occoreu a primeira temporada do Campeonato Formula 1?",
                                         respostas: ["1988", "1972", "1950"],
                                         posicaoCorreta: 2,
                                         categoria : 2))

        listaDePerguntas.append(Pergunta(pergunta: "Em que ano foi fabricado o primeiro carro elétrico?",
                                         respostas: ["1835", "1917", "1940"],
                                         posicaoCorreta: 0,
                                         categoria : 2))
        
        listaDePerguntas.append(Pergunta(pergunta: "Quem foi o responsável pela invenção do carro?",
                                         respostas: ["Marie Curie", "Leonardo da Vinci", "Carl Benz"],
                                         posicaoCorreta: 2,
                                         categoria : 2))
        
        listaDePerguntas.append(Pergunta(pergunta: "A montadora italiana Lamborghini usa qual animal em seu logo?",
                                         respostas: ["Touro", "Cavalo", "Cabra"],
                                         posicaoCorreta: 0,
                                         categoria : 2))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual das seguintes opções NÃO é um fabricante de automóveis russo?",
                                         respostas: ["Silant", "Dragon", "BYD"],
                                         posicaoCorreta: 2,
                                         categoria : 2))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual destas empresas NÃO fabrica motocicletas?",
                                         respostas: ["Toyota", "Kawasaki", "Honda"],
                                         posicaoCorreta: 0,
                                         categoria : 2))
        
        listaDePerguntas.append(Pergunta(pergunta: "Em 2014, mais de 6 milhões de veículos da General Motors foram recolhidos devido a que falha crítica?",
                                         respostas: ["Interruptor de ignição defeituoso ", "Pedal de funcionamento avariado", "Almofadas de freio defeituosas"],
                                         posicaoCorreta: 0,
                                         categoria : 2))
        
        listaDePerguntas.append(Pergunta(pergunta: "Quais são as partes do tipo cilindro que sobem e descem dentro do motor?",
                                         respostas: ["Radiadores", "Pistões", "ABS"],
                                         posicaoCorreta: 1,
                                         categoria : 2))
        
        
        
        // Categoria ciencia
        listaDePerguntas.append(Pergunta(pergunta: "Quem foi a primeira pessoa a ganhar dois Nobels em duas categorias diferentes?",
                                         respostas: ["Alessandro Volta", "Marie Curie", "Joseph Swan"],
                                         posicaoCorreta: 1,
                                         categoria : 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "Como ficou conhecido o ano em que Albert Einstein publicou seus primeiros trabalhos, mais precisamente em 1905?",
                                         respostas: ["Ano de Einstein", "Ano do Milagre", "Ano da Relatividade"],
                                         posicaoCorreta: 1,
                                         categoria : 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "A Terra executa alguns movimentos, como o de rotação e translação. Quantos movimentos ela executa no total?",
                                         respostas: ["7 movimentos", "11 movimentos", "14 movimentos"],
                                         posicaoCorreta: 2,
                                         categoria : 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "O termo 'BATERIA' para descrever um dispositivo de armazenamento elétrico foi primeiramente usado por:" ,
                                         respostas: ["Nikola Tesla", "Benjamin Franklin", "Alessandro Volta"],
                                         posicaoCorreta: 1,
                                         categoria: 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual empresa projetou o formato de video cassete 'Betamax'?",
                                         respostas: ["Sony", "LG", "Panasonic"],
                                         posicaoCorreta: 0,
                                         categoria: 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "Quem patenteou o mecanismo a vapor que produziu movimento giratório contínuo?",
                                         respostas: ["Nikola Tesla", "Albert Einstein", " James Watt"],
                                         posicaoCorreta: 2,
                                         categoria: 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual foi o nome do primeiro satélite artificial da Terra, lançado pela União Soviética em 1957?",
                                         respostas: ["Sputnik 1", "Zenit-2", "Soyuz 7K-OK"],
                                         posicaoCorreta: 0,
                                         categoria: 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual é o elemento mais abundante no universo?",
                                         respostas: ["Hidrogênio", "Oxigênio", "Gás Carbônico"],
                                         posicaoCorreta: 0,
                                         categoria: 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual destes elementos da Tabela Periódica é um Gás Nobre?",
                                         respostas: ["Cobalto", "Iodo", "Neon"],
                                         posicaoCorreta: 2,
                                         categoria: 1))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual é a unidade de capacitância elétrica?",
                                         respostas: ["Gauss", "Farad", "Henry"],
                                         posicaoCorreta: 1,
                                         categoria: 1))
        
        
        
        
        // Categoria programação
        listaDePerguntas.append(Pergunta(pergunta: "Qual é o nome do criador da linguagem de programação Swift?",
                                         respostas: ["Chris Lattner", "Tim Cook", "Steve Jobs"],
                                         posicaoCorreta: 0,
                                         categoria : 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Quem criou a primeira linguagem de programação e em que ano isso ocorreu?",
                                         respostas: ["Ada Lovelace em 1850", "Grace Hopper em 1984", "Bill Gates em 1975"],
                                         posicaoCorreta: 0,
                                         categoria : 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Em que ano foi lançado o animal de estimação virtual Tamagotchi?",
                                         respostas: ["1996", "1992", " 1990"],
                                         posicaoCorreta: 0,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Em que ano foi lançado o Iphone?",
                                         respostas: ["2000", "2003", " 2007"],
                                         posicaoCorreta: 2,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Segundo o Sistema Internacional de Unidades, quantos bytes estão em um kilobyte de RAM?",
                                         respostas: ["1024", "512", "1000"],
                                         posicaoCorreta: 2,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual a quantidade de bits que equivalem a um byte?",
                                         respostas: ["4", "8", "64"],
                                         posicaoCorreta: 1,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Em Hexadeciamal, qual cor seria exibida a partir do código '#00FF000'?",
                                         respostas: ["Vermelho", "Amarelo", "Verde"],
                                         posicaoCorreta: 2,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual dos seguintes sistemas a seguir foi o primeiro a ser lançado?",
                                         respostas: ["Linux", "Mac OS", "Windows"],
                                         posicaoCorreta: 1,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual foi o primeiro processador de computador comercialmente disponível?",
                                         respostas: ["TMS 1000", "Intel 486SX", "Intel 4004"],
                                         posicaoCorreta: 2,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Em que dia a World Wide Web (WWW) entrou online?",
                                         respostas: ["20 de dezembro de 1990", "17 de dezembro de 1996", " 24 de novembro de 1995"],
                                         posicaoCorreta: 0,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Em que dia a World Wide Web (WWW) entrou online?",
                                         respostas: ["20 de dezembro de 1990", "17 de dezembro de 1996", " 24 de novembro de 1995"],
                                         posicaoCorreta: 0,
                                         categoria: 3))
        
        listaDePerguntas.append(Pergunta(pergunta: "Qual dos seguntes componentes é conhecido como cérebro do computador?",
                                         respostas: ["Placa Mãe", "Teclado", "Unidade Central de Processamento (CPU)"],
                                         posicaoCorreta: 2,
                                         categoria: 3))
        

    }
}
