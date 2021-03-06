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
    
    @State  var name : String = ""
    @State  var birthDate = Date()
    @State  var dedicationDate = Date()
    @State  var privilgeService = PrivilegesOfService.publisher
    
    // MARK: - To Edit data
    @State var publisherToEdit : Publisher?
    @State var editMode = false
    
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
                        if editMode {
                            Text("\(Image(systemName: "person.fill.badge.plus")) Actualizar")
                        } else {
                            Text("\(Image(systemName: "person.fill.badge.plus")) Guardar")
                        }
                        Spacer()
                    }.foregroundColor(.white)
                    
                    
                }.listRowBackground(Color.accentColor)
                
                Button(action:closeModal){
                    HStack{
                        Spacer()
                        Text("\(Image(systemName: "xmark")) cancelar")
                        Spacer()
                    }.foregroundColor(.white)
                    
                    
                }
                .listRowBackground(Color.red)
                
                #elseif os(macOS)
                HStack{
                    Button(action:closeModal){
                        HStack{
                            Spacer()
                            Text("\(Image(systemName: "xmark")) cancelar")
                            Spacer()
                        }
                    }
                    .accentColor(Color.accentColor)
                    
                    Spacer()
                    Button(action:savePublisher){
                        HStack{
                            Spacer()
                            if editMode {
                                Text("\(Image(systemName: "person.fill.badge.plus")) Actualizar")
                            } else {
                                Text("\(Image(systemName: "person.fill.badge.plus")) Guardar")
                            }
                            Spacer()
                        }
                    }
                    .accentColor(Color.accentColor)
                }
                #endif
                
                
            }
             
        }.navigationTitle("Nuevo Publicador")
    }
    
    func savePublisher(){
        
        if editMode {
            
            //Save changes
            if let pubisher = publisherToEdit {
                pubisher.name = self.name
                pubisher.birthday = self.birthDate
                pubisher.dedicationDate = self.dedicationDate
                
                switch privilgeService {
                case .publisher :
                    pubisher.privilegeService = 0
                case .auxPioner :
                    pubisher.privilegeService = 1
                case .regPioner :
                    pubisher.privilegeService = 2
                }
            }
            
        } else {
            //Save new
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
            
        }
         
        
        try? self.moc.save()
        closeModal()
        
    }
    
    func closeModal(){
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

 
