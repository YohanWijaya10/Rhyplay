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
                Color("Maroon")
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
