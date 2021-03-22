//
//  PublishersRow.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//

import SwiftUI

struct PublishersRow: View {
    @State var publisher : Publisher
    var body: some View {
        VStack{
            HStack{
                Text(publisher.wrappedName)
                Spacer()
                Text(publisher.wrappedPrivilegeService)
            }
            HStack{
                Text("Años de bautizado \(publisher.dedicationAges) años")
                Spacer()
            }
        }
    }
}
 
