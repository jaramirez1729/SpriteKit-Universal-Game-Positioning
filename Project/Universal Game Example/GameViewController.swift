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
        
        //Fits the max size of an iPad. This allows it to fit even the biggest devices
        let scene = GameScene(size: CGSize(width: 2048, height: 1536))
        scene.scaleMode = .AspectFill

        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
