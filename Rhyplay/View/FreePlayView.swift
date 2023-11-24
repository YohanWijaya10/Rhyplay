//
//  FreePlayMain.swift
//  Ragnaröcker
//
//  Created by Timothyus Kevin Dewanto on 17/10/23.
//

import SwiftUI
import Combine
struct FreePlayView: View {
    @Binding var bunyi : Bool
    @State private var isHighlightingLeftSnare = false
    @State private var isHighlightingRightSnare = false
    @State private var isHighlightingLeftKick = false
    @State private var isHighlightingRightKick = false
    @EnvironmentObject var service: BluetoothService
    @State private var pointku = 0
    @State private var pointku1 = 0
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack{
                //MARK: This is the background of this view
            VStack(alignment: .center, spacing: .zero){
                
                HStack(spacing: .zero){
                    VStack{
                        Rectangle()
                            .fill(Color("Maroon"))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    VStack{
                        Rectangle()
                            .fill(Color("Maroon"))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.10)
                
                HStack(spacing: .zero){
                    VStack{
                        Rectangle()
                            .fill(Color("Maroon"))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    VStack{
                        Rectangle()
                            .fill(Color("Maroon"))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.05)
                
                HStack(spacing: .zero){
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("White Gray"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("White Gray"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.35)
                
                HStack(spacing: .zero){
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("White Gray"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("White Gray"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.50)
                
            }
            .ignoresSafeArea(.all)
            
            //MARK: This is the Cajon Image in the middle of the screen
            GeometryReader { geometry in
                let imageWidth: CGFloat = 199
                let imageHeight: CGFloat = 276
                
                Image("Cajon Pink")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            
            //MARK: This is the outer layer of the stack
            VStack(alignment: .center, spacing: .zero){
                
                VStack(spacing: .zero) {
                    Spacer()
                    Text("Free Play")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(Color("White"))
                        .padding(.top, 40)
                    Spacer()
                    HStack(spacing: .zero){
                        VStack{
                            Rectangle()
                                .fill(Color("Transparent")).opacity(0.1)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .overlay(
                                    HStack (spacing: .zero){
                                        Text("Left ")
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                        Text("Hand")
                                    }
                                        .font(.system(size: 20, design: .rounded))
                                        .foregroundColor(Color("Pink"))
                                )
                        }
                        VStack{
                            
                            Rectangle()
                                .fill(Color("Transparent")).opacity(0.1)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .overlay(
                                    
                                    HStack (spacing: .zero){
                                        Text("Right ")
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                        Text("Hand")
                                    }
                                        .font(.system(size: 20, design: .rounded))
                                        .foregroundColor(Color("Pink"))
                                )
                            
                        }
                    }
                    Spacer()
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.15)
                
                HStack(spacing: .zero){
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("Transparent"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            Button(action: {
                                if service.SnareV == 1.0 {
                                    isHighlightingLeftSnare.toggle()
                                    if isHighlightingLeftSnare {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                                            withAnimation {
                                                isHighlightingLeftSnare = false
                                            }
                                        }
                                    }
                                }
                            }) {
                                if service.SnareV ==  1.0 {
                                    Text("Snare")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(1)
                                        .foregroundColor(.white)
                                        
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color("Lead Scale50"))
                                        
                                        
                                    
                                }
                                else if service.SnareV != 1.0 {
                                    Text("Snare")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(0.3)
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                          
                        }
                    }
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("Transparent"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            Button(action: {
                                isHighlightingRightSnare.toggle()
                                if isHighlightingRightSnare {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                                        withAnimation {
                                            isHighlightingRightSnare = false
                                        }
                                    }
                                }
                            }) {
                                if service.Bass1 ==  1.0 {
                                    Text("Snare")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(1)
                                        .foregroundColor(.white)
                                        
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color("Lead Scale50"))
                                        
                                        
                                    
                                }
                                else if service.Bass1 != 1.0 {
                                    Text("Snare")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(0.3)
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                            ButtonAnimationComponent(isHighlightingObject: $isHighlightingRightSnare)
                        }
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.30)
                
                HStack(spacing: .zero){
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("Transparent"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            Button(action: {
                                isHighlightingLeftKick.toggle()
                                if isHighlightingLeftKick {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                                        withAnimation {
                                            isHighlightingLeftKick = false
                                        }
                                    }
                                }
                            }) {
                                if service.SnareV == 2.0 {
                                    Text("Kick")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(1)
                                        .foregroundColor(.white)
                                        
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color("Lead Scale50"))
                                } else if service.SnareV != 2.0 {
                                    
                                    Text("kick")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(0.3)
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                            ButtonAnimationComponent(isHighlightingObject: $isHighlightingLeftKick)
                        }
                    }
                    VStack {
                        ZStack {
                            Rectangle()
                                .fill(Color("Transparent"))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            Button(action: {
                                isHighlightingRightKick.toggle()
                                if isHighlightingRightKick {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                                        withAnimation {
                                            isHighlightingRightKick = false
                                        }
                                    }
                                }
                            }) {
                                if service.Bass1 == 2.0 {
                                    Text("Kick")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(1)
                                        .foregroundColor(.white)
                                        
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(Color("Lead Scale50"))
                                } else if service.Bass1 != 2.0 {
                                    
                                    Text("kick")
                                        .font(.system(size: 40, weight: .bold, design: .rounded))
                                        .animation(.easeInOut(duration: 1))
                                        .opacity(0.3)
                                        .foregroundColor(.black)
                                    
                                }
                            }
                            
                            ButtonAnimationComponent(isHighlightingObject: $isHighlightingRightKick)
                        }
                    }
                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.55)
                
            }
            .ignoresSafeArea(.all)
            
            //MARK: This is the most outer layer for button
            HStack {
                VStack{
                    Button(action: {
                        dismiss()
                        bunyi = false
                        
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                Spacer()
            }
        }
        .onAppear(){
            bunyi = true
            print(service.SnareV)

        }
        .onReceive(Just(service.SnareV)) { snareVal in
            
            
            if snareVal == 1.0 {
                pointku += 1
                print(pointku)
            } else if  snareVal == 2.0{
                pointku1 += 1
                print(pointku1)
            }
        }
        
    }
}

#Preview {
    FreePlayView(bunyi: .constant(false))
}


