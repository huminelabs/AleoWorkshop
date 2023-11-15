//
//  LocalAuthenticator.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import SwiftUI
import Observation
import LocalAuthentication
import os


@Observable
class LocalAuthenticator {
    var isUnlocked: Bool
    var isAuthenticating: Bool
    
    var context = LAContext()
    var error: NSError?
    
    let policy = LAPolicy.deviceOwnerAuthentication
    
    let reason = "Please authenticate to securely access your Health Vault."
    
    public init(isUnlocked: Bool = false, isAuthenticating: Bool = true) {
        self.isUnlocked = isUnlocked
        self.isAuthenticating = isAuthenticating
    }
    
    nonisolated func authenticate() async {
        // TODO
    }
}
