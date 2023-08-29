//
//  ContentView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        @Binding var enable: Bool
        @Binding var result: String
        ZStack{
            Rectangle()
                .fill(Color.black.opacity(0.8))
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white.opacity(0.9))
                .frame(width: 300,height: 200)
            VStack{
                Text("YOU \(result)")
                    .modifier(TextWhiteModifier(fontSize: 40))
                    .modifier(CapsuleColorModifier(color: Color.blue.opacity(0.7)))
                Button{
                    enable = false
                } label: {
                    Text("Continue")
                        .modifier(TextWhiteModifier(fontSize: 20))
                        .modifier(CapsuleColorModifier(color: Color.red.opacity(0.7)))
                }
            }
        }
    }
}

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ResultView(enable: true)
//     }
// }
