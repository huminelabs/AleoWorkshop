//
//  HealthRecord.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import Foundation
import SwiftData

import SimpleCodable

@Model
@Codable
final class HealthRecord: Codable {
    var id: UUID
    var name: String
    var dateStamp: Date
    
    var diagnoses: [Diagnosis]
    var medications: [Medication]
    var dateOfBirth: Date
    var gender: String
    var ethnicity: String
    
    init(dateStamp: Date, name: String, diagnoses: [Diagnosis], medications: [Medication], dateOfBirth: Date, gender: String, ethnicity: String) {
        self.id = UUID()
        self.name = name
        self.dateStamp = dateStamp
        self.diagnoses = diagnoses
        self.medications = medications
        self.dateOfBirth = dateOfBirth
        self.gender = gender
        self.ethnicity = ethnicity
    }
}

@Model
@Codable
final class Diagnosis: Codable {
    var conditionName: String
    var dateDiagnosed: Date
    var severity: String
    
    init(conditionName: String, dateDiagnosed: Date, severity: String) {
        self.conditionName = conditionName
        self.dateDiagnosed = dateDiagnosed
        self.severity = severity
    }
}

@Model
@Codable
final class Medication: Codable {
    var name: String
    var datePrescribed: Date
    var dosingSchedule: String
    
    init(name: String, datePrescribed: Date, dosingSchedule: String) {
        self.name = name
        self.datePrescribed = datePrescribed
        self.dosingSchedule = dosingSchedule
    }
}
