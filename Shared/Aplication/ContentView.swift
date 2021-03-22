//
//  ContentView.swift
//  Shared
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Group{
            #if os(iOS)
            TabBarNavigation()
            #elseif os(macOS)
            SideBarNavigation()
            #endif
        }
        
    }
}
 
