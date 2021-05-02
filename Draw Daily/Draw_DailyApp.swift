//
//  Draw_DailyApp.swift
//  Draw Daily
//
//  Created by New on 22/03/2021.
//

import SwiftUI
import CoreData


@main
struct Draw_DailyApp: App {
    
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    
    
    @State var showOrderSheet = false
    
    
    // Creating a global environment and placing it into the environment
    @ObservedObject var searchObjectController: SearchObjectController = SearchObjectController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(self.searchObjectController)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
    
}
