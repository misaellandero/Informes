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
    @NSManaged public var observations: String?
    @NSManaged public var publisher: Publisher?

    // MARK: - Wrapped vars
    
    // Wrapped id
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    // Wrapped date
    public var wrappedDate : Date {
        date ?? Date()
    }
    
    
}

extension Report : Identifiable {

}
