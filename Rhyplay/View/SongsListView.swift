//
//  SongsListView.swift
//  Rhyplay
//
//  Created by Brian Putrantio on 10/11/23.
//

import Foundation
import SwiftUI

struct SongListView: View {
    
    @Environment (\.dismiss) var dismiss
    @State var showSongDescription = false
    @State var showingSheet = false
    @State var playingGame = false
    @Binding var bunyi : Bool

    @State var SongId: String = ""
    @State var SongImg: String = ""
    @State var ArtistId: String = ""
    @State var nyoba: String = "coba"
    
    var Allitems = ["Super Shy","coba"]
    var Pop = [String]()
    let Rock = [String]()
    let HipHop = [String]()
    let Electronic = [String]()
    let KPop = ["Super Shy"]
    
    @State private var count: Int = 5
    
    @State private var Genre: String = "All"
    @State private var Artist: String = "New Jeans"
    
    var body: some View {
        NavigationStack{
            ZStack{
                //MARK: Wana backgrounds
                Color("Maroon")
                    .edgesIgnoringSafeArea(.all)
                
                ZStack{
                    //MARK: Navigation Bar + Back BUtton
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
                                
                                Text("Songs")
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                    .foregroundColor(.white)
                    
                    //MARK: Filter
                    VStack{
                        Spacer()
                            .frame(height: 80)
                        ZStack{
                            ScrollView(.horizontal, showsIndicators: false){
                                HStack{
                                    ///All Genre
                                    Button(action: {
                                        Genre = "All"
                                        
                                    }) {
                                        if Genre == "All"{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.pink)
                                                
                                                Text("All")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        else{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.white)
                                                
                                                Text("All")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                    
                                    ///Pop Genre
                                    Button(action: {
                                        Genre = "Pop"
                                    }) {
                                        if Genre == "Pop"{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.pink)
                                                
                                                Text("Pop")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        else{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.white)
                                                
                                                Text("Pop")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                    
                                    ///Rock Genre
                                    Button(action: {
                                        Genre = "Rock"
                                    }) {
                                        if Genre == "Rock"{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.pink)
                                                
                                                Text("Rock")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        else{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.white)
                                                
                                                Text("Rock")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                    
                                    ///Hip/Hop Genre
                                    Button(action: {
                                        Genre = "Hip/Hop"
                                    }) {
                                        if Genre == "Hip/Hop"{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.pink)
                                                
                                                Text("Hip/Hop")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        else{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.white)
                                                
                                                Text("Hip/Hop")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                    
                                    ///Electronic Genre
                                    Button(action: {
                                        Genre = "Electronic"
                                    }) {
                                        if Genre == "Electronic"{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 100, height: 30)
                                                    .foregroundColor(.pink)
                                                
                                                Text("Electronic")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        else{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 100, height: 30)
                                                    .foregroundColor(.white)
                                                
                                                Text("Electronic")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                    
                                    ///K-Pop Genre
                                    Button(action: {
                                        Genre = "K-Pop"
                                    }) {
                                        if Genre == "K-Pop"{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.pink)
                                                
                                                Text("K-Pop")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        else{
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 50)
                                                    .frame(width: 85, height: 30)
                                                    .foregroundColor(.white)
                                                
                                                Text("K-Pop")
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.leading, 10)
                        Spacer()
                    }
                    
                    //MARK: Song List
                    VStack{
                        Spacer()
                            .frame(height: 110)
                        ///All Songs
                        if Genre == "All" {
                            let Allcount = Allitems.count
                            ScrollView{
                                VStack(spacing: .zero){
                                    if Allcount >= 2{
                                        HStack{
                                            ForEach(0..<2, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    SongId = Allitems[index]
                                                                                                        SongImg = Allitems[index]
                                                                                                        ArtistId = "New Jeans"
                                                    
                                                    //showSongDescription = true
                                                    showingSheet.toggle()
                                                } label: {
                                                    VStack{
                                                                                                            ZStack{
                                                                                                                RoundedRectangle(cornerRadius: 10)
                                                                                                                
                                                                                                                Image(Allitems[index])
                                                                                                                    .resizable()
                                                                                                                    .scaledToFill()
                                                                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                                                            }
                                                                                                            .frame(width: 150, height: 150)
                                                                                                            
                                                                                                            Spacer()
                                                                                                                .frame(height: 10)
                                                                                                            
                                                                                                            ZStack{
                                                                                                                VStack(spacing: .zero){
                                                                                                                    HStack{
                                                                                                                        Text(Allitems[index])
                                                                                                                            .font(.system(size: 15))
                                                                                                                            .bold()
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                    HStack{
                                                                                                                        Text(Artist)
                                                                                                                            .font(.system(size: 12))
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                }
                                                                                                                .foregroundColor(.white)
                                                                                                                
                                                                                                                HStack{
                                                                                                                    Spacer()
                                                                                                                    ZStack{
                                                                                                                        Circle()
                                                                                                                            .foregroundColor(.pink)
                                                                                                                        Image(systemName: "play.fill")
                                                                                                                            .foregroundColor(.white)
                                                                                                                        
                                                                                                                    }
                                                                                                                    .frame(width: 35)
                                                                                                                }
                                                                                                            }
                                                                                                            .frame(width: 150, height: 30)
                                                                                                        }
                                                                                                        .frame(width: 150, height: 250)
                                                                                                        .padding(.horizontal, 10)
                                                                                                        .padding(.bottom, 30)
                                                }
                                                
                                            }
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                            SongLevelPopUpView2(SongId: $SongId, SongImg: $SongImg, ArtistId: $ArtistId, showingSheet: $showingSheet, playingGame: $playingGame )
                                                .presentationDetents([.height(800)])
                                        }
                                        
                                        NavigationLink(destination: ContentView(bunyi: $bunyi).navigationBarBackButtonHidden(true), isActive: $playingGame) {
                                            EmptyView()
                                        }
                                        
                                    }
                                    else if Allcount == 1{
                                        HStack{
                                            ForEach(0..<1, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    SongId = Allitems[index]
                                                                                                        SongImg = Allitems[index]
                                                                                                        ArtistId = "New Jeans"
                                                    
                                                    //showSongDescription = true
                                                    showingSheet.toggle()
                                                } label: {
                                                    VStack{
                                                                                                            ZStack{
                                                                                                                RoundedRectangle(cornerRadius: 10)
                                                                                                                
                                                                                                                Image(Allitems[index])
                                                                                                                    .resizable()
                                                                                                                    .scaledToFill()
                                                                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                                                            }
                                                                                                            .frame(width: 150, height: 150)
                                                                                                            
                                                                                                            Spacer()
                                                                                                                .frame(height: 10)
                                                                                                            
                                                                                                            ZStack{
                                                                                                                VStack(spacing: .zero){
                                                                                                                    HStack{
                                                                                                                        Text(Allitems[index])
                                                                                                                            .font(.system(size: 15))
                                                                                                                            .bold()
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                    HStack{
                                                                                                                        Text(Artist)
                                                                                                                            .font(.system(size: 12))
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                }
                                                                                                                .foregroundColor(.white)
                                                                                                                
                                                                                                                HStack{
                                                                                                                    Spacer()
                                                                                                                    ZStack{
                                                                                                                        Circle()
                                                                                                                            .foregroundColor(.pink)
                                                                                                                        Image(systemName: "play.fill")
                                                                                                                            .foregroundColor(.white)
                                                                                                                        
                                                                                                                    }
                                                                                                                    .frame(width: 35)
                                                                                                                }
                                                                                                            }
                                                                                                            .frame(width: 150, height: 30)
                                                                                                        }
                                                                                                        .frame(width: 150, height: 250)
                                                                                                        .padding(.horizontal, 10)
                                                                                                        .padding(.bottom, 30)
                                                }
                                                
                                            }
                                            
                                            VStack{
                                                Spacer()
                                            }
                                            .frame(width: 150, height: 250)
                                            .padding(.horizontal, 10)
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                            SongLevelPopUpView2(SongId: $SongId, SongImg: $SongImg, ArtistId: $ArtistId, showingSheet: $showingSheet, playingGame: $playingGame )
                                                .presentationDetents([.height(800)])
                                        }
                                        
                                        NavigationLink(destination: ContentView(bunyi: $bunyi).navigationBarBackButtonHidden(true), isActive: $playingGame) {
                                            EmptyView()
                                        }
                                    }
                                }
                            }
                        }
                        ///POP Song
                        else if Genre == "Pop" {
                            let PopSong = Pop.count
                            ScrollView{
                                VStack{
                                    if PopSong >= 2{
                                        HStack{
                                            ForEach(0..<2, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                        }
                                    }
                                    else if PopSong == 1{
                                        HStack{
                                            ForEach(0..<1, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                            
                                            VStack{
                                                Spacer()
                                            }
                                            .frame(width: 150, height: 250)
                                            .padding(.horizontal, 10)
                                        }
                                    }
                                }
                            }
                        }
                        ///Rock Song
                        else if Genre == "Rock" {
                            let RockSong = Rock.count
                            ScrollView{
                                VStack{
                                    if RockSong >= 2{
                                        HStack{
                                            ForEach(0..<2, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                        }
                                    }
                                    else if RockSong == 1{
                                        HStack{
                                            ForEach(0..<1, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                            
                                            VStack{
                                                Spacer()
                                            }
                                            .frame(width: 150, height: 250)
                                            .padding(.horizontal, 10)
                                        }
                                    }
                                }
                            }
                        }
                        ///Hip/Hop Song
                        else if Genre == "Hip/Hop" {
                            let HipHopSong = HipHop.count
                            ScrollView{
                                VStack{
                                    if HipHopSong >= 2{
                                        HStack{
                                            ForEach(0..<2, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                        }
                                    }
                                    else if HipHopSong == 1{
                                        HStack{
                                            ForEach(0..<1, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                            
                                            VStack{
                                                Spacer()
                                            }
                                            .frame(width: 150, height: 250)
                                            .padding(.horizontal, 10)
                                        }
                                    }
                                }
                            }
                        }
                        ///Electronic Song
                        else if Genre == "Electronic" {
                            let ElectronicSong = Electronic.count
                            ScrollView{
                                VStack{
                                    if ElectronicSong >= 2{
                                        HStack{
                                            ForEach(0..<2, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                        }
                                    }
                                    else if ElectronicSong == 1{
                                        HStack{
                                            ForEach(0..<1, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    
                                                } label: {
                                                    VStack{
                                                        ZStack{
                                                            RoundedRectangle(cornerRadius: 10)
                                                            
                                                            Image("dummy")
                                                                .resizable()
                                                                .scaledToFill()
                                                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }
                                                        .frame(width: 150, height: 150)
                                                        
                                                        Spacer()
                                                            .frame(height: 10)
                                                        
                                                        ZStack{
                                                            VStack(spacing: .zero){
                                                                HStack{
                                                                    Text(Allitems[index])
                                                                        .font(.system(size: 15))
                                                                        .bold()
                                                                    Spacer()
                                                                }
                                                                HStack{
                                                                    Text(Artist)
                                                                        .font(.system(size: 12))
                                                                    Spacer()
                                                                }
                                                            }
                                                            .foregroundColor(.white)
                                                            
                                                            HStack{
                                                                Spacer()
                                                                ZStack{
                                                                    Circle()
                                                                        .foregroundColor(.pink)
                                                                    Image(systemName: "play.fill")
                                                                        .foregroundColor(.white)
                                                                    
                                                                }
                                                                .frame(width: 35)
                                                            }
                                                        }
                                                        .frame(width: 150, height: 30)
                                                    }
                                                    .frame(width: 150, height: 250)
                                                    .padding(.horizontal, 10)
                                                    .padding(.bottom, 30)
                                                }
                                            }
                                            
                                            VStack{
                                                Spacer()
                                            }
                                            .frame(width: 150, height: 250)
                                            .padding(.horizontal, 10)
                                        }
                                    }
                                }
                            }
                        }
                        ///KPop Song
                        else if Genre == "K-Pop" {
                            let KPopSong = KPop.count
                            ScrollView{
                                VStack{
                                    if KPopSong >= 2{
                                        HStack{
                                            ForEach(0..<2, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    SongId = Allitems[index]
                                                                                                        SongImg = Allitems[index]
                                                                                                        ArtistId = "New Jeans"
                                                } label: {
                                                    VStack{
                                                                                                            ZStack{
                                                                                                                RoundedRectangle(cornerRadius: 10)
                                                                                                                
                                                                                                                Image(Allitems[index])
                                                                                                                    .resizable()
                                                                                                                    .scaledToFill()
                                                                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                                                            }
                                                                                                            .frame(width: 150, height: 150)
                                                                                                            
                                                                                                            Spacer()
                                                                                                                .frame(height: 10)
                                                                                                            
                                                                                                            ZStack{
                                                                                                                VStack(spacing: .zero){
                                                                                                                    HStack{
                                                                                                                        Text(Allitems[index])
                                                                                                                            .font(.system(size: 15))
                                                                                                                            .bold()
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                    HStack{
                                                                                                                        Text(Artist)
                                                                                                                            .font(.system(size: 12))
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                }
                                                                                                                .foregroundColor(.white)
                                                                                                                
                                                                                                                HStack{
                                                                                                                    Spacer()
                                                                                                                    ZStack{
                                                                                                                        Circle()
                                                                                                                            .foregroundColor(.pink)
                                                                                                                        Image(systemName: "play.fill")
                                                                                                                            .foregroundColor(.white)
                                                                                                                        
                                                                                                                    }
                                                                                                                    .frame(width: 35)
                                                                                                                }
                                                                                                            }
                                                                                                            .frame(width: 150, height: 30)
                                                                                                        }
                                                                                                        .frame(width: 150, height: 250)
                                                                                                        .padding(.horizontal, 10)
                                                                                                        .padding(.bottom, 30)
                                                }
                                            }
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                            SongLevelPopUpView2(SongId: $SongId, SongImg: $SongImg, ArtistId: $ArtistId, showingSheet: $showingSheet, playingGame: $playingGame )
                                                .presentationDetents([.height(800)])
                                        }
                                        
                                        NavigationLink(destination: ContentView(bunyi: $bunyi).navigationBarBackButtonHidden(true), isActive: $playingGame) {
                                            EmptyView()
                                        }
                                    }
                                    else if KPopSong == 1{
                                        HStack{
                                            ForEach(0..<1, id: \.self) { index in
                                                ///Button Songs
                                                Button {
                                                    SongId = Allitems[index]
                                                                                                        SongImg = Allitems[index]
                                                                                                        ArtistId = "New Jeans"
                                                    
                                                    showingSheet.toggle()
                                                } label: {
                                                    VStack{
                                                                                                            ZStack{
                                                                                                                RoundedRectangle(cornerRadius: 10)
                                                                                                                
                                                                                                                Image(Allitems[index])
                                                                                                                    .resizable()
                                                                                                                    .scaledToFill()
                                                                                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                                                                            }
                                                                                                            .frame(width: 150, height: 150)
                                                                                                            
                                                                                                            Spacer()
                                                                                                                .frame(height: 10)
                                                                                                            
                                                                                                            ZStack{
                                                                                                                VStack(spacing: .zero){
                                                                                                                    HStack{
                                                                                                                        Text(Allitems[index])
                                                                                                                            .font(.system(size: 15))
                                                                                                                            .bold()
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                    HStack{
                                                                                                                        Text(Artist)
                                                                                                                            .font(.system(size: 12))
                                                                                                                        Spacer()
                                                                                                                    }
                                                                                                                }
                                                                                                                .foregroundColor(.white)
                                                                                                                
                                                                                                                HStack{
                                                                                                                    Spacer()
                                                                                                                    ZStack{
                                                                                                                        Circle()
                                                                                                                            .foregroundColor(.pink)
                                                                                                                        Image(systemName: "play.fill")
                                                                                                                            .foregroundColor(.white)
                                                                                                                        
                                                                                                                    }
                                                                                                                    .frame(width: 35)
                                                                                                                }
                                                                                                            }
                                                                                                            .frame(width: 150, height: 30)
                                                                                                        }
                                                                                                        .frame(width: 150, height: 250)
                                                                                                        .padding(.horizontal, 10)
                                                                                                        .padding(.bottom, 30)
                                                }
                                                
                                                
                                                
                                            }
                                            
                                            VStack{
                                                Spacer()
                                            }
                                            .frame(width: 150, height: 250)
                                            .padding(.horizontal, 10)
                                        }
                                        .sheet(isPresented: $showingSheet) {
                                            SongLevelPopUpView2(SongId: $SongId, SongImg: $SongImg, ArtistId: $ArtistId, showingSheet: $showingSheet, playingGame: $playingGame )
                                                .presentationDetents([.height(800)])
                                        }
                                        
                                        NavigationLink(destination: ContentView(bunyi: $bunyi).navigationBarBackButtonHidden(true), isActive: $playingGame) {
                                            EmptyView()
                                        }
                                    }
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
    SongListView(bunyi: .constant(false))
}

