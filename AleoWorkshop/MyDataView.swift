//
//  MyDataView.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import SwiftUI

import SwiftData

struct MyDataView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var records: [HealthRecord]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(records) { record in
                    NavigationLink {
                        Text("Health Record at \(record.dateStamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(record.dateStamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        
        let diagnosis = Diagnosis(
            conditionName: "Diabetes Type-2",
            dateDiagnosed: Date(),
            severity: "moderate"
        )
        
        let medication = Medication(
            name: "Insulin",
            datePrescribed: Date(),
            dosingSchedule: "weekly"
        )
        
        let newItem = HealthRecord(
            dateStamp: Date(),
            name: "Jon Stewart",
            diagnoses: [
                diagnosis
            ],
            medications: [
                medication
            ],
            dateOfBirth: Date(),
            gender: "female",
            ethnicity: "turkish"
        )
        
        withAnimation {
            modelContext.insert(
                newItem
            )
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(records[index])
            }
        }
    }
}

#Preview {
    MyDataView()
        .modelContainer(for: [HealthRecord.self, Diagnosis.self, Medication.self], inMemory: true)
        .environment(LocalAuthenticator())
        .environment(AleoManager())
}
