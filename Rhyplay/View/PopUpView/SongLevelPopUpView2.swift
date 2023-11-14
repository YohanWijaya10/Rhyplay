//
//  SongLevelPopUpView2.swift
//  MacroCoba3
//
//  Created by Brian Putrantio on 13/11/23.
//

import Foundation
import SwiftUI

struct SongLevelPopUpView2: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var SongId: String
    @Binding var SongImg: String
    @Binding var ArtistId: String
    @State var LevelId: String = "Easy"
    @State var SpeedId: String = "Normal"
    
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .foregroundColor(Color("Maroon"))
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack{
                    Spacer()
                        .frame(height: 30)
                    
                    //Button Cancel
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                                .font(.system(size: 20, design: .rounded))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    //Gambar + Judul + Penyanyi
                    HStack{
                        Image(SongImg)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 3)
                            )
                        
                        Spacer()
                            .frame(width: 20)
                        
                        VStack{
                            HStack{
                                Text(SongId)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .bold()
                                Spacer()
                            }
                            HStack{
                                Text(ArtistId)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15))
                                Spacer()
                            }
                            Spacer()
                        }
                    }
                    .frame(height: 100)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    //Level Choose
                    VStack{
                        HStack{
                            Text("LEVEL")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                            Spacer()
                        }
                        
                        HStack{
                            ///Easy
                            Button {
                                LevelId = "Easy"
                            } label: {
                                if LevelId == "Easy"{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.pink)
                                            )
                                        
                                        Text("Easy")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(.pink)
                                }
                                else{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray)
                                            )
                                        
                                        Text("Easy")
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(Color("Maroon"))
                                }
                            }
                            
                            Spacer()
                            
                            ///Medium
                            Button {
                                LevelId = "Medium"
                            } label: {
                                if LevelId == "Medium"{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.pink)
                                            )
                                        
                                        Text("Medium")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(.pink)
                                }
                                else{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray)
                                            )
                                        
                                        Text("Medium")
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(Color("Maroon"))
                                }
                            }
                            
                            Spacer()
                            
                            ///Hard
                            Button {
                                LevelId = "Hard"
                            } label: {
                                if LevelId == "Hard"{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.pink)
                                            )
                                        
                                        Text("Hard")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(.pink)
                                }
                                else{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray)
                                            )
                                        
                                        Text("Hard")
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(Color("Maroon"))
                                }
                            }
                        }
                    }
                    
                    Spacer()
                        .frame(height: 50)
                    
                    //Speed Choose
                    VStack{
                        HStack{
                            Text("SPEED")
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                            Spacer()
                        }
                        
                        HStack{
                            ///Normal
                            Button {
                                SpeedId = "Normal"
                            } label: {
                                if SpeedId == "Normal"{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.pink)
                                            )
                                        
                                        Text("Normal")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(.pink)
                                }
                                else{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray)
                                            )
                                        
                                        Text("Normal")
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(Color("Maroon"))
                                }
                            }
                            
                            Spacer()
                            
                            ///Slow
                            Button {
                                SpeedId = "Slow"
                            } label: {
                                if SpeedId == "Slow"{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.pink)
                                            )
                                        
                                        Text("Slow")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(.pink)
                                }
                                else{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray)
                                            )
                                        
                                        Text("Slow")
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(Color("Maroon"))
                                }
                            }
                            
                            Spacer()
                            
                            ///Very Slow
                            Button {
                                SpeedId = "Very Slow"
                            } label: {
                                if SpeedId == "Very Slow"{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.pink)
                                            )
                                        
                                        Text("Very Slow")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(.pink)
                                }
                                else{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 20)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.gray)
                                            )
                                        
                                        Text("Very Slow")
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width: 90, height: 30)
                                    .foregroundColor(Color("Maroon"))
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    //Button Start
                    HStack{
                        ///Button Start
                        Button {
                            
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.pink)
                                    )
                                
                                Text("Start")
                                    .foregroundColor(.white)
                            }
                            .frame(width: 350, height: 40)
                            .foregroundColor(.pink)
                        }
                    }
                }
                .frame(width: 350)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview{
    SongLevelPopUpView2(SongId: .constant("Super Shy"), SongImg: .constant("dummy"), ArtistId: .constant("New Jeans"))
}
