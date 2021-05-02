//
//  SearchObject.swift
//  Draw Daily
//
//  Created by New on 25/03/2021.
//

import Foundation
import SwiftUI

class SearchObjectController : ObservableObject {
    static let shared = SearchObjectController()
    private init() {}
    
    @Published var results = []()
    
}
