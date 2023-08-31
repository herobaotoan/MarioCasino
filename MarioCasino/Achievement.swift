//
//  Achievement.swift
//  MarioCasino
//
//  Created by Toan Tran Chi on 31/08/2023.
//

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
