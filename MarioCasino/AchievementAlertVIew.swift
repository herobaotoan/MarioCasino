//
//  ContentView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct AchievementAlertView: View {
    @Binding var enable: Bool
    @Binding var achievement: Achievement
    
//    let Achievements = [
//        Achievement(id: 1, name: "100 Roll", imgName: "ACM1"),
//        Achievement(id: 2, name: "100 Dead", imgName: "ACM2"),
//        Achievement(id: 3, name: "Win the game", imgName: "ACM3"),
//    ]
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.8))
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.green.opacity(0.9))
                .frame(width: 350,height: 500)
           VStack{
               Text("Achievement Unlocked! You can view it in Leaderboard.")
                   .modifier(TextWhiteModifier(fontSize: 20))
                   .frame(width: 300)
               Image(achievement.imgName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(10)
                Text(achievement.name)
                Button{
                    enable = false
                } label: {
                    Text("Continue")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
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
