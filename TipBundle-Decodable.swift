//
//  TipBundle-Decodable.swift
//  Draw Daily
//
//  Created by New on 01/05/2021.
//

import Foundation

extension TipBundle {
    func decode(_ file: String) -> [TipEntry] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([TipEntry].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
