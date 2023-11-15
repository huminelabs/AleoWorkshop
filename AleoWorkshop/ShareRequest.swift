//
//  ShareRequest.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import Foundation

struct ShareRequest: Identifiable, Codable {
    var id: UUID = .init()
    var source: String
    var date: Date
}
