//
//  GameScene.swift
//  Universal Game Example
//
//  Created by Jozemite Apps on 8/15/16.
//  Copyright (c) 2016 Jozemite Apps. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "Background")
    let scoreLabel = SKLabelNode(text: "Score: 0")
    let HPLabel = SKLabelNode(text: "HP: 100%")
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        
        // Just for testing purposes.
        JKGame.game.drawBorder(on: self)

        /* All objects that depend on the size of the device, such as a HUD, can easily be positioned
            by referencing the JKGame.rect rectangle when positioning the objects because the
            JKGame.rect rectangle is the same size as the device's screen.
         */
        
        background.position = CGPoint(x: JKGame.rect.midX, y: JKGame.rect.midY)
        background.zPosition = -10
        addChild(background)
        
        //Positions the object to the top right
        scoreLabel.position = CGPoint(x: JKGame.rect.maxX - 35, y: JKGame.rect.maxY - 90)
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.fontSize = 80
        scoreLabel.fontName = "Georgia-Bold"
        addChild(scoreLabel)

        //Positions the object to the top left
        HPLabel.position = CGPoint(x: JKGame.rect.minX + 35, y: JKGame.rect.maxY - 90)
        HPLabel.horizontalAlignmentMode = .left
        HPLabel.fontSize = scoreLabel.fontSize
        HPLabel.fontName = scoreLabel.fontName
        addChild(HPLabel)
    }
}
