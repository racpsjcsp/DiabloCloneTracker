//
//  ToolBarBellButtonView.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 09/03/23.
//

import SwiftUI

struct ToolBarBellButtonView: ToolbarContent {
    var viewModel: DiabloCloneTrackerViewModel
    @State var isAlertOn: Bool
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Button {
                viewModel.alertButtonTapped()
                isAlertOn = true
            } label: {
                Image(systemName: viewModel.isAlertOn ? K.SpeakerAlertIcon.speakerFill : K.SpeakerAlertIcon.speakerSlash)
            }
            .alert(viewModel.alertItem?.title ?? Text("Notification Warning"), isPresented: $isAlertOn, presenting: viewModel.alertItem) { _ in
                
            } message: { item in
                item.message
            }
        }
    }
}
