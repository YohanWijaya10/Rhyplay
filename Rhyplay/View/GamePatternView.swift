//
//  GamePatternView.swift
//  Rhyplay
//
//  Created by Yohan Wijaya on 23/11/23.
//

import SwiftUI
import SpriteKit
import AVFoundation
 

struct GamePatternView: View{
    
  
    
    @Binding var bunyi: Bool
    @State var shouldNavigate: Bool = false
    @State var kotak: Bool = false
    @State private var closedd = false
    @State private var nyoba = "scene"
    @State private var gameScore: Int = 0
    @EnvironmentObject var service: BluetoothService
    
    @Environment (\.dismiss) var dismiss
        @State private var isButtonVisible = false
        @State private var isGameScenePresented = true
    
    var scene: SKScene {
        let scene = GameScenePattern1(bluetoothService: service, size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.snarev = service.SnareV
        scene.closeds = kotak
        scene.scaleMode = .aspectFit

        return scene
      }
    
    var body: some View{
        if isGameScenePresented == true {
            GameViewPattern1(scene: scene, isPresented: $isGameScenePresented).edgesIgnoringSafeArea(.all)
                .onDisappear(){
                    dismiss()
                }
        }
//        SpriteView(scene: scene).edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GamePatternView(bunyi: .constant(false))
}
