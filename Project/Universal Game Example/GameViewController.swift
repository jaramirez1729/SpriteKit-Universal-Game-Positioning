//
//  GameViewController.swift
//  Universal Game Example
//
//  Created by Jozemite Apps on 8/15/16.
//  Copyright (c) 2016 Jozemite Apps. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JKGame.game.setOrientation(JKOrientation.landscape)
        let scene = GameScene(size: JKGame.size)
        scene.scaleMode = .aspectFill

        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
