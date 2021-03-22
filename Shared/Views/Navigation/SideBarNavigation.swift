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
                NavigationLink(destination: Text("Informes")){
                    Label("Informes", systemImage: "chart.bar.doc.horizontal")
                }
                NavigationLink(destination: Text("Reportes")){
                    Label("Reportes", systemImage: "chart.pie.fill")
                }
            }
            .listStyle(SidebarListStyle())
            
            Text("Elige una opcion")
            
            Text("Elige una opcion")
            
        }
        .navigationTitle("App de informes")
        
       
    }
}

struct SideBarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        SideBarNavigation()
    }
}
