//  PerguntasViewController.swift
//  QuizTeste
//
//  Created by Carlos Modinez on 10/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.


import UIKit

class PerguntasViewController: UIViewController {
    
    @IBOutlet weak var lblPergunta: UILabel!
    @IBOutlet weak var lblPontuacao: UILabel!
    @IBOutlet weak var lblQtdDeVidas: UILabel!

    @IBOutlet weak var btnRespostaA: UIButton!
    @IBOutlet weak var btnRespostaB: UIButton!
    @IBOutlet weak var btnRespostaC: UIButton!
    var btnPressionado = -1
    @IBOutlet weak var btnConfirmarResposta: UIButton!
    
    
    @IBOutlet weak var lblMaisCinco: UILabel!
    @IBOutlet weak var lblMenosUm: UILabel!
    
    
    let listaDePerguntas = Repositorio.shared.listaDePerguntas
    var perguntasCategoriaSelecionada : [Pergunta] = []
    var perguntaSelecionada : Pergunta!
    var categoria = -1
    var resposta = -1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarPagina()
        
    }

    func configurarPagina() {
        lblPontuacao.text = String(Repositorio.shared.pontuacao)
        lblQtdDeVidas.text = String(Repositorio.shared.numeroDeVidas)
    
        
        btnConfirmarResposta.isEnabled = false
        btnConfirmarResposta.alpha = 0.5
        selecionarPerguntas()
        perguntaSelecionada = adicionarPergunta()
        adicionarRespostas(pergunta: perguntaSelecionada)
        
        
        btnConfirmarResposta.isEnabled = false // passa a ser true apos selecionar uma das respostas
        
        btnRespostaA.isEnabled = true
        btnRespostaB.isEnabled = true
        btnRespostaC.isEnabled = true
        
        lblMaisCinco.alpha = 0
        lblMenosUm.alpha = 0
        
        ajustarBordasDoBotao(botao: btnRespostaA)
        ajustarBordasDoBotao(botao: btnRespostaB)
        ajustarBordasDoBotao(botao: btnRespostaC)
        ajustarBordasDoBotao(botao: btnConfirmarResposta)

    }
    
    
    func selecionarPerguntas() {
        for i in 0..<listaDePerguntas.count{
            if listaDePerguntas[i].categoria == categoria{
                perguntasCategoriaSelecionada.append(listaDePerguntas[i])
            }
        }
    }
    
    
    func adicionarPergunta() -> Pergunta{
        let numeroRandomico = Int.random(in: 0..<perguntasCategoriaSelecionada.count)
        let pergunta = perguntasCategoriaSelecionada[numeroRandomico]
        lblPergunta.text = pergunta.pergunta

        return pergunta
    }
    
    
    func adicionarRespostas(pergunta : Pergunta) {
        btnRespostaA.setTitle(pergunta.respostas[0], for: .normal)
        btnRespostaB.setTitle(pergunta.respostas[1], for: .normal)
        btnRespostaC.setTitle(pergunta.respostas[2], for: .normal)
    }
    
    func verificarResposta() {
        if resposta == perguntaSelecionada.posicaoCorreta {
            if resposta == 0 {
                self.btnRespostaA.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.9333333333, blue: 0.6666666667, alpha: 1)
            }
            else if resposta == 1 {
                self.btnRespostaB.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.9333333333, blue: 0.6666666667, alpha: 1)
            }
            else {
                self.btnRespostaC.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.9333333333, blue: 0.6666666667, alpha: 1)
            }
            
            incrementarPontuacao()
        }else {
            if resposta == 0 {
                self.btnRespostaA.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3215686275, alpha: 1)
            }
            else if resposta == 1 {
                self.btnRespostaB.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3215686275, alpha: 1)
            }
            else {
                self.btnRespostaC.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.3882352941, blue: 0.3215686275, alpha: 1)
            }

            decrementarPontuacao()
        }
        
//        lblResultado.isHidden = false
        lblPontuacao.text = String(Repositorio.shared.pontuacao)
        lblQtdDeVidas.text = String(Repositorio.shared.numeroDeVidas)
    }
    
    
    func incrementarPontuacao() {
        
        self.lblMaisCinco.alpha = 1
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: {timer in
            if self.lblMaisCinco.alpha > 0 {
                self.lblMaisCinco.layer.position.y -= 1
                self.lblMaisCinco.alpha -= 0.1
            }
            else {
                timer.invalidate()
                sleep(1)
                self.navigationController?.popViewController(animated: true)
                
            }
        })
        Repositorio.shared.pontuacao += 5
        
    }
    
    func decrementarPontuacao() {
        self.lblMenosUm.alpha = 1
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: {timer in
            if self.lblMenosUm.alpha > 0 {
                self.lblMenosUm.layer.position.y -= 1
                self.lblMenosUm.alpha -= 0.1
            }
            else {
                timer.invalidate()
                sleep(1)
                
                // se game over
                if Repositorio.shared.numeroDeErros > 2 {
                    // se a quantidade de scores ja é maior que tres e a pessoa nao bateu nenhum dos recordes
                    if Repositorio.shared.scores.count > 2 && Repositorio.shared.pontuacao <= Repositorio.shared.scores[2].valor {
                        
                        // deixa arquivado apenas as 3 maiores pontuacoes
                        for i in (0..<Repositorio.shared.scores.count).reversed() {
                            if i > 2{
                                Repositorio.shared.scores.removeLast()
                            }
                        }
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "gameOver") as? GameOverViewController {
                            self.navigationController?.show(vc, sender: self)
                        }
                    }
                    
                    else {
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "novoRecorde") as? NovoRecordeViewController {
                            self.navigationController?.show(vc, sender: self)
                        }
                    }
                }
                else {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        })
        
        Repositorio.shared.numeroDeErros += 1
        Repositorio.shared.numeroDeVidas -= 1
        
    }
    
    @IBAction func aPressed(_ sender: Any) {
        resposta = 0
        btnConfirmarResposta.isEnabled = true
        btnConfirmarResposta.alpha = 1
        btnRespostaA.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.6470588235, blue: 0.7215686275, alpha: 1)
        btnRespostaB.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.2509803922, blue: 0.4352941176, alpha: 1)
        btnRespostaC.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.2509803922, blue: 0.4352941176, alpha: 1)
        
    }
    @IBAction func bPressed(_ sender: Any) {
        resposta = 1
        btnConfirmarResposta.isEnabled = true
        btnConfirmarResposta.alpha = 1
        btnRespostaA.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.2509803922, blue: 0.4352941176, alpha: 1)
        btnRespostaB.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.6470588235, blue: 0.7215686275, alpha: 1)
        btnRespostaC.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.2509803922, blue: 0.4352941176, alpha: 1)
        
    }
    @IBAction func cPressed(_ sender: Any) {
        resposta = 2
        btnConfirmarResposta.isEnabled = true
        btnConfirmarResposta.alpha = 1
        btnRespostaA.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.2509803922, blue: 0.4352941176, alpha: 1)
        btnRespostaB.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.2509803922, blue: 0.4352941176, alpha: 1)
        btnRespostaC.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.6470588235, blue: 0.7215686275, alpha: 1)
    
    }
    
    @IBAction func confirmarPressed(_ sender: Any) {
        verificarResposta()
        btnConfirmarResposta.isEnabled = false
        btnRespostaA.isEnabled = false
        btnRespostaB.isEnabled = false
        btnRespostaC.isEnabled = false

    }
    
    
    func ajustarBordasDoBotao (botao : UIButton){
        botao.layer.cornerRadius = 15
    }
}
