//
//  DiceView.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct DiceView: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 100, height: 100)
            .padding(20)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(image: "dice-blue-1")
    }
}
