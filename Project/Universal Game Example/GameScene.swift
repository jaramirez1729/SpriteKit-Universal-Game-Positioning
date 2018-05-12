//
//  GameScene.swift
//  Universal Game Example
//
//  Created by Jozemite Apps on 8/15/16.
//  Copyright (c) 2016 Jozemite Apps. All rights reserved.
//

import SpriteKit


//Used to get the ratio of the device for later calculation
var deviceWidth = UIScreen.main.bounds.width
var deviceHeight = UIScreen.main.bounds.height
var playableArea: CGRect!


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
        //Creates a retangle for the view
        let maxAspectRatio: CGFloat = deviceWidth / deviceHeight
        let playableHeight = size.width / maxAspectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableArea = CGRect(x:0, y: playableMargin, width: size.width, height: playableHeight)
        
        //Draws specific rectangles for comparison
        drawPlayableArea()
        //drawiPhone5SFrame()
        
        /* All objects that depend on the size of the device, such as a HUD, can easily be positioned
            by referencing the playableArea rectangle when positioning the objects.
         */
        
        background.position = CGPoint(x: playableArea.midX, y: playableArea.midY)
        background.zPosition = -10
        addChild(background)
        
        //Positions the object to the top right
        scoreLabel.position = CGPoint(x: playableArea.maxX - 35, y: playableArea.maxY - 90)
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.fontSize = 80
        scoreLabel.fontName = "Georgia-Bold"
        addChild(scoreLabel)

        //Positions the object to the top left
        HPLabel.position = CGPoint(x: playableArea.minX + 35, y: playableArea.maxY - 90)
        HPLabel.horizontalAlignmentMode = .left
        HPLabel.fontSize = scoreLabel.fontSize
        HPLabel.fontName = scoreLabel.fontName
        addChild(HPLabel)
    }
    
    //Test: Draws the playable area or the viewable area that the user can see
    func drawPlayableArea() {
        let area = SKShapeNode(rect: playableArea)
        area.lineWidth = 20
        area.strokeColor = SKColor.red
        addChild(area)
        print(area)
    }
    
    func drawiPhone5SFrame() {
        let area = SKShapeNode(rect: CGRect(x: -10, y: 180, width: 2069, height: 1175))
        area.lineWidth = 10
        area.strokeColor = SKColor.orange
        addChild(area)
    }
}
