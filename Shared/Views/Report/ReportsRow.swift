//
//  ReportsRow.swift
//  informes (iOS)
//
//  Created by Francisco Misael Landero Ychante on 24/03/21.
//

import SwiftUI

struct ReportsRow: View {
    let report : Report
    var body: some View {
        VStack(alignment:.leading){
            Divider()
            HStack{
                Text(report.dateFormated)
                    .font(.caption)
                Spacer()
            }
            HStack{
              
                ReportValueCol(name: "Publicaciones", value: "\(report.pubs)")
              
                ReportValueCol(name: "Videos", value: "\(report.videos)")
              
                ReportValueCol(name: "Horas", value: String(format: "%.2f", report.hours))
             
                ReportValueCol(name: "Revisitas", value: "\(report.returnVisits)")
             
                ReportValueCol(name: "Estudios", value: "\(report.studies)")
                
                Divider()
            }
            HStack{
                Text("Observaciones: \(report.wrappedObservations)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Divider()
        }
    }
}

struct ReportValueCol: View {
    let name : String
    let value : String
    var body: some View {
        Divider()
        VStack{
            Text(name)
                .foregroundColor(.secondary)
            Text(value)
                .fontWeight(.bold)
        }
    }
}

 
