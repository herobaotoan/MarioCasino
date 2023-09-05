/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Chi Toan
  ID: s3891637
  Created  date: 09/08/2023
  Last modified: 09/08/2023
  Acknowledgement: resources from canvas and google, no AI used. 
*/

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


