//
//  HomeView.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import SwiftUI

import SwiftDate

struct HomeView: View {
    
    @Environment(AleoManager.self) var aleoManager
    
    var name = "Jon"
    
    var shareRequests: [ShareRequest] = [
        ShareRequest(source: "Aetna", date: Date()),
        ShareRequest(source: "Sun Life", date: Date()),
        ShareRequest(source: "Manulife", date: Date()),
        ShareRequest(source: "Blue Cross Blue Shield", date: Date())
    ]
    
    @State var selectedRequest: ShareRequest?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(shareRequests) { request in
                    Button {
                        selectedRequest = request
                    } label: {
                        Text("Request from \(request.source) at \(request.date, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    }
                }
                .onDelete(perform: deleteRequest)
                .sheet(item: $selectedRequest) { request in
                    RequestView(shareRequest: request)
                }
            }
            .navigationTitle("Welcome \(name)!")
            .onAppear {
                aleoManager.generateAccount()
            }
        }
    }
    
    func deleteRequest(_ indexSet: IndexSet?) {
        
    }
}

#Preview {
    HomeView()
        .modelContainer(for: [HealthRecord.self, Diagnosis.self, Medication.self], inMemory: true)
        .environment(LocalAuthenticator())
        .environment(AleoManager())
}
