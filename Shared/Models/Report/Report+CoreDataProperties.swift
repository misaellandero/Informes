//
//  Report+CoreDataProperties.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//
//

import Foundation
import CoreData


extension Report {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Report> {
        return NSFetchRequest<Report>(entityName: "Report")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var hours: Double
    @NSManaged public var pubs: Int16
    @NSManaged public var returnVisits: Int16
    @NSManaged public var studies: Int16
    @NSManaged public var videos: Int16
    @NSManaged public var observations: String?
    @NSManaged public var publisher: Publisher?

    // MARK: - Wrapped vars
    
    // Wrapped id
    public var wrappedId: UUID {
        id ?? UUID()
    }
    // Wrapped observations
    public var wrappedObservations: String {
        observations ?? "Sin observaciones"
    }
    // Wrapped date
    public var wrappedDate : Date {
        date ?? Date()
    }
    
    // MARK: - Formated Dates
    // date formated
    public var dateFormated : String {
        //DateFormatter extension
        return DateFormatter.mediumDateTimeFormatter.string(from: wrappedDate)
    }
    
     
    
    
}

extension Report : Identifiable {

}
