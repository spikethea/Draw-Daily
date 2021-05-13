//
//  Home.swift
//  Draw Daily
//
//  Created by New on 06/04/2021.
//

import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct HomeView: View {
    // Decode JSON
    let drawings = Bundle.main.decode("drawings.json")
    let tips = Bundle.main.tipdecode("tips.json")
    
    @EnvironmentObject var settings: AppSettings
    @EnvironmentObject var searchObjectController: SearchObjectController
    
    // An Array of Strings to Display the current Difficulty chosen
    var difficulties = [
    "Easy",
    "Intermediate",
    "Hard",
    "Expert"
    ]
    
    var thumbnailColumns = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    func getColor() -> Color { // This function just returns a color to where it is called
        switch settings.difficulty {
            case 0: return Color.green
            case 1: return Color.yellow
            case 2: return Color.orange
            case 3: return Color.red
            default: return Color.blue
            }
    }
    
    @FetchRequest(entity: Drawing.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \Drawing.date, ascending: true)
                  ]
    )
    var orders: FetchedResults<Drawing>
    
    @Binding var selectedTab: Int
    
    var body: some View {
        
                    
        NavigationView {
                
                VStack {
                    
                    HStack {
                        if (settings.started) {
                            Text("Start Drawing: \(drawings[settings.drawing].name)")
                                .padding(6)
                                .foregroundColor(Color.purple)
                        } else {
                            Text("No Topic Selected Yet...")
                                .padding(20)
                                .foregroundColor(Color.purple)
                        }
                        
                        Spacer()
                        if settings.started {
                            NavigationLink(destination: CameraView()
                            ) {
                                
                                Label("Snap", systemImage: "camera")
                                    .foregroundColor(Color.purple)
                                    .padding(20)
                                    
                            }
                        }
                            
                    }
                    .border(Color.purple, width: 3)
                    .frame(maxWidth: .infinity)
                    .padding(5)
                    
                    
                    
                    
                    
                    
                        if settings.started {
                            
                            Text("\(difficulties[settings.difficulty]):  \(drawings[settings.drawing].difficulty[settings.difficulty])")
                            
                            NavigationLink(destination: MoodboardView()) {
                                if searchObjectController.results.indices.contains(0) {
                                WebImage(url: URL(string: searchObjectController.results[0].urls.small))
                                    .resizable()
                                    .scaledToFill()
                                        .frame(height: 100, alignment: .center)
                                        .clipped()
                                    .cornerRadius(10)
                                    .overlay(ImageOverlay(topic: "\(drawings[settings.drawing].name) Inspiration.."), alignment: .topLeading)
                                }
                            }.padding(5)
                            .onAppear() {
                                searchObjectController.search()
                        }
                            
                        HStack {
                            Spacer()
                            NavigationLink(destination: TipView(tip: tips[settings.tip])) {
                                Text("Tip of the Day: \(tips[settings.tip].typename)")
                            }
                            .padding(10)
                            Spacer()
                        }
                        .background(Color.newPrimaryColor)
                        .cornerRadius(15)
                        .padding(5)
                            
                        } else {
                            NavigationLink(destination: GenerateView()
                            ) {
                            Image("placeholder-wide")
                                .resizable()
                                .frame(height: 200)
                                .overlay(ImageOverlay(topic: "Click to Start a New Drawing"), alignment: .topLeading)
                                .padding(5)
                            }
                        }
                        
                    
                    Text("Your Latest Drawings")
                   // Showcase Thumbnail of drawings
                    LazyVGrid(columns: thumbnailColumns)  {
                        if orders.count > 0 {
                            Button(action: {selectedTab = 0}
                            ) {
                            Image(uiImage: UIImage(data: orders[orders.count-1].img!)!)
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(2, contentMode: .fit)
                                .cornerRadius(5)
                            }.padding(5)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.lightGray, lineWidth: 1)
                                .frame(height: 150)
                                .scaledToFill()
                                
                                .padding(5)
                        }
                        
                        
                        if orders.count > 1 {
                            Button(action: {selectedTab = 0}
                            ) {
                            Image(uiImage: UIImage(data: orders[orders.count-2].img!)!)
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(2, contentMode: .fit)
                                .cornerRadius(5)
                            }.padding(5)
                            
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.lightGray, lineWidth: 1)
                                .frame(height: 150)
                                .scaledToFill()
                                
                                .padding(5)
                        }

                        
                        
                        if orders.count > 2 {
                            Button(action: {selectedTab = 0}
                            ) {
                            Image(uiImage: UIImage(data: orders[orders.count-3].img!)!)
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(2, contentMode: .fit)
                                .cornerRadius(5)
                            }.padding(5)
                            
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.lightGray, lineWidth: 1)
                                .frame(height: 150)
                                .scaledToFill()
                                
                                .padding(5)
                                
                        }

                    
                    }
                        
                    
                    Spacer()
                }.navigationBarTitle("DrawDaily")
        }
    }
}

struct ImageOverlay: View {
    
    let topic: String
    
    var body: some View {
        ZStack {
            Text(topic)
                .font(.callout)
                .fontWeight(.bold)
                .padding(6)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .padding(6)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

