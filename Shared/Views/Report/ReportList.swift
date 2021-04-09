//
//  ReportList.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 08/04/21.
//

import SwiftUI

struct ReportList: View {
    
    @FetchRequest(entity: Report.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Report.date, ascending: true)]) var reports: FetchedResults<Report>
    
    var body: some View {
        List{
            if reports.count < 1 {
                Text("Aun no has registrado ningun reporte")
            } else {
                ForEach(reports, id: \.id){ reporte in
                    NavigationLink(destination: Text("mas despues")){
                        ReportsRow(report: reporte)
                    }
                }//.onDelete(perform: deleteItem)
            }
        }
        
    }
}

struct ReportList_Previews: PreviewProvider {
    static var previews: some View {
        ReportList()
    }
}
