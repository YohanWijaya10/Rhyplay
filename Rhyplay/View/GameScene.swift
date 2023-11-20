//
//  GameScene.swift
//  songSprite
//
//  Created by Yohan Wijaya on 10/11/23.
//

import Foundation
import SpriteKit
import AVFoundation
import SwiftUI


class GameScene: SKScene {
    var snarev1: Double = 0.0
    var snarev: Double = 0.0{
        didSet {
            
            snarev1 = snarev
            
            
        }
    }
    
    var myLabel: SKLabelNode!
    
    var snar = ContentView(bunyi: .constant(true))
    var closeds: Bool =  false
    var isGamePaused = false
    var pauseButton: SKSpriteNode!
    var btnRetryEnding: SKSpriteNode!
    var backgroundMusic: AVAudioPlayer?
    var resumeButton: SKSpriteNode!
    var menuButton: SKSpriteNode!
    
    var isGameResume = false
    var resetgameButton: SKSpriteNode!
    var countresume = false
    var worldNode:SKNode?
    var gameplay: SKAction!
    var pausenode: SKEmitterNode!
    var pose: SKEmitterNode!
    var btnclose: SKSpriteNode!
    var ArrayNodesKickRight: [SKSpriteNode] = []
    
    var logOutput: String = "" {
        didSet {
            // Setelah logOutput diubah, update variabel copy
            copy = logOutput
            
        }
    }
    
    
    
    var copy: String = ""
    
    
    
    
    var point: Int = 0 {
        didSet {
            // Kode yang akan dijalankan setiap kali nilai point berubah
            updateLabel()
            star()
        }
    }
    
    
    
    
    
    var press: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        print(snarev1)
        
        backgroundColor = .black
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
                        self.backgroundMusic?.volume = 0.1
                        
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
                let fadeOutFire = SKAction.wait(forDuration: 65)
                let toZero = SKAction.fadeAlpha(to: 0.0, duration: 1)
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
            let skView = SKView()
            skView.showsFPS = true
            skView.ignoresSiblingOrder = true
            
            
            let confettiAction = SKAction.run {
                if let confeti = SKEmitterNode(fileNamed: "m.sks"){
                    confeti.position = CGPoint(x: 200, y: 890)
                    self.addChild(confeti)
                    let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 0.5)
                    let waitOut = SKAction.wait(forDuration: 3)
                    let fadeOut = SKAction.fadeAlpha(to: 0.0, duration: 1)
                    let groupconfeti = SKAction.sequence([fadeIn ,waitOut, fadeOut])
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
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",//32
                        
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",
                        "bar1", "kosong", "bar1", "kosong", "bar1", "kosong", "bar1", "kosong",//36
                        
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong",//16
                        "bar1", "kosong", "kosong", "kosong", "kosong", "bar1", "kosong", "kosong"] {
                let nodeKickRight = SKSpriteNode(imageNamed: imageKickRight)
                ArrayNodesKickRight.append(nodeKickRight)
                self.addChild(nodeKickRight)
                
            }
            
            let kickRightSequence = SKAction.sequence([
                SKAction.run {
                    for (index, nodeKickRight) in ArrayNodesKickRight.enumerated() {
                        let waitAction = SKAction.wait(forDuration: 0.2 * Double(index))
                        
                        let printAction = SKAction.run {
                            if let textureName = nodeKickRight.texture?.description {
                                let components = textureName.components(separatedBy: "'")
                                if components.count > 1 {
                                    self.logOutput = components[1]
                                    if !components[1].contains("kosong") {
                                        // Increment point only if the texture name does not contain "kosong"
                                        self.point += 1
                                    }
                                    print(self.point)
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                            }
                        }
                        
                        let xStartPosition = 345
                        let yStartPosition = 890
                        
                        nodeKickRight.position = CGPoint(x: xStartPosition, y: yStartPosition)
                        nodeKickRight.setScale(CGFloat(1.1))
                        let moveAction = SKAction.move(to: CGPoint(x: 345, y: 100), duration: 1.6)
                        let resetPositionAction = SKAction.move(to: CGPoint(x: xStartPosition, y: yStartPosition), duration: 0)
                        let fadeInAction = SKAction.fadeIn(withDuration: 0)
                        
                        let kickRightSequence = SKAction.sequence([waitAction, printAction, fadeInAction, moveAction, resetPositionAction])
                        
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
                "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong", //32
                
                
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
                "kosong", "kosong", "bar2", "kosong", "kosong", "kosong", "bar2", "kosong",//16
                
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
            
            
            let score = SKSpriteNode(imageNamed: "bg")
            score.scale(to: CGSize(width: self.size.width, height: self.size.height))
            score.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            score.alpha = 0  // Initially hidden
            let delayScore = SKAction.wait(forDuration: 68)
            let fadeInScore = SKAction.fadeIn(withDuration: 1)
            
            let seqScore = SKAction.sequence([delayScore, fadeInScore])
            score.run(seqScore)
            self.addChild(score)
            
            
            
            let scoreconfeti = SKSpriteNode(imageNamed: "confetti 1")
            scoreconfeti.scale(to: CGSize(width: self.size.width, height: self.size.height))
            scoreconfeti.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            scoreconfeti.alpha = 0  // Initially hidden
            let delayScore1 = SKAction.wait(forDuration: 69)
            let fadeInScore1 = SKAction.fadeIn(withDuration: 2)
            
            let seqScore1 = SKAction.sequence([delayScore1, fadeInScore1])
            scoreconfeti.run(seqScore1)
            self.addChild(scoreconfeti)
            
            
            
            let waitAction10 = SKAction.wait(forDuration: 1)
            let addLabelAction10 = SKAction.run {
            self.addLabelToScene()
            }
            let sequenceAction10 = SKAction.sequence([waitAction10, addLabelAction10])
            self.run(sequenceAction10)
            
            
            
            self.btnRetryEnding = SKSpriteNode(imageNamed: "pause")
            self.btnRetryEnding.setScale(CGFloat(0.4))
            self.btnRetryEnding.position =  CGPoint(x: 260, y: 440)
            self.btnRetryEnding.alpha = 0  // Initially hidden
            let delaybtnRetryEnding = SKAction.wait(forDuration: 1)
            let fadeInbtnRetryEnding = SKAction.fadeIn(withDuration: 2)
            
            let seqbtnRetryEnding = SKAction.sequence([delaybtnRetryEnding, fadeInbtnRetryEnding])
            self.btnRetryEnding.run(seqbtnRetryEnding)
            self.addChild(self.btnRetryEnding)
            
            
        }
                                      ])
        self.run(gameplay)
    }
    func updateLabel() {
            // Check if myLabel is not nil before updating its text
            if let myLabel = myLabel {
                myLabel.text = "Perfect Beat : \(self.point) / 80"
                print("Point updated: \(self.point)")
            } else {
                print("myLabel is nil. Make sure it is properly initialized.")
            }
    }
    
    func addLabelToScene() {
        
        
        self.myLabel = SKLabelNode(fontNamed: "Arial")
        self.myLabel.text = "Perfect Beat : \(self.point) / 80"
        self.myLabel.fontSize = 25
        self.myLabel.fontColor = SKColor.white
        self.myLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(self.myLabel)

        }
    
    func star() {
        // Buat SKSpriteNode untuk menampilkan gambar
        let imageNode = SKSpriteNode()

        if self.point == 80 {
            // Tampilkan gambar 1
            imageNode.texture = SKTexture(imageNamed: "star")
        } else if self.point > 50 {
            // Tampilkan gambar 2
            imageNode.texture = SKTexture(imageNamed: "star")
        } else {
            // Tampilkan gambar 3
            imageNode.texture = SKTexture(imageNamed: "star")
        }

        // Atur posisi gambar
        imageNode.setScale(0.4)
            imageNode.position = CGPoint(x: 260, y: 440)

            // Tambahkan gambar ke scene dengan skala dan posisi awal
            self.addChild(imageNode)
            
            // Setelah 70 detik, jalankan aksi untuk mengubah skala dan posisi gambar
            let waitAction = SKAction.wait(forDuration: 70)
            let scaleAction = SKAction.scale(to: 1.0, duration: 0.5)  // Ganti 1.0 dengan skala yang diinginkan setelah 70 detik
            let moveAction = SKAction.move(to: CGPoint(x: 400, y: 300), duration: 0.5)  // Ganti posisi dengan yang diinginkan setelah 70 detik
            
            let sequenceAction = SKAction.sequence([waitAction, SKAction.group([scaleAction, moveAction])])
            
            imageNode.run(sequenceAction)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
       
        func pauseGame() {
            isGamePaused = true
            isPaused = true
            closeds =  true
            // Add any other logic needed when the game is paused, like showing a pause menu.
        }
        func asu() {
            closeds = true
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
            
            if let btnRetryEnding = btnRetryEnding, btnRetryEnding.contains(location){
                
                
                
                
            }
            
            
            
            
            
        }
    }
    
    
    
    
}



