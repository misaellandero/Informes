//
//  Publisher+CoreDataProperties.swift
//  informes
//
//  Created by Francisco Misael Landero Ychante on 22/03/21.
//
//

import SwiftUI
import Foundation
import CoreData

public enum PrivilegesOfService : String, CaseIterable {
    case publisher = "Publisher", auxPioner = "Auxiliary", regPioner = "Pioner"
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

extension Publisher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Publisher> {
        return NSFetchRequest<Publisher>(entityName: "Publisher")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var birthday: Date?
    @NSManaged public var dedicationDate: Date?
    @NSManaged public var privilegeService: Int16
    @NSManaged public var reports: NSSet?
    
    // MARK: - Wrapped vars - Las variables pero con valores por default
    
    // Wrapped id
    public var wrappedId : UUID {
        id ?? UUID()
    }
    
    // Wrapped name
    public var wrappedName : String {
        name ?? "Unknown"
    }
    
    // Wrapped birthday
    public var wrappedBirthDate : Date {
        birthday ?? Date()
    }
    
    // Wrapped dedication
    public var wrappedDedicationDate : Date {
        dedicationDate ?? Date()
    }
    
    // Wrapped Privilege Service
    public var wrappedPrivilegeServiceEnum : PrivilegesOfService {
        
        let privileges = [PrivilegesOfService.publisher, PrivilegesOfService.auxPioner, PrivilegesOfService.regPioner]
        
        let privilege = Int(privilegeService)
        
        return privileges[privilege]
    
    }
    
    // Wrapped Privilege Service
    public var wrappedPrivilegeService : String {
        
        let privileges = [PrivilegesOfService.publisher, PrivilegesOfService.auxPioner, PrivilegesOfService.regPioner]
        
        let privilege = Int(privilegeService)
        
        return privileges[privilege].rawValue
    
    }
    
    // MARK: - Formated Dates
    // birthdate date formated
    public var birthDateFormated : String {
        //DateFormatter extension
        return DateFormatter.mediumDateTimeFormatter.string(from: wrappedBirthDate)
    }
    // dedication date formated
    public var dedicationDateFormated : String {
        //DateFormatter extension
        return DateFormatter.mediumDateTimeFormatter.string(from: wrappedDedicationDate)
    }
    
    // MARK: - Computed properties
    
    //Get age
    var age : Int {
        return  Calendar.current.dateComponents([.year], from: wrappedBirthDate, to: Date()).year ?? 0
    }
     
    //Get dedication ages
    var dedicationAges : Int {
        return  Calendar.current.dateComponents([.year], from: wrappedDedicationDate, to: Date()).year ?? 0
    }
    
    // MARK: - Array reports
    public var reportsArray : [Report] {
        let set = reports as? Set<Report> ?? []
        return set.sorted {
            $0.wrappedDate > $1.wrappedDate
        }
    }
    
    
    // MARK: - Summary request
    
    func averageHours(initialDate: Date, finalDate: Date)-> Double {
        var totalHours = 0.0
        var reportCount = 0.0
        for report in reportsArray {
            if report.wrappedDate >= initialDate &&  report.wrappedDate <= finalDate {
                totalHours += report.hours
                reportCount += 1
            }
        }
        var average = totalHours/reportCount
        return average
    }
    
}

// MARK: Generated accessors for reports
extension Publisher {

    @objc(addReportsObject:)
    @NSManaged public func addToReports(_ value: Report)

    @objc(removeReportsObject:)
    @NSManaged public func removeFromReports(_ value: Report)

    @objc(addReports:)
    @NSManaged public func addToReports(_ values: NSSet)

    @objc(removeReports:)
    @NSManaged public func removeFromReports(_ values: NSSet)

}

extension Publisher : Identifiable {

}
