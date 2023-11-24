//
//  GamePatternView2.swift
//  MacroCoba3
//
//  Created by Brian Putrantio on 23/11/23.
//

import SwiftUI
import SpriteKit
import AVFoundation
 


struct GamePatternView2: View{
    
    @Environment (\.dismiss) var dismiss
    @State private var isGameScenePresented = true
    
    
    var scene: SKScene {
        let scene = GameScenePattern2()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View{
//        GameViewPattern1(scene: scene, isPresented: $isGameScenePresented).edgesIgnoringSafeArea(.all)
//            .onDisappear(){
//                dismiss()
//            }
        SpriteView(scene: scene).edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    GamePatternView2()
}
                                                        
