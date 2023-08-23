//
//  Enemy.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

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
