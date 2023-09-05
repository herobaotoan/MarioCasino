//
//  AchievementView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 31/08/2023.
//

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
