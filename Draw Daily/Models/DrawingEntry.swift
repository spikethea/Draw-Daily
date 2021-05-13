//
//  Drawings.swift
//  Draw Daily
//
//  Created by New on 01/05/2021.
//

import Foundation
import SwiftUI

struct DrawingEntry: Codable, Identifiable {
    let name: String
    let id: Int
    
    let difficulty: Array<String>
    let tips: Array<Int>
}

//struct Difficulty: Codable {
//    let easy: String
//    let intermediate: String
//    let hard: String
//    let expert: String
//}

//struct Tips: Codable {
//    let easy: Int
//    let intermediate: Int
//    let hard: Int
//    let expert: Int
//}
