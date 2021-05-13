//
//  Draw_DailyApp.swift
//  Draw Daily
//
//  Created by New on 22/03/2021.
//

import SwiftUI
import CoreData



class AppSettings: ObservableObject {
    @Published var drawing = 0
    @Published var difficulty = 0
    @Published var tip = 0
    
    @Published var started = false
}


@main
struct Draw_DailyApp: App {
    
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    @StateObject var settings = AppSettings()
    
    @State var showOrderSheet = false
    
    
    // Creating a global environment and placing it into the environment
    @ObservedObject var searchObjectController: SearchObjectController = SearchObjectController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(self.searchObjectController)
                .environmentObject(settings)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
    
}
