//
//  ContentView.swift
//  Sprite
//
//  Created by Yohan Wijaya on 08/11/23.
//

import SwiftUI
import SpriteKit
import AVFoundation

import Combine

struct ContentView: View {
    @Binding var bunyi: Bool
    @State var shouldNavigate: Bool = false
    @State var kotak: Bool = false
    @State private var closedd = false
    @State private var nyoba = "scene"
    @State private var gameScore: Int = 0
    @EnvironmentObject var service: BluetoothService

    var body: some View {
        NavigationView {
            ZStack {
                SpriteView(scene: makeGameScene())
                    .edgesIgnoringSafeArea(.all)

                HStack {
                    Text("\(service.SnareV)")
                    Text("\(service.Bass1)")
                }

                if kotak {
                    Rectangle()
                }
            }
        }
        .onAppear {
            bunyi = true
        }
    }

    private func makeGameScene() -> GameScene {
        let scene = GameScene()

        scene.snarev = service.SnareV
        scene.closeds = kotak // Assign the value instead of modifying state
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill

        return scene
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bunyi: .constant(false))
    }
}
#endif

