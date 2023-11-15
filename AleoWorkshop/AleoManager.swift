//
//  AleoManager.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import Foundation

import Observation

import Aleo

import KeychainAccess

let RECORD_PLAINTEXT = """
{
      owner: aleo1j7qxyunfldj2lp8hsvy7mw5k8zaqgjfyr72x2gh3x4ewgae8v5gscf5jh3.private,
      microcredits: 1500000000000000u64.private,
      _nonce: 3077450429259593211617823051143573281856129402760267155982965992208217472983group.public
    }
"""

let RECORD_CIPHERTEXT = "record1qyqsqpe2szk2wwwq56akkwx586hkndl3r8vzdwve32lm7elvphh37rsyqyxx66trwfhkxun9v35hguerqqpqzqrtjzeu6vah9x2me2exkgege824sd8x2379scspmrmtvczs0d93qttl7y92ga0k0rsexu409hu3vlehe3yxjhmey3frh2z5pxm5cmxsv4un97q"


let OWNER_PRIVATE_KEY = "APrivateKey1zkpJkyYRGYtkeHDaFfwsKtUJzia7csiWhfBWPXWhXJzy9Ls"

let SERIAL_NUMBER = "8170619507075647151199239049653235187042661744691458644751012032123701508940field"

@Observable
class AleoManager {
    var account: Account?
    
    private var aleoCloudClient: AleoCloudClient = .init(serverURL: .testnet3)
    
    private var keychain: Keychain = Keychain(
            server: AleoCloudHost.testnet3.urlString,
            protocolType: .https
        )
        .synchronizable(true)
    
    func generateAccount() {
        
    }
    
    func decryptRecord() -> RecordPlaintext? {
        return nil
    }
    
    func encrypt(healthRecord: HealthRecord?) -> Signature? {
        guard let healthRecord = healthRecord else {
            return nil
        }
        
        let data = try? JSONEncoder().encode(healthRecord)
        return nil
    }
}


extension Signature: Identifiable {
    public var id: String {
        return self.toString()
    }
}
