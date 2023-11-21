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
    
    @Environment (\.dismiss) var dismiss
        @State private var isButtonVisible = false
        @State private var isGameScenePresented = false

    var scene: SKScene {
        let scene = GameScene()
        scene.snarev = service.SnareV
        scene.closeds = kotak // Assign the value instead of modifying state
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .fill

        return scene
      }
      
      var body: some View {
          NavigationView {
              ZStack{
                  Text("hai brian")
                  if isGameScenePresented == true {
                      //                    SpriteView(scene: scene)
                      //                        .edgesIgnoringSafeArea(.all)
                      
                      GameView(scene: scene, isPresented: $isGameScenePresented).edgesIgnoringSafeArea(.all)
                          .onDisappear(){
                              dismiss()
                          }
                  }else{
                      SpriteView(scene: scene, isPaused: true)
                      
                  }
                  
                  
                  VStack{
                      HStack{
                          Spacer()
                          //                        Text("X")
                          //                            .font(.title)
                          //                            .fontWeight(.bold)
                          //                            .foregroundColor(Color.white)
                          //                            .padding()
                          //                            .onTapGesture {
                          //                                closedd = true
                          //                            }
  //                        if isButtonVisible == true{
  //                            Button {
  //                                closedd = true
  //                                dismiss()
  //                            } label: {
  //                                Text("X")
  //                                    .font(.title)
  //                                    .fontWeight(.bold)
  //                                    .foregroundColor(Color.white)
  //                                    .padding()
  //                                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
  //                            }
  //                        }
                          
                          /*
                           VStack{Button(action: {
                           DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // 1 sec delay
                           self.player.requestCard()
                           }
                           }, label: {
                           Text("Hit Me!")
                           })
                           */
                          
                      }
                      Spacer()
                  }
                  
                  
                  
                  
                  
                  
              }.onAppear(){
                  bunyi = true
              }
          }
          .onAppear {
              // Add a delay of 2 seconds (adjust the duration as needed)
              DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                  withAnimation {
                      isButtonVisible = true
                  }
              }
              
              isGameScenePresented = true
          }
      }
  }


  #Preview {
      ContentView(bunyi: .constant(false))
  }

