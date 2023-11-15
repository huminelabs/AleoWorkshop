//
//  ContentView.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            MyDataView()
                .tabItem { Label("Home", systemImage: "house.fill") }
        }
        .modelContainer(for: [HealthRecord.self, Diagnosis.self, Medication.self], inMemory: true)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [HealthRecord.self, Diagnosis.self, Medication.self], inMemory: true)
        .environment(LocalAuthenticator())
        .environment(AleoManager())

}
