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
    @State var showEditPublisherForm = false
    //Model View de Coredate
    @Environment(\.managedObjectContext) var moc
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
                }.onDelete(perform:  deleteItem)
                
            }
            
        }
        .navigationTitle("Datos del publicador")
        //.listStyle(SidebarListStyle())
        .toolbar{
            ToolbarItem(placement: .principal){
                 Text(publisher.wrappedName)
            }
            ToolbarItem(placement: .primaryAction){
                Button(action:showForm){
                    Label("Nuevo informe", systemImage: "plus.circle")
                }
                .sheet(isPresented: $showNewReportForm){
                    ReportNewForm(publisher: publisher)
                }
            }
            ToolbarItem(placement: .primaryAction){
                Button(action:showEditForm){
                    Label("Editar", systemImage: "pencil")
                }
                .sheet(isPresented: $showEditPublisherForm){
                    PublishersNewForm(name: publisher.wrappedName, birthDate: publisher.wrappedBirthDate, dedicationDate : publisher.wrappedDedicationDate, privilgeService : publisher.wrappedPrivilegeServiceEnum , publisherToEdit: publisher, editMode: true )
                }
            }
        }
       
        
    }
 
    func deleteItem(at offsets: IndexSet) {
        
        for offset in offsets {
            //encontrar esta revisita en dentro de las revisitas del territorio
            let report =  self.publisher.reportsArray[offset]
            //borarlo del context
            self.moc.delete(report)
        }
         
        try? self.moc.save()
        
       }
    
    func showForm(){
        showNewReportForm.toggle()
    }
    
    func showEditForm(){
        showEditPublisherForm.toggle()
    }
}

 
