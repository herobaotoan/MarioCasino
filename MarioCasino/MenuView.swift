//
//  ContentView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct MenuView: View {
    @Binding var enable: Bool
    @Binding var howToPlayViewEnable: Bool
    @Binding var leaderboardViewEnable: Bool
    var body: some View {
        ZStack {
            //Background
            Image("background")
                .resizable()
//                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            VStack {
                //LOGO
                Image("banner")
                    .resizable()
                    .scaledToFit()
                    .frame(minHeight: 130, idealHeight: 170, maxHeight: 200, alignment: .center)
                Spacer()
                Button{
                    enable = false
                    playSound(sound: "bgm", type: "mp3")
                } label: {
                    Text("PLAY")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.black.opacity(0.7)))
                }
                Button{
                    howToPlayViewEnable = true
                } label: {
                    Text("HOW TO PLAY")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.black.opacity(0.7)))
                }
                Button{
                    leaderboardViewEnable = true
                } label: {
                    Text("LEADERBOARD")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.black.opacity(0.7)))
                }
            }
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         MenuView()
//     }
// }
