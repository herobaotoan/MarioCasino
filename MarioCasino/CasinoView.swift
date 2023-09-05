/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Chi Toan
  ID: s3891637
  Created  date: 09/08/2023
  Last modified: 6/09/2023
  Acknowledgement: resources from canvas and google, no AI used. 
*/

import SwiftUI

struct CasinoView: View {
    //

    let dices = ["dice-blue-1", "dice-blue-2", "dice-blue-3", "dice-blue-4", "dice-blue-5", "dice-blue-6"]
    //Enemy properties
    let EnemyHPList = [140, 250, 400, 500, 700, 800]
    let EnemyATKList = [40, 30, 30, 50, 70, 80]
    //Level properties
    @State var level = 0
    @State var CurrentEnemyHP = 140
    @State var CurrentPlayerHP = 100
    //Player properties
    @State var Stats = [10, 100]
    @State var EXP = 0
    @State var playerLevel = 1
    //The lower the higher you are on leaderboard
    @State var score = 0
    @State var currentDices = [0,1,2,3]
    //Animation toggler
    @State var enemyHitAnimation = false
    @State var playerHitAnimation = false
    //UI toggler
    @State var mainMenuUI = true
    @State var informationUI = false
    @State var leaderboardUI = false
    @State var resultUI = false
    @State var levelResult = "WON!"
    @State var chooseStatUI = false
    @State var victoryUI = false
    @State var achievementUI = false
    //Leaderboard
    @State var username = "MARIO"
    @State var leaderboard : [String: Int] = UserDefaults.standard.object(forKey: "Leaderboard") as? [String: Int] ?? ["Developer":99]
    //Achievement
    let ACM1 = Achievement(id: 1, name: "100 Roll", imgName: "ACM1")
    let ACM2 = Achievement(id: 2, name: "100 Dead", imgName: "ACM2")
    let ACM3 = Achievement(id: 3, name: "Win the game", imgName: "ACM3")
    @State var achievement : [Bool] = UserDefaults.standard.array(forKey: "Achievement") as? [Bool] ?? [false,false,false]
    @State var achievementIndex: Achievement = Achievement(id:99, name:"Empty", imgName:"empty")
    @State var achievementProgression : [Int] = UserDefaults.standard.array(forKey: "Progression") as? [Int] ?? [0,0,0]
//    @State var ACM1Progress = achievementProgression[0]
//    @State var ACM2Progress = achievementProgression[0]
    //Timer
    @State var timeRemaining = 10
    @State var isTimerRunning = false
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    
    func playBGM(){
        playSound(sound: "bgm", type: "mp3")
    }
    func rollDice(){
        currentDices = currentDices.map{ _ in
            Int.random(in: 0...5)
        }
    }
    
    func attack(){
        //Start enemy shaking animation
        enemyHitAnimation.toggle()
        //Decrease enemy HP by each dice multiply with player ATK
        for i in currentDices {
            CurrentEnemyHP -= (i + 1) * Stats[0]
        }
        updateEnemy()
        //Achievement Roll 100 times
        if !achievement[0]
        {
//            ACM1Progress += 1
            achievementProgression[0] += 1
            UserDefaults.standard.set(achievementProgression, forKey: "Progression")
            if achievementProgression[0] >= 100
            {
                achievementIndex = ACM1
                achievementUI = true
                achievement[0] = true
                UserDefaults.standard.set(achievement, forKey: "Achievement")
            }
        }
    }

    func enemyAttack()
    {
        //Start player shaking animation
        playerHitAnimation.toggle()
        //Decrease player HP by enemy ATK
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
            //Achievement die 100 times
            if !achievement[1]
            {
//                ACM2Progress += 1
                achievementProgression[1] += 1
                //update and save progression
                UserDefaults.standard.set(achievementProgression, forKey: "Progression")
                if achievementProgression[1] >= 100
                {
                    achievementIndex = ACM2
                    achievementUI = true
                    achievement[1] = true
                    //Save achievement
                    UserDefaults.standard.set(achievement, forKey: "Achievement")
                }
            }
        }
    }
    
    func updateEnemy()
    {
        //Advance 1 level when enemy died
        if CurrentEnemyHP <= 0 {
            levelResult = "WON!"
            playSound(sound: "win", type: "mp3")
            resultUI = true
            updateEXP()
            if level < 5
            {
                level += 1
            } else {
                playSound(sound: "crowd-cheer", type: "mp3")
                victoryUI = true
                //Reset everything
                level = 0
                Stats = [10, 100]
                EXP = 0
                playerLevel = 1
                //Achievement defeat Bowser 1 time
                if !achievement[2]
                {
                    achievementProgression[2] = 1
                    UserDefaults.standard.set(achievementProgression, forKey: "Progression")
                    achievementIndex = ACM3
                    achievementUI = true
                    achievement[2] = true
                    //Save achievement
                    UserDefaults.standard.set(achievement, forKey: "Achievement")
                }
            }
            
            updateLevel()
        //If enemy still alive, attack player
        } else {
            enemyAttack()
        }
    }

    func updateEXP()
    {
        //Gain exp base on current level
        EXP += level + 1
        //The higher player level the harder to level up
        if (EXP >= playerLevel * 2)
        {
            levelUp()
        }
    }
    
    func updateLevel()
    {
        //Reset enemy and player HP
        CurrentEnemyHP = EnemyHPList[level]
        CurrentPlayerHP = Stats[1]
    }

    func levelUp()
    {
        //Enable level up UI
        playerLevel += 1
        chooseStatUI = true
        EXP = 0
    }

    var body: some View {
        ZStack{
            //Background
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .leading, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            //Mario image on the bottom background
            VStack(spacing: 100){
                Spacer()
                
                Image("mario")
                    .frame(maxHeight: 0)
                    .offset(x: playerHitAnimation ? -10 : 0)
                    .animation(Animation.default.repeatCount(5))
            }
            
            VStack{
                HStack{
                    //How to play button
                    Button{
                        informationUI = true
                    } label: {
                        Text("HOW TO PLAY")
                            .modifier(TextWhiteModifier(fontSize: 20))
                            .modifier(CapsuleColorModifier(color: Color.blue.opacity(0.7)))
                    }
                    Button{
                        mainMenuUI = true
                    } label: {
                        Text("BACK")
                            .modifier(TextWhiteModifier(fontSize: 20))
                            .modifier(CapsuleColorModifier(color: Color.blue.opacity(0.7)))
                    }
                }
                //ENEMY
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
                                Stats[0] += 5
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
                ResultView(enable: $resultUI, result: $levelResult)
            }
            if victoryUI == true {
                VictoryView(enable: $victoryUI, score: $score, username: $username, error: false, dictionary: $leaderboard)
            }
            if achievementUI == true {
                AchievementAlertView(enable: $achievementUI, achievement: $achievementIndex)
            }
            if mainMenuUI == true {
                MenuView(enable: $mainMenuUI, howToPlayViewEnable: $informationUI, leaderboardViewEnable: $leaderboardUI)
            }
            if leaderboardUI == true {
                LeaderboardView(enable: $leaderboardUI, dictionary: $leaderboard, achievement: $achievement, progression: $achievementProgression)
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
