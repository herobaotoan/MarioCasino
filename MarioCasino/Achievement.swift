/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Tran Chi Toan
  ID: s3891637
  Created  date: 29/08/2023
  Last modified: 5/09/2023
  Acknowledgement: resources from canvas and google, no AI used. 
*/

import Foundation
import SwiftUI

struct Achievement: Identifiable, Codable{
    var id: Int
    var name: String
    var imgName: String
    
    var image: Image {
        Image(imgName)
    }
}
