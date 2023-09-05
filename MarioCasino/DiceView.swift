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

struct DiceView: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: 100, height: 100)
            .padding(10)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(image: "dice-blue-1")
    }
}
