//
//  GenerateView.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import Foundation
import SwiftUI
import UIKit


struct GenerateView: View {
    
    let drawings = Bundle.main.decode("drawings.json")
    
    
    
    @EnvironmentObject var searchObjectController: SearchObjectController
    
    
    @State private var celsius: Double = 0
    
    
    
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 93 / 255, blue: 120 / 255)
                .ignoresSafeArea()
            VStack{
                Text("\(drawings.count)")
                Text("Generate a Random Idea")
                    .padding()
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                Image("placeholder")
                Slider(value: $celsius, in: -100...100)
                    .padding()
                Button("Generate") {
                    print("topic changed to\(searchObjectController.searchText)")
                    
                    //let randomTopics = ["forest", "tables", "dragon", "cave", "fruit", "table"]
                    
                    let randomInt = Int.random(in: 0..<drawings.count-1)
                    
                    print(randomInt);
                    
                    searchObjectController.searchText.self = drawings[randomInt].name
                    
                    self.searchObjectController.search()
                }
                Spacer()
            }
        }
    }
        
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
