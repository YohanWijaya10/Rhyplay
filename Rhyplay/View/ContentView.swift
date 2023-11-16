//
//  ContentView.swift
//  Sprite
//
//  Created by Yohan Wijaya on 08/11/23.
//

import SwiftUI
import SpriteKit
import AVFoundation



struct ContentView: View {
    @Binding var bunyi : Bool

    @State private var timeRemaining: Double = 10.0
    @State private var touch: Bool = false
    @State private var touch2: Bool = false
    @State private var isAnimating = false
    @State private var note1Alpha: Double = 1.0
    @State var noteArray: [SKSpriteNode] = []
    @State var ArrayNodesKickRight: [SKSpriteNode] = []
    @State private var offsetY: CGFloat = -100
    @State private var closedd = false
    @State private var nyoba = "scene"
    @State private var gameScore: Int = 0
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Text("hai brian")
                if closedd == false {
                    SpriteView(scene: scene)
                        .edgesIgnoringSafeArea(.all)
                }else{
                   
                    
                }
                
                
                VStack{
//                    HStack{
//                        Spacer()
//                        Text("X")
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(Color.white)
//                            .padding()
//                            .onTapGesture {
//                                closedd = true
//                            }
//                        
//                    }
                    Spacer()
                }
                
                
                
                
                
                
            }.onAppear(){
                bunyi = true
            }
        }
    }
}


#Preview {
    ContentView(bunyi: .constant(false))
}
