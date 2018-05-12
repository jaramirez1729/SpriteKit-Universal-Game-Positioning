/*
 * Copyright (c) 2018 Jozemite Apps May 12, 2018
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import SpriteKit
import GameKit

enum JKOrientation {
    case portrait, landscape
}


final class JKGame {
    
    // MARK: - Static Properties
    /// The shared singleton. Default settings are portrait device with 1536x2048 resolution (universal).
    static var game: JKGame = JKGame()
    /// Convenient property that returns the border.
    static var rect: CGRect {
        return JKGame.game.border
    }
    /// Convenient property that returns the resolution.
    static var size: CGSize {
        return JKGame.game.resolution
    }
    
    // MARK: - Public Properties
    /// The border of the device's screen as a CGRect.
    private(set) var border: CGRect!
    /// The resolution of the device's screen as a CGSize object. Default is 1536x2048.
    private(set) var resolution: CGSize = CGSize(width: 1536, height: 2048)
    /// The protrait of the device.
    private(set) var orientation: JKOrientation = JKOrientation.portrait


    // MARK: - Private Properties
    fileprivate let deviceWidth: CGFloat = UIScreen.main.bounds.width
    fileprivate let deviceHeight: CGFloat = UIScreen.main.bounds.height

    
    // MARK: - Init
    init() {
        setBorder(using: resolution, and: orientation)
    }
    

    // MARK: - Public Methods
    func setCustom(resolution: CGSize, and orientation: JKOrientation = JKOrientation.portrait) {
        self.resolution = resolution
        self.orientation = orientation
        setBorder(using: self.resolution, and: self.orientation)
    }
    
    func setOrientation(_ orientation: JKOrientation) {
        self.orientation = orientation
        setBorder(using: self.resolution, and: self.orientation)
    }
    
    /// Draws a red border around the device's screen.
    func drawBorder(on scene: SKScene) {
        let area: SKShapeNode = SKShapeNode(rect: border)
        area.lineWidth = 10
        area.strokeColor = SKColor.red
        scene.addChild(area)
    }
    
    
    // MARK: - Private Methods
    private func setBorder(using size: CGSize, and orientation: JKOrientation) {
        switch orientation {
        case .landscape:
            let maxAspectRatio = deviceWidth / deviceHeight
            let playableHeight = size.width / maxAspectRatio
            let playableMargin = (size.height - playableHeight) / 2.0
            border = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
            
        case .portrait:
            let maxAspectRatio = deviceHeight / deviceWidth
            let playableWidth = size.height / maxAspectRatio
            let playableMargin = (size.width - playableWidth) / 2.0
            border = CGRect(x: playableMargin, y: 0, width: playableWidth, height: size.height)
        }
    }
}























