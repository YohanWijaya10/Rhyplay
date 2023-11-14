//
//  MainPageView.swift
//  MacroCoba3
//
//  Created by Brian Putrantio on 10/11/23.
//

import Foundation
import SwiftUI

struct MainPageView: View{
    
    var body: some View{
        NavigationStack{
            ZStack{
                //MARK: Wana backgrounds
                Color("BG")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    //MARK: Text Judul
                    HStack{
                        Text("Let’s Practice")
                            .font(.title)
                            .foregroundColor(.white)
                        Text("Rhythm!")
                            .font(.title)
                            .bold()
                            .foregroundColor(.pink)
                    }
                    .frame(maxHeight: UIScreen.main.bounds.height * 0.05)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    //MARK: Button ke Pattern
                    NavigationLink(destination: PatternListView().navigationBarHidden(true)) {
                        ZStack{
                            Image("PatternButton")
                                .resizable()
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.76, maxHeight: UIScreen.main.bounds.height * 0.2)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    //MARK: Button ke Songs
                    NavigationLink(destination: SongListView().navigationBarHidden(true)) {
                        ZStack{
//                            RoundedRectangle(cornerRadius: 15)
//                            
//                            VStack{
//                                ///Text Judul
//                                HStack{
//                                    Text("Songs")
//                                        .font(.title)
//                                        .bold()
//                                        .foregroundColor(.white)
//                                    Spacer()
//                                }
//                                Spacer()
//                                
//                                ///Description + Panah
//                                ZStack{
//                                    HStack{
//                                        Text("Drum along with favorites or discover new beats across genres.")
//                                            .font(.system(size: 9))
//                                            .foregroundColor(.white)
//                                            .multilineTextAlignment(.leading)
//                                        
//                                        Spacer()
//                                            .frame(width: 80)
//                                    }
//                                    
//                                    VStack{
//                                        Spacer()
//                                            .frame(height: 20)
//                                        HStack{
//                                            Spacer()
//                                            Image(systemName: "arrow.right")
//                                                .bold()
//                                                .foregroundColor(.white)
//                                            
//                                        }
//                                    }
//                                }
//                            }
//                            .frame(width: 250, height: 120)
                            
                            Image("SongsButton")
                                .resizable()
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.76, maxHeight: UIScreen.main.bounds.height * 0.2)
                        .foregroundColor(.pink)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    //MARK: Button ke FreePlay
                    NavigationLink(destination: FreePlayView().navigationBarHidden(true)) {
                        ZStack{
                            Image("FreePlayButton")
                                .resizable()
                        }
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.76, maxHeight: UIScreen.main.bounds.height * 0.2)
                    }
                }
            }
        }
    }
}

#Preview {
    MainPageView()
}
