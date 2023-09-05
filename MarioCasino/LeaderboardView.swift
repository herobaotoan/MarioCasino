/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Chi Toan
  ID: s3891637
  Created  date: 23/08/2023
  Last modified: 6/09/2023
  Acknowledgement: resources from canvas and google, no AI used. 
*/

import SwiftUI

struct LeaderboardView: View {
    @Binding var enable: Bool
    @State var timeRemaining = 10
    @Binding var dictionary: [String: Int]
    @Binding var achievement: [Bool]
    @Binding var progression: [Int]
    var rank = 0
    
    let ACM1 = Achievement(id: 1, name: "100 Roll", imgName: "ACM1")
    let ACM2 = Achievement(id: 2, name: "100 Dead", imgName: "ACM2")
    let ACM3 = Achievement(id: 3, name: "Win the game", imgName: "ACM3")
    
    var body: some View {
        //Sort leaderboard dictionary to ascending
        let sortedDict = dictionary.sorted(by: {$0.value < $1.value})
        let keys = sortedDict.map{$0.key}
        let values = sortedDict.map{$0.value}
        //Progression
        let ACM1Progress = "\(progression[0])\\100"
        let ACM2Progress = "\(progression[1])\\100"
        let ACM3Progress = "\(progression[2])\\1"
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
                    AchievementView(achieved: achievement[0], acm: ACM1, progress: ACM1Progress)
                    AchievementView(achieved: achievement[1], acm: ACM2, progress: ACM2Progress)
                    AchievementView(achieved: achievement[2], acm: ACM3, progress: ACM3Progress)
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
