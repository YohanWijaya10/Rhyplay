//
//  PatternListView.swift
//  Rhyplay
//
//  Created by Brian Putrantio on 13/11/23.
//

import Foundation
import SwiftUI

struct PatternListView: View {
    @Binding var bunyi: Bool // Assuming bunyi is used in MainPageView
    @EnvironmentObject var service: BluetoothService
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            ZStack{
                //MARK: Wana backgrounds
                Color("Maroon")
                    .edgesIgnoringSafeArea(.all)
                
                ZStack{
                    //MARK: Navigation Bar (Back BUtton
                    VStack{
                        ZStack{
                            HStack{
                                Button(action: {
                                    dismiss()
                                }) {
                                    Image(systemName: "arrow.left")
                                        .font(.system(size: 25, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                }
                                
                                Spacer()
                                    .frame(width: 320)
                            }
                            HStack{
                                Spacer()
                                
                                Text("Patterns")
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    
                    //MARK: Pattern List
                    VStack{
                        Spacer()
                            .frame(height: 80)
                        ScrollView{
                            VStack(){
                                HStack{
                                    ///Button Pattern 1
                                    NavigationLink(destination: GamePatternView(bunyi: .constant(true)).environmentObject(service).navigationBarHidden(true)) {
                                     ZStack{
                                         RoundedRectangle(cornerRadius: 10)
                                             .frame(width: 170, height: 220)
                                             .foregroundColor(Color("Pink"))
                                         
                                         Image("Pattern1Button")
                                             .resizable()
                                             .scaledToFit()
                                         
                                         VStack{
                                             Spacer()
                                             
                                             ///Star + Play
                                             HStack{
                                                 Image(systemName: "star.fill")
                                                     .font(.system(size: 20))
                                                     .foregroundColor(Color("Maroon"))
                                                 Image(systemName: "star.fill")
                                                     .font(.system(size: 20))
                                                     .foregroundColor(Color("Maroon"))
                                                 Image(systemName: "star.fill")
                                                     .font(.system(size: 20))
                                                     .foregroundColor(Color("Maroon"))
                                                 
                                                 Spacer()
                                             }
                                             .padding(.bottom, 10)
                                         }
                                         .foregroundColor(.white)
                                         .frame(width: 160, height: 210)
                                     }
                                     .frame(width: 170, height: 220)
                                     }
                                     .padding(.bottom, 20)
                                     .padding(.horizontal, 10)
                                    
                                    
                                    ///Button Pattern 2
                                    NavigationLink(destination: GamePatternView2().navigationBarHidden(true)) {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 170, height: 220)
                                                .foregroundColor(Color("Pink"))
                                            
                                            Image("Pattern2Button")
                                                .resizable()
                                                .scaledToFit()
                                            
                                            VStack{
                                                Spacer()
                                                
                                                ///Star + Play
                                                HStack{
                                                    Image(systemName: "star.fill")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(Color("Maroon"))
                                                    Image(systemName: "star.fill")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(Color("Maroon"))
                                                    Image(systemName: "star.fill")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(Color("Maroon"))
                                                    
                                                    Spacer()
                                                }
                                                .padding(.bottom, 10)
                                            }
                                            .frame(width: 160, height: 210)
                                            .padding(.horizontal, 10)
                                        }
                                        .frame(width: 170, height: 220)
                                     }
                                     .padding(.bottom, 20)
                                     .padding(.horizontal, 10)
                                    
                                }
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    PatternListView(bunyi: .constant(false))
}
