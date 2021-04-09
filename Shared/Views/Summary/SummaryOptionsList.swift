//
//  SummaryOptionsList.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 08/04/21.
//

import SwiftUI

struct SummaryOptionsList: View {
    
    var initialDate : Date {
        let strDate = "2020-10-01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = dateFormatter.date(from: strDate)
        return date ?? Date()
    }
    var body: some View {
        List{
            NavigationLink(
                destination:
                    AverageHoursDateRange(initalDate: initialDate , finalDate: Date(), limitAverage: 12.0)
            ){
                HStack{
                    Text("Publicadores con menos de 12 horas")
                }
            }
        }
    }
}

struct SummaryOptionsList_Previews: PreviewProvider {
    static var previews: some View {
        SummaryOptionsList()
    }
}
