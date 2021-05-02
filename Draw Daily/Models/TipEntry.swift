//
//  TipEntry.swift
//  Draw Daily
//
//  Created by New on 01/05/2021.
//

import Foundation
import SwiftUI

struct TipEntry: Codable, Identifiable {
    let typename: String
    let id: Int
    
    let steps: Array<String>
}
