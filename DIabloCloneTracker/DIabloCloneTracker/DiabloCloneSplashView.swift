//
//  DiabloCloneSplashView.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 05/02/23.
//

import SwiftUI

struct DiabloCloneSplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if isActive {
                DiabloCloneTrackerView()
            } else {
                Image("D2rAnnihilus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct DiabloCloneSplashView_Previews: PreviewProvider {
    static var previews: some View {
        DiabloCloneSplashView()
    }
}
