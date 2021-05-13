//
//  GenerateView.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import Foundation
import SwiftUI
import UIKit

//https://www.simpleswiftguide.com/advanced-swiftui-button-styling-and-animation/
struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            
            .padding()
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}

struct GenerateView: View {
    // Load JSON
    let drawings = Bundle.main.decode("drawings.json")
    
    
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var searchObjectController: SearchObjectController
    
    
    @State private var difficulty: Int = 0
    
    var difficulties = [
    "easy",
    "intermediate",
    "hard",
    "expert"
    ]
    
    //Return Different color depending on the
    func getColor() -> Color { // This function just returns a color to where it is called
            switch difficulty {
            case 0: return Color.green
            case 1: return Color.yellow
            case 2: return Color.orange
            case 3: return Color.red
            default: return Color.blue
            }
    }
    
    var body: some View {
        ZStack {
            Color(red: 115 / 255, green: 93 / 255, blue: 120 / 255)
                .ignoresSafeArea()
            VStack{
                
                Text("Generate a Topic")
                    .padding()
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                VStack {
                    Text("Difficulty: \(difficulties[difficulty])")
                        .padding(10)
                        .foregroundColor(getColor())
                }
                .border(getColor(), width: 2)
                .padding(5)
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    if difficulty < 3 {
                        difficulty += 1
                    } else {
                        difficulty = 0
                    }
                })
                {
                    Image("present")
                        .resizable()
                        .padding(10)
                        .frame(maxWidth: .infinity, maxHeight: 800)
                        .aspectRatio(1, contentMode: .fit)
                        
                    
                }
                .buttonStyle(GradientButtonStyle())
                
                
                
                
                Button(action: {
                    print("topic changed to\(searchObjectController.searchText)")
                    
                    //let randomTopics = ["forest", "tables", "dragon", "cave", "fruit", "table"]
                    
                    let randomInt = Int.random(in: 0..<drawings.count-1)
                    
                    print(randomInt);
                    
                    settings.drawing.self = drawings[randomInt].id
                    settings.difficulty.self = difficulty
                    settings.tip.self = drawings[randomInt].tips[settings.difficulty]// Using the difficulty I set the tip value for better code readability
                    
                    searchObjectController.searchText.self = drawings[randomInt].name
                    
                    self.searchObjectController.search()
                    
                    //
                    settings.started.self = true
                }
                ) {
                    Text("Generate")
                        .padding(15)
                        
                        .background(Color.lightColor)
                        .foregroundColor(.black)
                        .cornerRadius(25)
                }.padding(25)
                
            }
        }
    }
        
}

struct GenerateView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateView()
    }
}
