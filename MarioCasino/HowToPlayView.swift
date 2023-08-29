//
//  HowToPlayView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 23/08/2023.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        ZStack{
            //Background
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            //Instruction
            Section(header: Text("How To Play")) {
                Text("Roll the dices to attack.")
                Text("When enemy's HP runs out, you win the battle! then advance to the next level.")
                Text("When your HP runs out, you lose the battle! then go back the previous level.")
                Text("By defeating enemies, you gain exp. Which allows you to gain more ATK or HP.")
                Text("You win the game when Bowser is defeated!")
            }
            Image("Bowser")
                .resizable()
                .frame(width: 300, height: 300)
                
        }
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
