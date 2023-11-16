//
//  RequestView.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import SwiftUI
import SwiftData

import Aleo

struct RequestView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(AleoManager.self) var aleoManager
    @Environment(LocalAuthenticator.self) var authenticator
    
    @Query private var records: [HealthRecord]
    
    var shareRequest: ShareRequest
    
    @State var signature: Signature?
    
    @State var showSuccess: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("""
                \(shareRequest.source)
                """)
                .font(.title)
                Spacer()
                Button("Generate ZK Proof") {
                    signature = aleoManager.encrypt(healthRecord: records.first)
                    showSuccess = true
                }
                Button("Cancel") {
                    dismiss()
                }
            }
            .navigationDestination(isPresented: $showSuccess, destination: {
                if let signature = signature {
                    SignatureView(source: shareRequest.source, signature: signature)
                }
            })
            .navigationTitle("Share Request")
        }
    }
}

#Preview {
    RequestView(shareRequest: ShareRequest(source: "Aetna", date: Date()))
        .modelContainer(for: [HealthRecord.self, Diagnosis.self, Medication.self], inMemory: true)
        .environment(LocalAuthenticator())
        .environment(AleoManager())
}
