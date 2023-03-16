//
//  DiabloCloneTrackerView.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 05/02/23.
//

import SwiftUI
import Combine
import AVFoundation

struct DiabloCloneTrackerView: View {
    
    @StateObject var viewModel = DiabloCloneTrackerViewModel()
    private let apiTimer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    private let displayTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining = 60
    
    var body: some View {
        NavigationStack {
            Text("Updating in: \(viewModel.formatToSeconds(time: timeRemaining))")
            List {
                ForEach(viewModel.diabloCloneData, id: \.self) { data in
                    Section(header: Text(viewModel.getRegion(region: data.region))
                        .foregroundColor(viewModel.applyRegionColor(region: data.region))
                        .fontWeight(.bold)
                        .font(.system(size: 18))) {
                            DiabloStatusView(progress: data.progress, ladder: viewModel.getLadder(ladder: data.ladder), hc: viewModel.getHC(hc: data.hc))
                        }
                }
                
                Spacer()
                DiabloImageView()
            }
            .onAppear {
                viewModel.getAlertConfig()
                viewModel.fetchData()
                playAlertSound()
            }
            // timer for API call every 60 seconds
            .onReceive(apiTimer, perform: { _ in
                viewModel.fetchData()
                playAlertSound()
            })
            // timer countdown to check for updates
            .onReceive(displayTimer, perform: { _ in
                timeRemaining -= 1
                if timeRemaining == 0 {
                    timeRemaining = 60
                }
            })
            // hides the content with a placeholder bar while fetching data
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
            .listStyle(.plain)
            .navigationTitle(K.diabloCloneTrackerTitle)
            .toolbar {
                ToolBarBellButtonView(viewModel: viewModel, isAlertOn: viewModel.isAlertOn)
            }
        }
    }
    
    private func playAlertSound() {
        if viewModel.isAlertOn && viewModel.isLoading {
            for i in viewModel.diabloCloneData {
                if i.progress == "6" {
                    AudioServicesPlaySystemSound(1021)
                    break
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiabloCloneTrackerView()
            .preferredColorScheme(.dark)
    }
}
