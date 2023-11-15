//
//  Item.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import Foundation
import SwiftData

@Model
final class HealthRecord {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
