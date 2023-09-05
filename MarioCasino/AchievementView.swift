/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Chi Toan
  ID: s3891637
  Created  date: 29/08/2023
  Last modified: 5/09/2023
  Acknowledgement: resources from canvas and google, no AI used. 
*/

import SwiftUI

struct AchievementView: View {
    var achieved : Bool
    var acm: Achievement
    var progress: String
    var body: some View {
        if achieved {
            VStack{
                Image(acm.imgName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(10)
                Text(acm.name)
            }
        } else {
            VStack{
                Image(acm.imgName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(10)
                    .opacity(0.5)
                Text(acm.name)
                Text(progress)
            }
        }
    }
}

struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementView(achieved: false, acm: Achievement(id: 1, name: "100 Roll", imgName: "ACM1"), progress: "99/100")
    }
}
