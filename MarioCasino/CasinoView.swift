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
    let EnemyHPList = [140, 250, 400, 600, 1000, 1500]
    let EnemyATKList = [40, 30, 30, 60, 100, 150]

    @State var CurrentEnemyHP = 140
    @State var CurrentPlayerHP = 100

    @State var Stats = [10, 100]
    @State var EXP = 0
    @State var playerLevel = 1
    
    //The lower the higher you are on leaderboard
    @State var score = 0
    @State var currentDices = [0,1,2,3]
    
    @State var enemyHitAnimation = false
    @State var playerHitAnimation = false
    
    @State var chooseStatUI = false
    @State var informationUI = false
    @State var resultUI = false
    
    @State var levelResult = "WON!"

    @State var timeRemaining = 10
    @State var isTimerRunning = false
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    func rollDice(){
        currentDices = currentDices.map{ _ in
            Int.random(in: 0...5)
        }
    }
    
    func attack(){
        enemyHitAnimation.toggle()
        for i in currentDices {
            CurrentEnemyHP -= (i + 1) * Stats[0]
        }
        updateEnemy()
    }

    func enemyAttack()
    {
        playerHitAnimation.toggle()
        CurrentPlayerHP -= EnemyATKList[level]
        if CurrentPlayerHP <= 0
        {
            //Go back 1 level if mario died
            //Reset to level 0 if mario died at level 0
            if level > 0 {
                EXP += 1   
                level -= 1
            }
            levelResult = "DIED!"
            playSound(sound: "fail", type: "mp3")
            resultUI = true
            updateLevel()
        }
    }
    
    func updateEnemy()
    {
        if CurrentEnemyHP <= 0 {
            levelResult = "WON!"
            playSound(sound: "win", type: "mp3")
            resultUI = true
            updateEXP()
            if level < 5
            {
                level += 1
                playSound(sound: "crowd-cheer", type: "mp3")
                //TODO: WON
            }
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
            
            VStack(spacing: 100){
                Spacer()
                
                Image("mario")
                    .frame(maxHeight: 0)
                    .offset(x: playerHitAnimation ? -10 : 0)
                    .animation(Animation.default.repeatCount(5))
            }
            
            VStack{
                Button{
                    informationUI = true
                } label: {
                    Text("HOW TO PLAY")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.blue.opacity(0.7)))
                }
                EnemyView(level: level, HP: CurrentEnemyHP, hit: $enemyHitAnimation)
                HStack{
                    DiceView(image: dices[currentDices[0]])
                    DiceView(image: dices[currentDices[1]])
                }
                HStack{
                    DiceView(image: dices[currentDices[2]])
                    DiceView(image: dices[currentDices[3]])
                }
                Button {
                    //The lower the higher you are on leaderboard
                    score += 1;
                    isTimerRunning = true;
                    playSound(sound: "spin", type: "mp3")
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
                HStack{
                    Text("ATK: \(Stats[0])")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.black.opacity(0.7)))
                    Text("HP: \(CurrentPlayerHP)")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.green.opacity(0.7)))
                }
            }
            if chooseStatUI == true {
                ZStack{
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .edgesIgnoringSafeArea(.all)
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.9))
                        .frame(width: 300,height: 200)
                    VStack{
                        Text("LEVEL UP!!!")
                            .modifier(TextWhiteModifier(fontSize: 40))
                            .modifier(CapsuleColorModifier(color: Color.blue.opacity(0.7)))
                        Text("Choose one:")
                        HStack{
                            Button{
                                Stats[0] += 2
                                chooseStatUI = false
                            } label: {
                                Text("Strength")
                                    .modifier(TextWhiteModifier(fontSize: 20))
                                    .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
                            }
                            Button{
                                Stats[1] += 40
                                CurrentPlayerHP = Stats[1]
                                chooseStatUI = false
                            } label: {
                                Text("Vitality")
                                    .modifier(TextWhiteModifier(fontSize: 20))
                                    .modifier(CapsuleColorModifier(color: Color.green.opacity(0.7)))
                            }
                        }
                    }
                }
            }
            if resultUI == true {
                ZStack{
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .edgesIgnoringSafeArea(.all)
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white.opacity(0.9))
                        .frame(width: 300,height: 200)
                    VStack{
                        Text("YOU \(levelResult)")
                            .modifier(TextWhiteModifier(fontSize: 40))
                            .modifier(CapsuleColorModifier(color: Color.blue.opacity(0.7)))
                        Button{
                            resultUI = false
                        } label: {
                            Text("Continue")
                                .modifier(TextWhiteModifier(fontSize: 20))
                                .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
                        }
                    }
                }
            }
            
        }.sheet(isPresented: $informationUI){
            HowToPlayView()
        }
    }
}

struct CasinoView_Previews: PreviewProvider {
    static var previews: some View {
        CasinoView()
    }
}
