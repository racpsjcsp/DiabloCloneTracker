//
//  DiabloImageView.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 08/03/23.
//

import SwiftUI

struct DiabloImageView: View {
    var body: some View {
        Text("Data courtesy of")
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.title)
        
        Image("diablo2-io")
            .renderingMode(.original)
            .resizable()
            .frame(height: 200)
            .listRowSeparator(.hidden)
            .cornerRadius(20)
    }
}

struct DiabloImageView_Previews: PreviewProvider {
    static var previews: some View {
        DiabloImageView()
    }
}

