//
//  GameScenePattern2.swift
//  MacroCoba3
//
//  Created by Brian Putrantio on 23/11/23.
//

import Foundation
import SpriteKit
import AVFoundation
import SwiftUI

class GameScenePattern2: SKScene {
    
    var isGamePaused = false
    var pauseButton: SKSpriteNode!
    var closeButton: SKSpriteNode!
    var RetryButton: SKSpriteNode!
    var BacktoSongButton: SKSpriteNode!
    var backgroundMusic: AVAudioPlayer?
    var resetgameButton1: SKSpriteNode!

    
    var logosementara: SKSpriteNode!
    var resumeButton: SKSpriteNode!
    var menuButton: SKSpriteNode!
    var isGameResume = false
    var resetgameButton: SKSpriteNode!
    var countresume = false
    var worldNode:SKNode?
    var gameplay: SKAction!
    var pausenode: SKEmitterNode!
    var myLabel: SKLabelNode!
    var failLabel: SKLabelNode!

    
    func addLabelToScene() {
        
        
        self.myLabel = SKLabelNode(fontNamed: "Arial")
        self.myLabel.text = "Perfect Beat :  70 / 72"
        self.myLabel.fontSize = 25
        self.myLabel.fontColor = SKColor.white
        self.myLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(self.myLabel)
        
        self.failLabel = SKLabelNode(fontNamed: "Arial")
        self.failLabel.text = "Miss Beat : 2"
        self.failLabel.fontSize = 25
        self.failLabel.fontColor = SKColor.white
        self.failLabel.position = CGPoint(x: 200, y:  380)
        self.addChild(self.failLabel)
        
    }
    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .black
        scaleMode = .aspectFill
        
        worldNode = SKNode()
        self.addChild(self.worldNode!)
        
        gameplay = SKAction.sequence([SKAction.run {
            //MARK: Music Player
            if let musicURL = Bundle.main.url(forResource: "on the floor with cajon sound", withExtension: "mp3") {
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
            
            //MARK: Background
            let background = SKSpriteNode(imageNamed: "background")
            background.scale(to: CGSize(width: self.size.width, height: self.size.height))
            background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            self.addChild(background)
            
            
            
            
            //MARK: Effect Api
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
            
            //MARK: Confetti pas selesai
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
            
            let waitAction = SKAction.wait(forDuration: 23.0)
            let confettiSequence = SKAction.sequence([waitAction, confettiAction])
            self.run(confettiSequence)
            
            //MARK: Lingkaran dibawah
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
            
            //MARK: Play
            var ArrayNodesSnareLeft: [SKSpriteNode] = []
            
            for imageSnareLeft in [
                "kosong", "kosong", "kosong", "kosong",
                "kosong", "kosong", "kosong", "kosong",
                "kosong", "kosong", "kosong", "kosong",
                
                "kosong", "kosong", "kosong", "kosong",
                "kosong", "kosong", "kosong", "kosong",
                "kosong", "kosong", "kosong", "kosong",
                "kosong", "kosong", "kosong", "kosong",
                
               
                "kosong", "bar2", "kosong", "bar2",
                "kosong", "bar2", "kosong", "bar2",
                "kosong", "bar2", "kosong", "bar2",
                "kosong", "bar2", "kosong", "bar2"


                
                
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
                        let moveAction = SKAction.move(to: CGPoint(x: 145, y: 100), duration: 1.856)
                        
                        // Create an action to move the image back to the initial position
                        let resetPositionAction = SKAction.move(to: CGPoint(x: xStartPosition, y: yStartPosition), duration: 0)
                        
                        // Create a sequence to run actions one by one with a delay
                        let fadeInAction = SKAction.fadeIn(withDuration: 0) // Add this line
                        
                        let SnareLeftSequence = SKAction.sequence([SKAction.wait(forDuration: 0.464 * Double(index)), fadeInAction, moveAction, resetPositionAction])
                        
                        // Run the sequence action on the image node
                        ArrayNodesSnareLeft.run(SnareLeftSequence)
                    }
                },
                SKAction.wait(forDuration: 22.152) // Wait for 2 seconds before repeating
            ])
            let delay1 = SKAction.wait(forDuration: 3)
            let group1 = SKAction.sequence([delay1, SnareLeftSequence])
            self.run(group1)
            
            
            var ArrayNodesKickRight: [SKSpriteNode] = []
            for imageKickRight in
                    [
                        "kosong", "kosong", "kosong", "kosong",
                        "kosong", "kosong", "kosong", "kosong",
                        "kosong", "kosong", "kosong", "kosong",
                        "bar1", "bar1", "bar1", "bar1",
                        
                        
                        "bar1", "bar1", "bar1", "bar1",
                        "bar1", "bar1", "bar1", "bar1",
                        "bar1", "bar1", "bar1", "bar1",
                        "bar1", "bar1", "bar1", "bar1",
                        
                        "bar1", "bar1", "bar1", "bar1",
                        "bar1", "bar1", "bar1", "bar1",
                        "bar1", "bar1", "bar1", "bar1",
                        "kosong", "kosong", "kosong", "kosong",
                        
                        ] {
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
                        let moveAction = SKAction.move(to: CGPoint(x: 345, y: 100), duration: 1.856)
                        let resetPositionAction = SKAction.move(to: CGPoint(x: xStartPosition, y: yStartPosition), duration: 0)
                        let fadeInAction = SKAction.fadeIn(withDuration: 0)
                        let kickRightSequence = SKAction.sequence([SKAction.wait(forDuration: 0.464 * Double(index)), fadeInAction, moveAction, resetPositionAction])
                        nodeKickRight.run(kickRightSequence)
                    }
                },
                SKAction.wait(forDuration: 22.152)
            ])
            let delay0 = SKAction.wait(forDuration: 3)
            let group0 = SKAction.sequence([delay0, kickRightSequence])
            self.run(group0)
            
            
            var ArrayNodesSnareLeft1: [SKSpriteNode] = []
            
            for imageSnareLeft1 in [
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line",
                
                
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line",
                
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line",
                "kosong", "kosong", "kosong", "line"
                
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
                        
                        let moveAction = SKAction.move(to: CGPoint(x: 145, y: 100), duration: 1.856)
                        
                        
                        let resetPositionAction = SKAction.move(to: CGPoint(x: xStartPosition, y: yStartPosition), duration: 0)
                        
                        
                        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
                        
                        
                        let SnareLeftSequence1 = SKAction.sequence([SKAction.wait(forDuration: 0.464 * Double(index)), fadeInAction, moveAction, resetPositionAction])
                        
                        
                        ArrayNodesSnareLeft1.run(SnareLeftSequence1)
                    }
                },
                SKAction.wait(forDuration: 22.152)
            ])
            let delay2 = SKAction.wait(forDuration: 1.6)
            let group2 = SKAction.sequence([delay2, SnareLeftSequence1])
            self.run(group2)
            
            //MARK: Top Bar
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
            self.pauseButton.position = CGPoint(x: 300, y: 1000)
            let movepause = SKAction.move(to: CGPoint(x: 300, y: 775), duration: 2)
            self.addChild(self.pauseButton)
            
            self.closeButton = SKSpriteNode(imageNamed: "end")
            self.closeButton.setScale(CGFloat(1))
            self.closeButton.position = CGPoint(x: 345, y: 1000)
            let moveclose = SKAction.move(to: CGPoint(x: 345, y: 775), duration: 2)
            self.addChild(self.closeButton)
            
            
            let delay4 = SKAction.wait(forDuration: 3)
            let group4 = SKAction.sequence([delay4, movepause])
            self.run(group4)
            self.pauseButton.run(group4)
            
            let delayclose = SKAction.wait(forDuration: 3)
            let groupclose = SKAction.sequence([delayclose, moveclose])
            self.run(groupclose)
            self.closeButton.run(groupclose)
            
            let logo  = SKSpriteNode(imageNamed: "PatternTitle2")
            logo.setScale(CGFloat(0.35))
            logo.position = CGPoint(x: 100, y: 975)
            self.addChild(logo)
            
            
            let movelogo = SKAction.move(to: CGPoint(x: 100, y: 775), duration: 2)
            let delay5 = SKAction.wait(forDuration: 3)
            let group5 = SKAction.sequence([delay5, movelogo])
            self.run(group5)
            logo.run(group5)
            
            
            //MARK: Hitung mundur
            // "3" sprite
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
            let delayScore = SKAction.wait(forDuration: 25)
            let fadeInScore = SKAction.fadeIn(withDuration: 1)
            
            let seqScore = SKAction.sequence([delayScore, fadeInScore])
            score.run(seqScore)
            self.addChild(score)
            
            let scoreconfeti = SKSpriteNode(imageNamed: "confetti 1")
            scoreconfeti.scale(to: CGSize(width: self.size.width, height: self.size.height))
            scoreconfeti.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            scoreconfeti.alpha = 0  // Initially hidden
            let delayScore1 = SKAction.wait(forDuration: 25)
            let fadeInScore1 = SKAction.fadeIn(withDuration: 2)
            
            let seqScore1 = SKAction.sequence([delayScore1, fadeInScore1])
            scoreconfeti.run(seqScore1)
            self.addChild(scoreconfeti)
            
            
            self.logosementara = SKSpriteNode(imageNamed: "OnTheFlorWin")
            self.logosementara.setScale(CGFloat(1))
            self.logosementara.position =  CGPoint(x: 190, y: 620)
            self.logosementara.alpha = 0  // Initially hidden
            let delaylogosementara = SKAction.wait(forDuration: 25)
            let fadelogosementara = SKAction.fadeIn(withDuration: 2)
            
            
            let seqlogosementara = SKAction.sequence([delaylogosementara, fadelogosementara])
            self.logosementara.run(seqlogosementara)
            self.addChild(self.logosementara)

      
            
            self.resetgameButton1 = SKSpriteNode(imageNamed: "retry")
            self.resetgameButton1.setScale(CGFloat(0.33))
            self.resetgameButton1.position = CGPoint(x: 115, y: 70)
            self.resetgameButton1.alpha = 0
            let delayreset = SKAction.wait(forDuration: 25)
            let fadeDelay = SKAction.fadeIn(withDuration: 2)
            
            let seqreset = SKAction.sequence([delayreset, fadeDelay])
            self.resetgameButton1.run(seqlogosementara)
            self.addChild(self.resetgameButton1)
            
            
            let waitAction10 = SKAction.wait(forDuration: 25)
            let addLabelAction10 = SKAction.run {
                self.addLabelToScene()
            }
            
            let sequenceAction10 = SKAction.sequence([waitAction10, fadeInScore1 , addLabelAction10])
            self.run(sequenceAction10)
            
            
            self.BacktoSongButton = SKSpriteNode(imageNamed: "BackSongs")
            self.BacktoSongButton.setScale(CGFloat(0.33))
            self.BacktoSongButton.position = CGPoint(x: 280, y: 70)
            self.BacktoSongButton.alpha = 0
            let delayBacktoSongs = SKAction.wait(forDuration: 24)
            let fadeInBacktoSongs = SKAction.fadeIn(withDuration: 2)
            let groupBacktoSongs = SKAction.sequence([delayBacktoSongs, fadeInBacktoSongs])
            self.BacktoSongButton.run(groupBacktoSongs)
            self.addChild(self.BacktoSongButton)
            
            
            
            
        }])
        
        self.run(gameplay)
    }
    
    func closeGame() {
        isHidden = true
        backgroundMusic?.stop()
        self.inputViewController?.dismiss(animated: true)
        view?.window?.rootViewController?.dismiss(animated: true, completion: nil)
        print("test")
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        func closeGame() {
            isHidden = true
            backgroundMusic?.stop()
            
            GameScenePattern2().inputViewController?.dismiss(animated: true)
            // Dismiss the scene
            view?.window?.rootViewController?.dismiss(animated: true, completion: nil)
            print("test")
        }
        
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
            
            
            
            // "3" sprite
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
            let restartScene = GameScenePattern2()
            restartScene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            restartScene.scaleMode = .fill
            self.view?.presentScene(restartScene)
        }
        
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if let closeButton = closeButton , closeButton.contains(location) {
                // Ketika tombol pause ditekan, panggil fungsi pauseGame
                closeGame()
                
            }
            
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

// UIViewControllerRepresentable for SpriteKit integration
struct GameViewPattern2: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    class Coordinator: NSObject {
        var parent2: GameViewPattern2
        var isPresented: Binding<Bool>
        
        init(parent2: GameViewPattern2, isPresented: Binding<Bool>) {
            self.parent2 = parent2
            self.isPresented = isPresented
        }
        
        @objc func endGame() {
            // Handle any clean-up or game-ending logic here
            isPresented.wrappedValue = false
            if let gameScene = parent2.scene as? GameScenePattern2 {
                gameScene.closeGame()
            }
        }
    }
    
    var scene: SKScene
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let skView = SKView()
//        viewController.view = skView
        skView.presentScene(scene)
        
        // Create a button to end the game
        let endButton = UIButton(type: .system)
        endButton.setImage(UIImage(named: "end"), for: .normal)
        endButton.contentMode = .scaleAspectFit
        endButton.tintColor = .white
        endButton.layer.opacity = 0.5
        endButton.isHidden = true
        endButton.addTarget(context.coordinator, action: #selector(Coordinator.endGame), for: .touchUpInside)
        viewController.view.addSubview(endButton)
        
        // Layout button (you may want to customize this based on your needs)
        endButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            endButton.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor, constant: 149),
            endButton.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor, constant: -352),
            endButton.widthAnchor.constraint(equalToConstant: 40), // Adjust the width as needed
            endButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // Adjust the delay duration as needed
            endButton.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 68) { // Adjust the delay duration as needed
            endButton.isHidden = true
        }
        
        // Create a button to BacktoSongs
        let BacktoSongButton = UIButton(type: .custom)
        BacktoSongButton.setImage(UIImage(named: "BackSongs"), for: .normal)
        BacktoSongButton.contentMode = .scaleAspectFit
        BacktoSongButton.tintColor = .pink
        BacktoSongButton.isHidden = true
        BacktoSongButton.addTarget(context.coordinator, action: #selector(Coordinator.endGame), for: .touchUpInside)
        viewController.view.addSubview(BacktoSongButton)
        
        // Layout button (you may want to customize this based on your needs)
        BacktoSongButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            BacktoSongButton.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor, constant: 80),
            BacktoSongButton.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor, constant: 353),
            BacktoSongButton.widthAnchor.constraint(equalToConstant: 163), // Adjust the width as needed
            BacktoSongButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 27) { // Adjust the delay duration as needed
            UIView.animate(withDuration: 2.0) {
                BacktoSongButton.isHidden = false
                BacktoSongButton.alpha = 1.0
            }
        }
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent2: self, isPresented: $isPresented)
    }
}

