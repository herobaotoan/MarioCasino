/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Chi Toan
  ID: s3891637
  Created  date: 09/08/2023
  Last modified: 23/08/2023
  Acknowledgement: resources from canvas and google, no AI used. 
*/

import SwiftUI

struct EnemyView: View {
    var level: Int
    var HP: Int
    
    @Binding var hit: Bool
    
    let names = ["Goomba", "Koopa", "Piranha Plant", "Boo", "Magikoopa", "Bowser"]
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text(names[level])
                    .modifier(TextWhiteModifier(fontSize: 20))
                    .modifier(CapsuleColorModifier(color: Color.black.opacity(0.3)))
                
                Text("HP: \(HP)")
                    .modifier(TextWhiteModifier(fontSize: 20))
                    .modifier(CapsuleColorModifier(color: Color.black.opacity(0.3)))
                Spacer()
            }
            Image(names[level])
                .resizable()
                .frame(width: 300, height: 300)
                .offset(x: hit ? -10 : 0)
                .animation(Animation.default.repeatCount(5))
        }
    }
}

//struct EnemyView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnemyView(level: 0, HP: 30,)
//    }
//}
