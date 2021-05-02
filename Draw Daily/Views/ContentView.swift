//
//  ContentView.swift
//  Draw Daily
//
//  Created by New on 22/03/2021.
//

import SwiftUI
import UIKit
import CoreData

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.purple

      }
    
    @FetchRequest(entity: Drawing.entity(),
                  sortDescriptors: [
                    //NSSortDescriptor(keyPath: \Drawing.img, ascending: true),
                    NSSortDescriptor(keyPath: \Drawing.date, ascending: true)
                  ]
    )
    var orders: FetchedResults<Drawing>
    
    var body: some View {
//            List {
//                ForEach(orders, id: \.self, content: { drawing in
//                    Text(drawing.date ?? "Unknown")
//                })
//            }

        
        
        TabView {
            MoodboardView()
                .tabItem{
                    Label("mood", systemImage: "lightbulb")
                }
            HomeView()
                .tabItem{
                    Label("home", systemImage: "list.dash")
                }
            SketchbookView()
                .tabItem{
                    Label("sketchbook", systemImage: "pencil")
                }
            TipsView()
                .tabItem{
                    Label("tips", systemImage: "book")
                }


        }.accentColor(.white)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
