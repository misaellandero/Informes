//
//  ReportNewForm.swift
//  informes (iOS)
//
//  Created by Francisco Misael Landero Ychante on 24/03/21.
//

import SwiftUI

struct ReportNewForm: View {
    
    //Model View de Coredate
    @Environment(\.managedObjectContext) var moc
    
    // MARK: - To close the sheet
    @Environment(\.presentationMode) var presentationMode
    
    @State var publisher : Publisher
    @State var date = Date()
    @State var hours : Double = 0.0
    @State var pubs : Int = 0
    @State var returnVisits : Int  = 0
    @State var studies : Int  = 0
    @State var videos : Int  = 0
    @State var observations : String = ""
    
    var body: some View {
        List{
            Section(header: Text("Datos del iforme") ){
                DatePicker("Fecha de informe", selection: $date)
                
                Stepper("Publicaciones", value: $pubs, step: 1)
                
                Stepper("Videos", value: $studies, step: 1)
                
                Stepper("Horas", value: $hours, in: 0...800 , step: 0.25)
                Stepper("Revisitas", value: $returnVisits, step: 1)
                Stepper("Estudios", value: $studies, step: 1)
                TextField("Observaciones", text: $observations)
            }
             
            Section{
                #if os(iOS)
                Button(action:savePublisher){
                    HStack{
                        Spacer()
                        Text("\(Image(systemName: "plus.circle")) Guardar")
                        Spacer()
                    }.foregroundColor(.white)
                }.listRowBackground(Color.accentColor)
                
                #elseif os(macOS)
                HStack{
                    Spacer()
                    Button(action:saveReport){
                        HStack{
                            Spacer()
                            Text("\(Image(systemName: "plus.circle")) Guardar")
                            Spacer()
                        }.foregroundColor(.white)
                    }
                    .accentColor(Color.accentColor)
                }
                #endif
            }
        }
    }
    
    func saveReport(){
        
        let newReport = Report(context: moc)
        newReport.id = UUID()
        newReport.publisher = self.publisher
        newReport.date = self.date
        newReport.hours = self.hours
        newReport.pubs = Int16(self.pubs)
        newReport.returnVisits = Int16(self.returnVisits)
        newReport.studies = Int16(self.studies)
        newReport.videos = Int16(self.videos)
        newReport.observations = self.observations
        
        try? self.moc.save()
        self.presentationMode.wrappedValue.dismiss()
    }
}

 
