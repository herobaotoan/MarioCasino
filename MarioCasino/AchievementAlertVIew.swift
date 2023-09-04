//
//  ContentView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct AchievemenentGetView: View {
    @Binding var enable: Bool
    @Binding var index: Int
    @Binding var username: String
    @State var error = false
    @Binding var dictionary: [String: Int]
    
    let ACM1 = Achievement(id: 1, name: "100 Roll", imgName: "ACM1")
    let ACM2 = Achievement(id: 2, name: "100 Dead", imgName: "ACM2")
    let ACM3 = Achievement(id: 3, name: "Win the game", imgName: "ACM3")
    let Achievements = [ACM1, ACM2, ACM3]} 
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.8))
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.green.opacity(0.9))
                .frame(width: 350,height: 500)
           VStack{
                    Image(Achivements[index].imgName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(10)
                    Text(Achivements[index].name)
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
}

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         MenuView()
//     }
// }
