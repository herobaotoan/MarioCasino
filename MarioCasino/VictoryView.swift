//
//  ContentView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct VictoryView: View {
    var body: some View {
        @Binding var enable: Bool
        @Binding var score: Int
        @State var username: String
        @State var error = false
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.8))
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white.opacity(0.9))
                .frame(width: 300,height: 200)
            VStack{
                Text("VICTORY!")
                    .modifier(TextWhiteModifier(fontSize: 40))
                    .modifier(CapsuleColorModifier(color: Color.blue.opacity(0.7)))
                Text("You have defeated Bowser! Mushroom Kingdom is now save once again.")
                    .modifier(TextWhiteModifier(fontSize: 20))
                Text("You rolled: \(score) times.")
                    .modifier(TextWhiteModifier(fontSize: 20))
                TextField("Enter name:", text: $username)
                    .modifier(CapsuleColorModifier(color: Color.black.opacity(0.7)))
                Button{
                    //TODO: LEADERBOARD
                    
                    if username != ""
                    {
                        enable = false
                    } else {
                        error = true
                    }
                } label: {
                    Text("NEW GAME")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
                }
                if error {
                    Text("Please enter your name to continue.")
                        .modifier(TextWhiteModifier(fontSize: 20))
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
