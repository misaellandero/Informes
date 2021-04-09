//
//  AverageHoursDateRange.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 08/04/21.
//

import SwiftUI

struct AverageHoursDateRange: View {
    @State var initalDate : Date
    @State var finalDate : Date
    @State var limitAverage : Double
    
    @FetchRequest(entity: Publisher.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Publisher.dedicationDate, ascending: true)]) var publishers: FetchedResults<Publisher>
    
    var body: some View {
        List{
            ForEach(publishers, id: \.id){ publisher in
                if (publisher.averageHours(initialDate: initalDate ,finalDate: finalDate)) < limitAverage {
                    NavigationLink(destination: PublishersDetail(publisher: publisher)){
                        PublishersRow(publisher: publisher)
                    }
                }
            }
        }
    }
}
 
