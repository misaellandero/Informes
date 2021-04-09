//
//  TanBarNavigation.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI

struct TabBarNavigation: View {
    var body: some View {
        TabView{
            NavigationView{
                PublishersList()
            }
            .navigationTitle("Publicadores")
            .tabItem{
                Label("Publicadores", systemImage: "person.2.fill")
            }
            
            NavigationView{
                ReportList()
            }
            .navigationTitle("Informes")
            .tabItem{
                Label("Informes", systemImage: "chart.bar.doc.horizontal")
            }
            NavigationView{
                SummaryOptionsList()
            }
            .navigationTitle("Reportes")
            .tabItem{
                Label("Reportes", systemImage: "chart.pie.fill")
            }
        }
    }
}

 
