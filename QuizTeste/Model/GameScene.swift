//
//  GameScene.swift
//  Quiz
//
//  Created by Carlos Modinez on 09/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Posicoes do vetor de nos filhos da roleta
    let verde = 0 //animais
    let vermelho = 1 // carros
    let azul = 2 // ciencias
    let amarelo = 3 // computacao
    var girando = false

    
    var roleta : SKSpriteNode!
    var seletor : SKSpriteNode!
    var fundo : SKSpriteNode!
    
    var vc: GameViewController!
    var quadranteSelecionado = -1
    
    
    override func didMove(to view: SKView) {
        
        roleta = childNode(withName: "roleta") as? SKSpriteNode
        seletor = childNode(withName: "seletor") as? SKSpriteNode
        fundo = childNode(withName: "tela") as? SKSpriteNode
        fundo?.alpha = 0
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !girando {
            return
        }
        if roleta.physicsBody!.angularVelocity <= 0.05 {
            parar()
        }
    }
    
    func girar() {
        roleta.physicsBody?.applyAngularImpulse(CGFloat.random(in: 600...2500))
        girando = true
    }
    func parar() {
        girando = false
        let anguloFinal = self.roleta.zRotation
        quadranteSelecionado = self.verificarInternalidade(angulo: anguloFinal)
        
        self.vc.quadranteSelecionado = quadranteSelecionado
        self.mudarBackGround(quadranteSelecionado: self.vc.quadranteSelecionado)
        
        
        
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: {timer in
            if self.fundo!.alpha < CGFloat(1) {
                self.fundo?.alpha += 0.1
                
                if self.quadranteSelecionado == self.azul {
                    self.roleta.childNode(withName: "carros")?.xScale += 0.01
                    self.roleta.childNode(withName: "carros")?.yScale += 0.01
                    
                    self.roleta.childNode(withName: "ciencia")?.alpha -= 0.05
                    self.roleta.childNode(withName: "computacao")?.alpha -= 0.05
                    self.roleta.childNode(withName: "animais")?.alpha -= 0.05
                }
                    
                else if self.quadranteSelecionado == self.vermelho {
                    self.roleta.childNode(withName: "ciencia")?.xScale += 0.01
                    self.roleta.childNode(withName: "ciencia")?.yScale += 0.01
                    
                    self.roleta.childNode(withName: "carros")?.alpha -= 0.05
                    self.roleta.childNode(withName: "animais")?.alpha -= 0.05
                    self.roleta.childNode(withName: "computacao")?.alpha -= 0.05
                }
                    
                else if self.quadranteSelecionado == self.amarelo {
                    self.roleta.childNode(withName: "computacao")?.xScale += 0.015
                    self.roleta.childNode(withName: "computacao")?.yScale += 0.015
                    
                    self.roleta.childNode(withName: "ciencia")?.alpha -= 0.05
                    self.roleta.childNode(withName: "animais")?.alpha -= 0.05
                    self.roleta.childNode(withName: "carros")?.alpha -= 0.05
                }
                else {
                    self.roleta.childNode(withName: "animais")?.xScale += 0.005
                    self.roleta.childNode(withName: "animais")?.yScale += 0.005
                    
                    self.roleta.childNode(withName: "ciencia")?.alpha -= 0.05
                    self.roleta.childNode(withName: "computacao")?.alpha -= 0.05
                    self.roleta.childNode(withName: "carros")?.alpha -= 0.05
                }
                
            }else {
                timer.invalidate()
                sleep(1)
                self.vc.mudarTela()
            }
        })
        
        
    }
    
    
    //Verifica o angulo da roleta para saber onde o seletor parou
    func verificarInternalidade(angulo : CGFloat) -> Int {
        let pi = CGFloat.pi
        let meioPi = CGFloat.pi/2
        let quadranteSelecionado : Int
        
        if angulo > 0 && angulo < meioPi{
            quadranteSelecionado = azul // carros
        }else if angulo <= 0 && angulo >= -meioPi{
            quadranteSelecionado = vermelho // ciencia
        }else if angulo >= meioPi  && angulo < pi{
            quadranteSelecionado = amarelo //computacao
        }else {
            quadranteSelecionado = verde//animais
        }
        return quadranteSelecionado
    }
    
    
    func mudarBackGround (quadranteSelecionado : Int){
        
    }
    
   
}




