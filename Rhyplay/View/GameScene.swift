//
//  GameScene.swift
//  songSprite
//
//  Created by Yohan Wijaya on 10/11/23.
//

import Foundation
import SpriteKit
import AVFoundation


class GameScene: SKScene {
    
    var isGamePaused = false
    var pauseButton: SKSpriteNode!
    var backgroundMusic: AVAudioPlayer?
    var resumeButton: SKSpriteNode!
    var menuButton: SKSpriteNode!
    var isGameResume = false
    var resetgameButton: SKSpriteNode!
    var countresume = false
    var worldNode:SKNode?
    var gameplay: SKAction!
    var pausenode: SKEmitterNode!

    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .black
        scaleMode = .aspectFill
      
        worldNode = SKNode()
        self.addChild(self.worldNode!)

        
        gameplay  = SKAction.sequence([SKAction.run {
            
        
        if let musicURL = Bundle.main.url(forResource: "SuperShy", withExtension: "mp3") {
            do {
                self.backgroundMusic = try AVAudioPlayer(contentsOf: musicURL)
                
                // Menunda pemutaran musik selama 5 detik
                let delayAction = SKAction.wait(forDuration: 3.0)
                let playMusicAction = SKAction.run {
                    self.backgroundMusic?.play()
                }
                let sequence = SKAction.sequence([delayAction, playMusicAction])
                self.run(sequence)
            } catch {
                print("Error playing background music: \(error.localizedDescription)")
            }
        }
        
        let background = SKSpriteNode(imageNamed: "background")
        background.scale(to: CGSize(width: self.size.width, height: self.size.height))
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            self.addChild(background)
        
        
        
        
        
        if let emitter = SKEmitterNode(fileNamed: "MyParticle.sks") {
            emitter.position = CGPoint(x: 345, y: 90)
            self.addChild(emitter)
        }
        if let emitter1 = SKEmitterNode(fileNamed: "MyParticle.sks") {
            emitter1.position = CGPoint(x: 245, y: 90)
            self.addChild(emitter1)
        }
        if let emitter2 = SKEmitterNode(fileNamed: "MyParticle.sks") {
            emitter2.position = CGPoint(x: 145, y: 90)
            self.addChild(emitter2)
        }
        if let emitter3 = SKEmitterNode(fileNamed: "MyParticle.sks") {
            emitter3.position = CGPoint(x: 45, y: 90)
            self.addChild(emitter3)
        }
        let confettiAction = SKAction.run {
            if let confeti = SKEmitterNode(fileNamed: "m.sks"){
                confeti.position = CGPoint(x: 200, y: 890)
                self.addChild(confeti)
                let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
                let groupconfeti = SKAction.sequence([fadeIn])
                confeti.particleColorSequence = nil
                confeti.particleColorBlendFactor = 1
                confeti.particleColorBlueRange = 1
                confeti.particleColorGreenRange = 1
                confeti.particleColorRedRange = 1
                confeti.run(groupconfeti)
            }
        }
        
        let waitAction = SKAction.wait(forDuration: 65.0)
        let confettiSequence = SKAction.sequence([waitAction, confettiAction])
        self.run(confettiSequence)
        
        let kickleft = SKSpriteNode(imageNamed: "kickleft")
        kickleft.setScale(CGFloat(0.6))
        kickleft.position = CGPoint(x: 45, y: 90)
        kickleft.alpha = 0
        self.addChild(kickleft)
        let delayAction = SKAction.wait(forDuration: 4.2)
        let fadeInAction = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
        let sequenceAction = SKAction.sequence([delayAction, fadeInAction])
        kickleft.run(sequenceAction)
        
        let snareleft =  SKSpriteNode(imageNamed: "snareleft")
        snareleft.setScale(CGFloat(0.6))
        snareleft.position = CGPoint(x: 145, y: 90)
        snareleft.alpha = 0
            self.addChild(snareleft)
        let delayAction1 = SKAction.wait(forDuration: 4.4)
        let fadeInAction1 = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
        let sequenceAction1 = SKAction.sequence([delayAction1, fadeInAction1])
        snareleft.run(sequenceAction1)
        
        let snareright =  SKSpriteNode(imageNamed: "snareright")
        snareright.setScale(CGFloat(0.6))
        snareright.position = CGPoint(x: 245, y: 90)
        snareright.alpha = 0
            self.addChild(snareright)
        let delayAction2 = SKAction.wait(forDuration: 4.6)
        let fadeInAction2 = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
        let sequenceAction2 = SKAction.sequence([delayAction2, fadeInAction2])
        snareright.run(sequenceAction2)
        
        let kickright =  SKSpriteNode(imageNamed: "kickright")
        kickright.setScale(CGFloat(0.6))
        kickright.position = CGPoint(x: 345, y: 90)
        kickright.alpha = 0
            self.addChild(kickright)
        let delayAction3 = SKAction.wait(forDuration: 4.8)
        let fadeInAction3 = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
        let sequenceAction3 = SKAction.sequence([delayAction3, fadeInAction3])
        kickright.run(sequenceAction3)
        
        
        var ArrayNodesKickRight: [SKSpriteNode] = []
        for imageKickRight in
                [
                    "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
                    "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
                    "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
                    "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
                    "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
                    "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
                    "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
                    
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                    
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                    "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong"] {
            let nodeKickRight = SKSpriteNode(imageNamed: imageKickRight)
            ArrayNodesKickRight.append(nodeKickRight)
            self.addChild(nodeKickRight)
        }
        
        let kickRightSequence = SKAction.sequence([
            SKAction.run {
                for (index, nodeKickRight) in ArrayNodesKickRight.enumerated() {
                    let xStartPosition = 345
                    let yStartPosition = 890
                    
                    nodeKickRight.position = CGPoint(x: xStartPosition, y: yStartPosition)
                    nodeKickRight.setScale(CGFloat(1.1))
                    let moveAction = SKAction.move(to: CGPoint(x: 345, y: 100), duration: 1.6)
                    let resetPositionAction = SKAction.move(to: CGPoint(x: xStartPosition, y: yStartPosition), duration: 0)
                    let fadeInAction = SKAction.fadeIn(withDuration: 0)
                    let kickRightSequence = SKAction.sequence([SKAction.wait(forDuration: 0.2 * Double(index)), fadeInAction, moveAction, resetPositionAction])
                    nodeKickRight.run(kickRightSequence)
                }
            },
            SKAction.wait(forDuration: 63.4)
        ])
        let delay0 = SKAction.wait(forDuration: 3)
        let group0 = SKAction.sequence([delay0, kickRightSequence])
        self.run(group0)
        
        
        var ArrayNodesSnareLeft: [SKSpriteNode] = []
        
        for imageSnareLeft in [
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            
            
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong",
            
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",
            
        ] {
            let nodeSnareLeft = SKSpriteNode(imageNamed: imageSnareLeft)
            ArrayNodesSnareLeft.append(nodeSnareLeft)
            self.addChild(nodeSnareLeft)
            
        }
        
        let SnareLeftSequence = SKAction.sequence([
            SKAction.run {
                for (index, ArrayNodesSnareLeft) in ArrayNodesSnareLeft.enumerated() {
                    // Adjust the initial x and y values as needed
                    let xStartPosition = 145
                    let yStartPosition = 890
                    ArrayNodesSnareLeft.position = CGPoint(x: xStartPosition, y: yStartPosition)
                    ArrayNodesSnareLeft.setScale(CGFloat(1.1))
                    
                    // Create an action to change the x position of the image node to 200 over a duration of 1.6 seconds
                    let moveAction = SKAction.move(to: CGPoint(x: 145, y: 100), duration: 1.6)
                    
                    // Create an action to move the image back to the initial position
                    let resetPositionAction = SKAction.move(to: CGPoint(x: xStartPosition, y: yStartPosition), duration: 0)
                    
                    // Create a sequence to run actions one by one with a delay
                    let fadeInAction = SKAction.fadeIn(withDuration: 0) // Add this line
                    
                    let SnareLeftSequence = SKAction.sequence([SKAction.wait(forDuration: 0.2 * Double(index)), fadeInAction, moveAction, resetPositionAction])
                    
                    // Run the sequence action on the image node
                    ArrayNodesSnareLeft.run(SnareLeftSequence)
                }
            },
            SKAction.wait(forDuration: 63.4) // Wait for 2 seconds before repeating
        ])
        let delay1 = SKAction.wait(forDuration: 3)
        let group1 = SKAction.sequence([delay1, SnareLeftSequence])
        self.run(group1)
        
        
        
        
        
        
        
        var ArrayNodesSnareLeft1: [SKSpriteNode] = []
        
        for imageSnareLeft1 in [
            
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line",
            "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "kosong", "line"
            
        ] {
            let nodeSnareLeft1 = SKSpriteNode(imageNamed: imageSnareLeft1)
            ArrayNodesSnareLeft1.append(nodeSnareLeft1)
            nodeSnareLeft1.alpha = 0.2
            
            self.addChild(nodeSnareLeft1)
            
        }
        
        let SnareLeftSequence1 = SKAction.sequence([
            SKAction.run {
                for (index, ArrayNodesSnareLeft1) in ArrayNodesSnareLeft1.enumerated() {

                    let xStartPosition = 145
                    let yStartPosition = 840
                    ArrayNodesSnareLeft1.alpha = 0.0
                    ArrayNodesSnareLeft1.position = CGPoint(x: xStartPosition, y: yStartPosition)
                    ArrayNodesSnareLeft1.setScale(CGFloat(1.3))
                    
                    let moveAction = SKAction.move(to: CGPoint(x: 145, y: 100), duration: 1.5)
                    
                    
                    let resetPositionAction = SKAction.move(to: CGPoint(x: xStartPosition, y: yStartPosition), duration: 0)
                    
                    
                    let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
                    
                    
                    let SnareLeftSequence1 = SKAction.sequence([SKAction.wait(forDuration: 0.2 * Double(index)), fadeInAction, moveAction, resetPositionAction])
                    
                    
                    ArrayNodesSnareLeft1.run(SnareLeftSequence1)
                }
            },
            SKAction.wait(forDuration: 63.4)
        ])
        let delay2 = SKAction.wait(forDuration: 3)
        let group2 = SKAction.sequence([delay2, SnareLeftSequence1])
        self.run(group2)
        
        
        let barTop  = SKSpriteNode(imageNamed: "atas")
        barTop.setScale(CGFloat(1))
        barTop.position = CGPoint(x: 195, y: 1000)
            self.addChild(barTop)
        
        let movetop = SKAction.move(to: CGPoint(x: 195, y: 800), duration: 2)
        let delay3 = SKAction.wait(forDuration: 3)
        let group3 = SKAction.sequence([delay3, movetop])
        self.run(group3)
        
        barTop.run(group3)
        
            self.pauseButton = SKSpriteNode(imageNamed: "pause")
            self.pauseButton.setScale(CGFloat(0.5))
            self.pauseButton.position = CGPoint(x: 345, y: 1000)
        let movepause = SKAction.move(to: CGPoint(x: 345, y: 775), duration: 2)
            self.addChild(self.pauseButton)
        
        
        let delay4 = SKAction.wait(forDuration: 3)
        let group4 = SKAction.sequence([delay4, movepause])
        self.run(group4)
            self.pauseButton.run(group4)
        
        
        
        let logo  = SKSpriteNode(imageNamed: "supershylogo")
        logo.setScale(CGFloat(0.5))
        logo.position = CGPoint(x: 95, y: 975)
            self.addChild(logo)
        
        
        let movelogo = SKAction.move(to: CGPoint(x: 95, y: 775), duration: 2)
        let delay5 = SKAction.wait(forDuration: 3)
        let group5 = SKAction.sequence([delay5, movelogo])
        self.run(group5)
        logo.run(group5)
        
        
        let three = SKSpriteNode(imageNamed: "3")
        three.setScale(CGFloat(0.5))
        three.position = CGPoint(x: 200, y: 475)
        three.alpha = 0  // Initially hidden
        let delayThree = SKAction.wait(forDuration: 1)
        let fadeInThree = SKAction.fadeIn(withDuration: 1)
        let fadeOutThree = SKAction.fadeOut(withDuration: 0.1)
        let seq3 = SKAction.sequence([delayThree, fadeInThree, fadeOutThree])
        three.run(seq3)
            self.addChild(three)
        
        // "2" sprite
        let two = SKSpriteNode(imageNamed: "2")
        two.setScale(CGFloat(0.5))
        two.position = CGPoint(x: 200, y: 475)
        two.alpha = 0  // Initially hidden
        let delayTwo = SKAction.wait(forDuration: 2)
        let fadeInTwo = SKAction.fadeIn(withDuration: 1)
        let fadeOutTwo = SKAction.fadeOut(withDuration: 0.1)
        let seq2 = SKAction.sequence([delayTwo, fadeInTwo, fadeOutTwo])
        two.run(seq2)
            self.addChild(two)
        
        // "1" sprite
        let one = SKSpriteNode(imageNamed: "1")
        one.setScale(CGFloat(0.5))
        one.position = CGPoint(x: 200, y: 475)
        one.alpha = 0  // Initially hidden
        let delayOne = SKAction.wait(forDuration: 3)  // Adjust the delay as needed
        let fadeInOne = SKAction.fadeIn(withDuration: 1)
        let fadeOutOne = SKAction.fadeOut(withDuration: 0.1)
        let seq1 = SKAction.sequence([delayOne, fadeInOne, fadeOutOne])
        one.run(seq1)
            self.addChild(one)
        }
        ])
        self.run(gameplay)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        func pauseGame() {
            isGamePaused = true
            isPaused = true
            // Add any other logic needed when the game is paused, like showing a pause menu.
        }
        
        func resume() {
            isGameResume =  true
            isGamePaused = false
            countresume = true
            isPaused = false
            
            
            
            
            let three = SKSpriteNode(imageNamed: "3")
            three.setScale(CGFloat(0.5))
            three.position = CGPoint(x: 200, y: 475)
            three.alpha = 0  // Initially hidden
            let delayThree = SKAction.wait(forDuration: 1)
            let fadeInThree = SKAction.fadeIn(withDuration: 1)
            let fadeOutThree = SKAction.fadeOut(withDuration: 0.1)
            let seq3 = SKAction.sequence([delayThree, fadeInThree, fadeOutThree])
            three.run(seq3)
            addChild(three)
            
            // "2" sprite
            let two = SKSpriteNode(imageNamed: "2")
            two.setScale(CGFloat(0.5))
            two.position = CGPoint(x: 200, y: 475)
            two.alpha = 0  // Initially hidden
            let delayTwo = SKAction.wait(forDuration: 2)
            let fadeInTwo = SKAction.fadeIn(withDuration: 1)
            let fadeOutTwo = SKAction.fadeOut(withDuration: 0.1)
            let seq2 = SKAction.sequence([delayTwo, fadeInTwo, fadeOutTwo])
            two.run(seq2)
            addChild(two)
            
            // "1" sprite
            let one = SKSpriteNode(imageNamed: "1")
            one.setScale(CGFloat(0.5))
            one.position = CGPoint(x: 200, y: 475)
            one.alpha = 0  // Initially hidden
            let delayOne = SKAction.wait(forDuration: 3)  // Adjust the delay as needed
            let fadeInOne = SKAction.fadeIn(withDuration: 1)
            let fadeOutOne = SKAction.fadeOut(withDuration: 0.1)
            let seq1 = SKAction.sequence([delayOne, fadeInOne, fadeOutOne])
            one.run(seq1)
            addChild(one)
            
        }
        
        func restart() -> Void
        {
            //let transition = SKTransition.fade(with: .purple, duration: 15)
            let restartScene = GameScene()
            restartScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            restartScene.scaleMode = .fill
            self.view?.presentScene(restartScene)
        }
        
        
        for touch in touches {
            let location = touch.location(in: self)
            
            
            if pauseButton.contains(location) {
                // Ketika tombol pause ditekan, panggil fungsi pauseGame
                pauseGame()
                
                
                
                if isGamePaused == true {
                    
                    menuButton = SKSpriteNode(imageNamed: "menupause")
                    menuButton.setScale(CGFloat(0.5))
                    menuButton.position = CGPoint(x: 200, y: 475)
                    addChild(menuButton)
                    
                    backgroundMusic?.stop()
                    
                    resumeButton = SKSpriteNode(imageNamed: "resumebtn")
                    resumeButton.setScale(CGFloat(0.4))
                    resumeButton.position = CGPoint(x: 260, y: 440)
                    addChild(resumeButton)
                    
                    resetgameButton = SKSpriteNode(imageNamed: "restartbtn")
                    resetgameButton.setScale(CGFloat(0.4))
                    resetgameButton.position = CGPoint(x: 130, y: 440)
                    addChild(resetgameButton)
                    
                    
                }
                
            }
            
            if let resumeButton = resumeButton, resumeButton.contains(location) {
                resume()
                resumeButton.removeFromParent()
                menuButton.removeFromParent()
                resetgameButton.removeFromParent()
                backgroundMusic?.play()
            }
            if let resetgameButton = resetgameButton, resetgameButton.contains(location) {
                restart()
                resumeButton.removeFromParent()
                menuButton.removeFromParent()
                resetgameButton.removeFromParent()
                backgroundMusic?.stop()
            }
            
            
            
        }
    }
    
    
    
    
}



