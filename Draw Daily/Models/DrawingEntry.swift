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
    
    let difficulty: Difficulty
}

struct Difficulty: Codable {
    let easy: String
    let intermediate: String
    let hard: String
    let expert: String
}
