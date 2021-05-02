//
//  Result.swift
//  Draw Daily
//
//  Created by New on 25/03/2021.
//

import Foundation
import SwiftUI

struct Results : Codable {
    var total : Int
    var results : [Result]
}

struct Result : Codable {
    var id : String
    var description : String?
    var urls : URLs
}

struct URLs : Codable {
    var small : String
}
