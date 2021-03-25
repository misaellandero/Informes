//
//  PublishersDetail.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI
  
struct PublishersDetail: View {
    
    @State var publisher : Publisher
    @State var showNewReportForm = false
 
    var body: some View {
        List{
            
            Section(header: Text("Datos del publicador")) {
                Text("Nombre: \(publisher.wrappedName)")
                Text("Fecha de nacimiento: \(publisher.birthDateFormated)")
                Text("Edad: \(publisher.age)")
                Text("Fecha de bautizmo: \(publisher.dedicationDateFormated)")
                Text("Años de bautizado: \(publisher.dedicationAges)")
                Text("Privilegio de servicio: \(publisher.wrappedPrivilegeService)")
            }
            
            Section(header: Text("Informes")) {
               
                ForEach(publisher.reportsArray, id: \.id){ report in
                    ReportsRow(report: report)
                }
                
            }
            
        }
        .navigationTitle("Datos del publicador")
        .listStyle(SidebarListStyle())
        .toolbar{
            ToolbarItem(placement: .principal){
                 Text(publisher.wrappedName)
            }
            ToolbarItem(placement: .primaryAction){
                Button(action:showForm){
                    Label("Nuevo informe", systemImage: "plus.circle")
                }
            }
        }
        .sheet(isPresented: $showNewReportForm){
            ReportNewForm(publisher: publisher)
        }
        
    }
    
    func showForm(){
        showNewReportForm.toggle()
    }
}

 
