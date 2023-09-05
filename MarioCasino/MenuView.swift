/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Chi Toan
  ID: s3891637
  Created  date: 16/08/2023
  Last modified: 06/09/2023
  Acknowledgement: resources from canvas and google, no AI used. 
*/

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
