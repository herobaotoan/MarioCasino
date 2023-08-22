//
//  CasinoView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct CasinoView: View {
    @State var level = 0

    let dices = ["dice-blue-1", "dice-blue-2", "dice-blue-3", "dice-blue-4", "dice-blue-5", "dice-blue-6"]
    let EnemyHPList = [36, 48, 80, 130, 200, 300]
    let EnemyATKList = [20, 30, 30, 60, 100, 150]

    @State var CurrentEnemyHP = EnemyHPList[level]
    @State var CurrentPlayerHP = Stats[1]

    @State var Stats = [10, 100]
    @State var EXP = 0
    var playerLevel = 1

    @State var score = 0
    @State var currentDices = [0,1,2,3]
    

    @State var chooseStatUI = false

    @State var timeRemaining = 10
    @State var isTimerRunning = false
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    func rollDice(){
        currentDices = currentDices.map{ _ in
            Int.random(in: 0...5)
        }
    }
    
    func attack(){
        for i in currentDices {
            CurrentEnemyHP -= (i + 1) * Stats[0]
        }
        updateEnemy()
    }

    func enemyAttack()
    {
        CurrentPlayerHP -= EnemyATKList[level]
        if CurrentEnemyHP <= 0
        {
            //Go back 1 level if mario died
            //Reset to level 0 if mario died at level 0
            if level > 0 {
                EXP += 1   
                level -= 1
            }
            updateLevel()
        }
    }
    
    func updateEnemy()
    {
        if CurrentEnemyHP <= 0 {
            updateEXP()
            level += 1
            updateLevel()
        } else {
            enemyAttack()
        }
    }

    func updateEXP()
    {
        EXP += level + 1
        if (EXP >= playerLevel * 2)
        {
            levelUp()
        }
    }
    
    func updateLevel()
    {
        CurrentEnemyHP = EnemyHPList[level]
        CurrentPlayerHP = Stats[1]
    }

    func levelUp()
    {
        playerLevel += 1
        chooseStatUI = true
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
                EnemyView(level: level, HP: CurrentEnemyHP)
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
                            attack()
                            isTimerRunning = false
                            timeRemaining = 10
                        }
                    }
                }
            }
            if chooseStatUI == true {
                VStack{
                    Text("LEVEL UP!!!")
                        .modifier(TextWhiteModifier(fontSize: 40))
                        .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
                    Text("Choose one:")
                    HStack{
                        Button{
                            Stats[0] += 2
                            chooseStatUI = false
                        } label: {
                            Text("Strength")
                        }
                        Button{
                            Stats[1] += 40
                            chooseStatUI = false
                        } label: {
                            Text("Vitality")
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
