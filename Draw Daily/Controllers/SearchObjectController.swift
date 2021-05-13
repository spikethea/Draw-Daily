//
//  SearchObjectController.swift
//  Draw Daily
//
//  Created by New on 25/03/2021.
//

import Foundation
import SwiftUI

class SearchObjectController : ObservableObject {
    
    var token = "gQR-YsX0OpwkYpbjhPVi3b4kSR-DtWrR5phwDm2kPMM"
    @Published var results = [Result]()
    @Published var searchText : String = "anime"
    
    func search () {
        let url = URL(string: "https://api.unsplash.com/search/photos?query=\(searchText)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
        print("request: \(request)")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            //print(String(data: data, encoding: .utf8)!)

            do {
                let res = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.results = [Result]()
                    self.results.append(contentsOf: res.results)
                }
                //print(self.results)
            } catch {
                print("catch: \(error)")
            }
        }
        task.resume()
    }
}
