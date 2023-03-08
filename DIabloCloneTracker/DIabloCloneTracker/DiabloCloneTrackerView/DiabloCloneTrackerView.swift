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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.diabloCloneData, id: \.self) { item in
                    Section(header: Text(viewModel.getRegion(region: item.region))
                        .foregroundColor(viewModel.applyRegionColor(region: item.region))
                        .fontWeight(.bold)
                        .font(.system(size: 18))) {
                            DiabloStatusView(progress: item.progress, ladder: viewModel.getLadder(ladder: item.ladder), hc: viewModel.getHC(hc: item.hc))
                        }
                }
                
                Spacer()
                DiabloImageView()
            }
            .onAppear { viewModel.fetchData() }
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
            .listStyle(.plain)
            .navigationTitle("Uber Diablo Status")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.toggleAlert()
                    } label: {
                        Image(systemName: viewModel.isAlertOn ? "bell.fill" : "bell.slash")
                    }
                    // alert here...
                }
            }
        }
    }
    
    func alertButtonTapped() {
        isAlertOn = !isAlertOn
        print(#function)
        print(isAlertOn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiabloCloneTrackerView()
            .preferredColorScheme(.dark)
    }
}

