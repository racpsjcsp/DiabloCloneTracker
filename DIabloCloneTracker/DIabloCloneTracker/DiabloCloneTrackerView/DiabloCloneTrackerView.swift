//
//  DiabloCloneTrackerView.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 05/02/23.
//

import SwiftUI
import Combine

struct DiabloCloneTrackerView: View {
    
    @StateObject var viewModel = DiabloCloneTrackerViewModel()
    
    @State private var path = NavigationPath()
    @State private var isAlertOn = false

    // timer for API call every 60 seconds to check for updates
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
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
            .onAppear { viewModel.fetchData() }
            .onReceive(timer, perform: { _ in
                print(timer)
                viewModel.fetchData()
            })
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
            .listStyle(.plain)
            .navigationTitle(K.diabloCloneTrackerTitle)
            .toolbar {
                ToolBarBellButtonView(viewModel: viewModel, isAlertOn: isAlertOn)
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
