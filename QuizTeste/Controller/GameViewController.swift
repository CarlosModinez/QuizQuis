//
//  GameViewController.swift
//  Quiz
//
//  Created by Carlos Modinez on 09/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
   
    @IBOutlet weak var GameView: SKView!
    @IBOutlet weak var btnGirarRoleta: UIButton!
    
    
    var gameScene: GameScene!
    var quadranteSelecionado = -1
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        configurarPagina()
        
        if let view = GameView {
            gameScene = SKScene(fileNamed: "GameScene") as? GameScene
            gameScene.scaleMode = .aspectFill
            gameScene.vc = self
            view.presentScene(gameScene)
        }
    
    }

    func configurarPagina() {
        
        btnGirarRoleta.isEnabled = true
        btnGirarRoleta.isHidden = false
        ajustarBordasDoBotao(botao: btnGirarRoleta)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func girar() {
        gameScene.girar()
        btnGirarRoleta.isEnabled = false
        btnGirarRoleta.isHidden = true
    }
    
    func mudarTela() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "perguntas") as? PerguntasViewController {
            vc.categoria = quadranteSelecionado
            self.navigationController?.show(vc, sender: self)
        }
    }

    @IBAction func girarPressed(_ sender: Any) {
        girar()
    }
    
    func ajustarBordasDoBotao (botao: UIButton){
        botao.layer.cornerRadius = 15
    }
}
