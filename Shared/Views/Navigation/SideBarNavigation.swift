//
//  SideBarNavigation.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI

struct SideBarNavigation: View {
    var body: some View {
        
        NavigationView {
            List{
                NavigationLink(destination: PublishersList()){
                    Label("Publicadores", systemImage: "person.2.fill")
                }
                NavigationLink(destination: ReportList()){
                    Label("Informes", systemImage: "chart.bar.doc.horizontal")
                }
                NavigationLink(destination: SummaryOptionsList()){
                    Label("Reportes", systemImage: "chart.pie.fill")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(width: 200)
            
            Text("Elige una opcion")
                .frame(width: 300)
            Text("Elige una opcion")
                .frame(width: 400)
            
        }
        .navigationTitle("App de informes")
        
       
    }
}

struct SideBarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        SideBarNavigation()
    }
}
