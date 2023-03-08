//
//  DiabloStatusView.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 08/03/23.
//

import SwiftUI

struct DiabloStatusView: View {
    var progress: String
    var ladder: String
    var hc: String
    
    var body: some View {
        HStack {
            Text("\(progress)/6, \(ladder), \(hc)")
            
            Spacer()

            if progress == "6" {
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
            }
        }
        .listRowSeparator(.hidden)
    }
}
