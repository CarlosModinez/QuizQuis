//
//  beginGameViewController.swift
//  QuizTeste
//
//  Created by Carlos Modinez on 21/05/19.
//  Copyright © 2019 Carlos Modinez. All rights reserved.
//

import UIKit

class beginGameViewController: UIViewController {

    @IBOutlet weak var btnJogar: UIButton!
    @IBOutlet weak var imgRoleta: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ajustarBordasDoBotao(botao: btnJogar)
        updateScreen()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    func ajustarBordasDoBotao (botao : UIButton){
        botao.layer.cornerRadius = 15
    }
    
    func updateScreen() {
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: {timer in
            self.imgRoleta.transform = self.imgRoleta.transform.rotated(by: CGFloat.pi/10)
        })
    }
}
