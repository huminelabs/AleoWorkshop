//
//  ShareRequest.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import Foundation

import Aleo

struct ShareRequest: Identifiable, Codable {
    var id: UUID = .init()
    var source: String
    var date: Date
}
