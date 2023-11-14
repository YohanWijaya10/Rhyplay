//
//  ContentView.swift
//  Sprite
//
//  Created by Yohan Wijaya on 08/11/23.
//

import SwiftUI
import SpriteKit
import AVFoundation



class AudioPlayerViewModel: ObservableObject {
    private var audioPlayer: AVAudioPlayer?
    
    func playAudio() {
        guard let path = Bundle.main.path(forResource: "supershydrum", ofType: "mp3") else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
//            audioPlayer?.play()
        } catch {
            print("Gagal memutar audio: \(error.localizedDescription)")
        }
    }
}

struct ContentView: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    @State private var timeRemaining: Double = 10.0
    @State private var touch: Bool = false
    @State private var touch2: Bool = false
    @State private var isAnimating = false
    @State private var note1Alpha: Double = 1.0
    @State var noteArray: [SKSpriteNode] = []
    @State var ArrayNodesKickRight: [SKSpriteNode] = []
    @State private var offsetY: CGFloat = -100
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        ZStack{
            VStack{
                SpriteView(scene: scene)
                    .edgesIgnoringSafeArea(.all)
                
                
            }

        }.onAppear(){
//                        audioPlayerViewModel.playAudio()
        }
    }
}


#Preview {
    ContentView()
}
