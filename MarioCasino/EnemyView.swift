//
//  DiceView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct EnemyView: View {
    var level: Int
    var HP: Int

    let names = ["Goomba", "Koopa", "Piranha Plant", "Boo", "Magikoopa", "Bowser"]
    var body: some View {
        VStack{
            HStack{
                Text(names[level])
                    .modifier(TextWhiteModifier(fontSize: 20))
                    .modifier(CapsuleColorModifier(color: Color.black.opacity(0.3)))
                Spacer()
                Text("HP: \(HP)")
                    .modifier(TextWhiteModifier(fontSize: 20))
                    .modifier(CapsuleColorModifier(color: Color.black.opacity(0.3)))
            }
            Image(names[level])
                .resizable()
                .frame(width: 300, height: 300)
        }
    }
}

struct EnemyView_Previews: PreviewProvider {
    static var previews: some View {
        EnemyView(level: 0, HP: 30)
    }
}
