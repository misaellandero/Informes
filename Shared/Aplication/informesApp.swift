//
//  informesApp.swift
//  Shared
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI

@main
struct informesApp: App {
    //View Model
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
