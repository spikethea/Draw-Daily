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
    // Making a request to fetch the core data objects
    @FetchRequest(entity: Drawing.entity(),
                  sortDescriptors: [
                    //NSSortDescriptor(keyPath: \Drawing.img, ascending: true),
                    NSSortDescriptor(keyPath: \Drawing.date, ascending: true)
                  ]
    )
    var orders: FetchedResults<Drawing>
    
    
    // Programmatically Switiching Tab Views
    @State private var selectedTab = 1
    
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            SketchbookView()
                .tabItem{
                    Label("sketchbook", systemImage: "pencil")
            }
            .tag(0)
            
            HomeView(selectedTab: $selectedTab)
                .tabItem{
                    Label("home", systemImage: "list.dash")
            }.tag(1)
            
            TipsView()
                .tabItem{
                    Label("tips", systemImage: "book")
            }.tag(2)
            


        }
        .accentColor(.white)
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
