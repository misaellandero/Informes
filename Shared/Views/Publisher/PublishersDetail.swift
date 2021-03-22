//
//  PublishersDetail.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI

struct PublishersDetail: View {
    @State var publisher : Publisher
    var body: some View {
        List{
            Text("Nombre: \(publisher.wrappedName)")
            Text("Fecha de nacimiento: \(publisher.birthDateFormated)")
            Text("Edad: \(publisher.age)")
            Text("Fecha de bautizmo: \(publisher.dedicationDateFormated)")
            Text("Años de bautizado: \(publisher.dedicationAges)")
            Text("Privilegio de servicio: \(publisher.wrappedPrivilegeService)") 
            
        }
        .navigationTitle("Datos del publicador")
        .listStyle(SidebarListStyle())
        
    }
}

 
