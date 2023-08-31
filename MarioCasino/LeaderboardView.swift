//
//  TestView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var enable: Bool
    @State var timeRemaining = 10
    @Binding var dictionary: [String: Int]
    @Binding var achievement: [Bool]
    var rank = 0
    
    let ACM1 = Achievement(id: 1, name: "100 Roll", imgName: "ACM1")
    let ACM2 = Achievement(id: 2, name: "100 Dead", imgName: "ACM2")
    let ACM3 = Achievement(id: 3, name: "Win the game", imgName: "ACM3")
    
    var body: some View {
        //Sort leaderboard dictionary to ascending
        let sortedDict = dictionary.sorted(by: {$0.value < $1.value})
        let keys = sortedDict.map{$0.key}
        let values = sortedDict.map{$0.value}
        ZStack{
            //Background
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button{
                    enable = false
                } label: {
                    Text("BACK")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
                }
                Text("LEADERBOARD")
                List {
                    ForEach(keys.indices) {index in
                        HStack {
                            Text("\(keys[index])")
                            Text("\(values[index])")
                        }
                    }
                }
                .frame(maxHeight: 400)
                
                HStack{
                    AchievementView(achieved: achievement[0], acm: ACM1)
                    AchievementView(achieved: achievement[1], acm: ACM2)
                    AchievementView(achieved: achievement[2], acm: ACM3)
                }
            }
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaderboardView()
//    }
//}
