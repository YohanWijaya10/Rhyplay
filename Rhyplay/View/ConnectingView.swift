//
//  ConnectingView.swift
//  Rhyplay
//
//  Created by Brian Putrantio on 13/11/23.
//

import SwiftUI
import Foundation
import AVFoundation
import Combine




struct ConnectingView: View {
    @StateObject var service = BluetoothService()
    @State private var isButtonHidden = false
    @State private var buttonoutlineColor_left: Color = Color("Pink")
    @State private var buttonoutlineColor_right: Color = Color("Pink")
    @State private var isFlashing_left = true
    @State private var isFlashing_right = true
    @State var kedip: CGFloat = 10
    @State var connectOK: Bool = false
    @State var blink: Double = 0.0
    @State private var audioPlayer: AVAudioPlayer?
    
    
    @State var bunyi = false
    @State private var isLeftConnected = false
    @State private var isRightConnected = false
    
    @State private var isFreeplayView = false
    
    @State private var isMainPageView = false
    
    // Properti AVAudioPlayer
    @State private var audioPlayer1: AVAudioPlayer?
    @State private var audioPlayer2: AVAudioPlayer?
    @State private var audioPlayer3: AVAudioPlayer?
    
    @State private var snareMinY: Double = 0.0
    @State private var snareMaxY: Double = 0.0
    @State private var snareDeltaY: Double = 0.0
    
    @State private var kickMinY: Double = 0.0
    @State private var kickMaxY: Double = 0.0
    @State private var kickDeltaY: Double = 0.0
    
    @State private var snareAvgY: Double = 0.0
    @State private var iterateY: Int = 0
    @State private var snare: String = "Snare1"
    @State private var kick: String = "Kick1"
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("Maroon").edgesIgnoringSafeArea(.all)
                
                Group {
                    Circle()
                        .fill(Color("Pink")).opacity(0.2)
                        .frame(width: 950, height: 950)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 945, height: 945)
                    
                    Circle()
                        .fill(Color("Pink")).opacity(0.4)
                        .frame(width: 750, height: 750)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 745, height: 745)
                    
                    Circle()
                        .fill(Color("Pink")).opacity(0.6)
                        .frame(width: 550, height: 550)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 545, height: 545)
                    
                    Circle()
                        .fill(Color("Pink")).opacity(0.8)
                        .frame(width: 350, height: 350)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 345, height: 345)
                    
                    Circle()
                        .fill(Color("Pink"))
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .fill(Color("Maroon"))
                        .frame(width: 145, height: 145)
                    
                } //Tampilan Lingkaran2 //Background
                
                VStack{
                    
                    Spacer()
                        .frame(height: 240)
                    
                    // Button Tangan Kiri
                    HStack{
                        if !isButtonHidden{
                            Button(action: {
                                isLeftConnected = true
                                service.connectToPeripheral2()
                                if isLeftConnected{
                                    print("Left Button Connected")
                                    
                                    
                                    //isFlashing_right.toggle()
                                    kedip = 20
                                }
                                else{
                                    print("Left Button DisConnected")
                                    buttonoutlineColor_left = Color.red
                                    
                                    
                                    
                                    isFlashing_left.toggle()
                                }
                            }) {
                                VStack{
                                    ZStack{
                                        if service.peripheralStatus2 !=  .connected{
                                            Image("Left Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color("Pink"), lineWidth: kedip)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                            
                                        } else{
                                            ///Connect jadi ijo
                                            Image("Left Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color.green, lineWidth: 10)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                        }
                                        
                                    }
                                    
                                    if service.peripheralStatus2 != .connected {
                                        if isLeftConnected == true{
                                            Text("Connecting...")
                                                .foregroundColor(.white)
                                        }
                                        else{
                                            Text("Left Gloves")
                                                .foregroundColor(.white)
                                        }
                                    }else{
                                        Text("Connected")
                                            .foregroundColor(.white)
                                        
                                        
                                        
                                    }
                                    if service.peripheralStatus == .connected {
                                        
                                    }
                                }
                            }
                        }
                        else{
                            Spacer()
                        }
                        
                        Spacer().frame(width: 150)
                    }
                    
                    Spacer()
                    
                    //Icon Bluetooth di tengah
                    VStack{
                        Image("Bluetooth Icon")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .foregroundColor(Color("Pink"))
                    }
                    
                    Spacer()
                    
                    // Button Tangan Kanan
                    HStack{
                        Spacer().frame(width: 150)
                        
                        if !isButtonHidden{
                            Button(action: {
                                isRightConnected = true
                                service.connectToPeripheral()
                                if isRightConnected{
                                    print("right Button Connected")
                                    
                                    
                                    //isFlashing_right.toggle()
                                    kedip = 20
                                }
                                else{
                                    print("right Button DisConnected")
                                    buttonoutlineColor_right = Color.red
                                    
                                    
                                    
                                    isFlashing_right.toggle()
                                }
                            }) {
                                VStack{
                                    ZStack{
                                        if service.peripheralStatus !=  .connected{
                                            Image("Right Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color("Pink"), lineWidth: kedip)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                            
                                        } else{
                                            Image("Right Hand Icon")
                                                .resizable()
                                                .frame(width: 65, height: 65) //size gambar tangan
                                                .frame(width: 115, height: 115) // size button lingkaran
                                                .foregroundColor(Color.black)
                                                .background(Color("Pink"))
                                                .clipShape(Circle())
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 115)
                                                        .stroke(Color.green, lineWidth: 10)
                                                        .opacity(blink)
                                                        .task(){
                                                            let baseAnimation = Animation.easeInOut(duration: 2)
                                                            let repeated = baseAnimation.repeatForever(autoreverses: true)
                                                            
                                                            withAnimation(repeated) {
                                                                blink = 1
                                                            }
                                                            blink = 1
                                                        }
                                                )
                                            
                                        }
                                        
                                    }
                                    if service.peripheralStatus != .connected {
                                        if isRightConnected == true{
                                            Text("Connecting...")
                                                .foregroundColor(.white)
                                        }
                                        else{
                                            Text("Right Gloves")
                                                .foregroundColor(.white)
                                        }
                                    }else{
                                        Text("Connected")
                                            .foregroundColor(.white)
                                        
                                        
                                        
                                    }
                                    if service.peripheralStatus == .connected {
                                        
                                    }
                                    
                                }
                            }
                        }
                        else{
                            Spacer()
                        }
                    }
                    
                    Spacer()
                        .frame(height: 240)
                    
                }
                
                VStack {
                    Spacer()
                        .frame(height: 785)
                    
                    
                    // button next buat ke halaman selanjutnya setelah connect
                    if service.peripheralStatus == .connected {
                        //MARK: Button ke Pattern
                        NavigationLink(destination: MainPageView(bunyi: $bunyi).environmentObject(service).navigationBarHidden(true)) {
                            ZStack{
                                Text("Continue")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 350, height: 40)
                                    .background(Color("Pink"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 3)
                                    )
                                    .cornerRadius(10)
                            }
                        }
                        
                        .padding()
                        
                        
                    }
                    
                    Spacer()
                }
                
                
                
            }.onAppear(){
                service.isScanning = true
                service.isScanning2 = true
                
            }
            
        }
    }
    
    func playSound(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                if audioPlayer == nil {
                    audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                    audioPlayer?.volume = 1
                }
                if audioPlayer!.isPlaying {
                    audioPlayer?.pause()
                }
                audioPlayer?.currentTime = 0
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    func playSound1(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                if audioPlayer1 == nil {
                    audioPlayer1 = try AVAudioPlayer(contentsOf: soundURL)
                }

                audioPlayer1?.volume = 1
                audioPlayer1?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    func playSound2(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                if audioPlayer2 == nil {
                    audioPlayer2 = try AVAudioPlayer(contentsOf: soundURL)
                }

                audioPlayer2?.volume = 1
                audioPlayer2?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    func playSound3(fileName: String, fileExtension: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                if audioPlayer3 == nil {
                    audioPlayer3 = try AVAudioPlayer(contentsOf: soundURL)
                }

                audioPlayer3?.volume = 1
                audioPlayer3?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ConnectingView()
}
