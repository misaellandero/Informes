//
//  PublishersNewForm.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI

struct PublishersNewForm: View {
    //Model View de Coredate
    @Environment(\.managedObjectContext) var moc
    
    // MARK: - To close the sheet
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name : String = ""
    @State private var birthDate = Date()
    @State private var dedicationDate = Date()
    @State private var privilgeService = PrivilegesOfService.publisher
    
    var body: some View {
        List{
            
            Section(header: Text("Datos del publicador")) {
                TextField("Nombre", text: $name)
                
                DatePicker("Fecha de nacimiento", selection: $birthDate)
                
                DatePicker("Fecha de bautizmo", selection: $dedicationDate)
                
                Picker("Privilegio", selection: $privilgeService){
                    ForEach(PrivilegesOfService.allCases, id: \.self){ value in
                        Text(value.localizedName)
                            .tag(value)
                    }
                }
            }
            
            
            Section{
                #if os(iOS)
                Button(action:savePublisher){
                    HStack{
                        Spacer()
                        Text("\(Image(systemName: "person.fill.badge.plus")) Guardar")
                        Spacer()
                    }.foregroundColor(.white)
                }.listRowBackground(Color.accentColor)
                
                #elseif os(macOS)
                HStack{
                    Spacer()
                    Button(action:savePublisher){
                        HStack{
                            Spacer()
                            Text("\(Image(systemName: "person.fill.badge.plus")) Guardar")
                            Spacer()
                        }.foregroundColor(.white)
                    }
                    .accentColor(Color.accentColor)
                }
                #endif
                
                
            }
             
        }.navigationTitle("Nuevo Publicador")
    }
    
    func savePublisher(){
        
        let newPublisher = Publisher(context: self.moc)
        newPublisher.id = UUID()
        newPublisher.name = self.name
        newPublisher.birthday = self.birthDate
        newPublisher.dedicationDate = self.dedicationDate
        
        
        switch privilgeService {
        case .publisher :
            newPublisher.privilegeService = 0
        case .auxPioner :
            newPublisher.privilegeService = 1
        case .regPioner :
            newPublisher.privilegeService = 2
        }
        
        try? self.moc.save()
        self.presentationMode.wrappedValue.dismiss()
        
    }
}

 
