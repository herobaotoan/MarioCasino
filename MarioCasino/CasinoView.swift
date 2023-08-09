//
//  CasinoView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct CasinoView: View {
    let dices = ["dice-blue-1", "dice-blue-2", "dice-blue-3", "dice-blue-4", "dice-blue-5", "dice-blue-6"]

    @State var score = 0
    @State var currentDices = [0,1,2,3]
    
    @State var timeRemaining = 10
    @State var isTimerRunning = false
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    func rollDice(){
        currentDices = currentDices.map{ _ in
            Int.random(in: 0...5)
        }
    }
    
    func updateScore(){
        for i in currentDices {
            score += (i + 1) * 1000
        }
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .leading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 350, height: 250)
                Text("Score: \(score)")
                    .modifier(TextWhiteModifier(fontSize: 20))
                    .modifier(CapsuleColorModifier(color: Color.black.opacity(0.3)))
                
                HStack{
                    DiceView(image: dices[currentDices[0]])
                    DiceView(image: dices[currentDices[1]])
                }
                HStack{
                    DiceView(image: dices[currentDices[2]])
                    DiceView(image: dices[currentDices[3]])
                }
                Button {
                    isTimerRunning = true;
                } label: {
                    Text("Roll")
                        .modifier(TextWhiteModifier(fontSize: 40))
                        .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
                }
                .onReceive(timer) { _ in
                    if isTimerRunning {
                        if timeRemaining > 0 {
                            timeRemaining -= 1
                            self.rollDice()
                        }
                        if timeRemaining == 0 {
                            updateScore()
                            isTimerRunning = false
                            timeRemaining = 10
                        }
                    }
                }
            }
            
        }
    }
}

struct CasinoView_Previews: PreviewProvider {
    static var previews: some View {
        CasinoView()
    }
}
