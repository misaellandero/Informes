//
//  PublishersList.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI
import CoreData

struct PublishersList: View {
    
    @FetchRequest(entity: Publisher.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Publisher.dedicationDate, ascending: true)]) var publishers: FetchedResults<Publisher>
    
    //Model View de Coredate
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAddForm = false
    
    var body: some View {
        List{
            if publishers.count < 1 {
                Text("Aun no has registrado ningun publicador")
            } else {
                ForEach(publishers, id: \.id){ publisher in
                    NavigationLink(destination: PublishersDetail(publisher: publisher)){
                        PublishersRow(publisher: publisher)
                    }
                }.onDelete(perform: deleteItem)
            }
            
        }
        .toolbar{
            ToolbarItem(placement: .primaryAction){
                Button(action:showForm){
                    Label("Nuevo", systemImage: "person.fill.badge.plus")
                }
            }
        }
        .sheet(isPresented: $showingAddForm){
            PublishersNewForm()
        }
    }
    
    func showForm(){
        showingAddForm.toggle()
    }
    
    
    func deleteItem(at offsets: IndexSet) {
        
        for offset in offsets {
            let published =  self.publishers[offset]
            self.moc.delete(published)
        }
         
        try? self.moc.save()
        
       }
}

struct PublishersList_Previews: PreviewProvider {
    static var previews: some View {
        PublishersList()
    }
}
