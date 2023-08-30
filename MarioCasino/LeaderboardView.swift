//
//  TestView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var enable: Bool
    @State var timeRemaining = 10
    @Binding var dictionary: [String: Int]
    
    
    
    var body: some View {
        let sortedDict = dictionary.sorted(by: {$0.value < $1.value})
        let keys = sortedDict.map{$0.key}
        let values = sortedDict.map{$0.value}
        VStack{
            Button{
                enable = false
            } label: {
                Text("Continue")
                    .modifier(TextWhiteModifier(fontSize: 20))
                    .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
            }
            
            List {
                ForEach(keys.indices) {index in
                    HStack {
                        Text("\(keys[index])")
                        Text("\(values[index])")
                    }
                }
            }
        }
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaderboardView()
//    }
//}
