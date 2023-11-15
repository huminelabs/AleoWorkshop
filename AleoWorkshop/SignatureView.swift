//
//  SignatureView.swift
//  AleoWorkshop
//
//  Created by Nafeh Shoaib on 11/15/23.
//

import SwiftUI

import Aleo

struct SignatureView: View {
    
    var source: String
    var signature: Signature
    
    var body: some View {
        VStack {
            Text("You just shared your medical records with \(source). Here is your signature: ")
            Spacer()
            Text(signature.toString())
                .padding(20)
            Spacer()
        }
    }
}

#Preview {
    SignatureView(source: "Aetna", signature: .init(""))
}
