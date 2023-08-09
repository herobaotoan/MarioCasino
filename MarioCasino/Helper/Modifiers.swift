//
//  Modifiers.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 09/08/2023.
//

import SwiftUI

struct CapsuleColorModifier: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            .background(
                Capsule()
                    .foregroundColor(color))
    }
}


struct TextWhiteModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .font(.system(size: fontSize, weight: .bold))
    }
}


