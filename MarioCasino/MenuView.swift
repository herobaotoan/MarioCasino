//
//  ContentView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        @Binding var enable: Bool
        @Binding var howToPlayViewEnable: Bool
        @Binding var leaderboardViewEnable: Bool
        ZStack {
            //Background
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                //LOGO
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(minHeight: 130, idealHeight: 170, maxHeight: 200, alignment: .center)
                Button{
                    informationUI = true
                } label: {
                    Text("PLAY")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.black.opacity(0.7)))
                }
                Button{
                    informationUI = true
                } label: {
                    Text("HOW TO PLAY")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.black.opacity(0.7)))
                }
                Button{
                    informationUI = true
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
