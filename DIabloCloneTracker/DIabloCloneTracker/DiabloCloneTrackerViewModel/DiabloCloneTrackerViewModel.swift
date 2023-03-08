//
//  DiabloCloneTrackerViewModel.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 06/03/23.
//

import SwiftUI
import Combine

class DiabloCloneTrackerViewModel: ObservableObject {
    
    @Published private var cancellables = Set<AnyCancellable>()
    
    @Published var diabloCloneData: [DiabloCloneTrackerModel] = []
    @Published var isLoading: Bool = true
    @Published var alertItem: AlertItem?
    @Published var isAlertOn: Bool = false
    
    func fetchData() {
        isLoading = true
        
        DiabloCloneTrackerNetwork.shared.apiCall()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { servers in
                DispatchQueue.main.async {
                    self.diabloCloneData = servers
                    self.isLoading = false
                    print("bolinho viewModel")
                }
                
            }).store(in: &cancellables)
    }
    
    func toggleAlert() {
        alertItem = isAlertOn ? AlertContext.alertOn : AlertContext.alertOff
        isAlertOn = !isAlertOn
    }
    
    func getProgress(progressColor: String) -> Color {
       switch progressColor {
       case "6":
           return K.DiabloColor.green
       case "5":
           return K.DiabloColor.orange
       case "4", "3", "2":
           return K.DiabloColor.yellow
       default:
           return K.DiabloColor.red
       }
   }
   
    func getRegion(region: String) -> String {
       switch region {
       case "1":
           return K.Region.america.rawValue
       case "2":
           return K.Region.europe.rawValue
       default:
           return K.Region.asia.rawValue
       }
   }
    
    func applyRegionColor(region: String) -> Color {
        switch region {
        case "1":
            return K.DiabloColor.green
        case "2":
            return K.DiabloColor.purple
        default:
            return K.DiabloColor.pink
        }
    }
   
    func getLadder(ladder: String) -> String {
       switch ladder {
       case "1":
           return K.GameMode.ladder.rawValue
       default:
           return K.GameMode.nonLadder.rawValue
       }
   }
   
    func getHC(hc: String) -> String {
       switch hc {
       case "1":
           return K.GameDifficulty.hardcore.rawValue
       default:
           return K.GameDifficulty.softcore.rawValue
       }
   }
   
   func convertUnixDate(unixDate: String) -> String {
       var localDate = ""
       
       if let doubleValue = Double(unixDate) {
           let date = Date(timeIntervalSince1970: doubleValue)
           let dateFormatter = DateFormatter()
           dateFormatter.timeStyle = DateFormatter.Style.medium
           dateFormatter.dateStyle = DateFormatter.Style.medium
           dateFormatter.timeZone = .current
           localDate = dateFormatter.string(from: date)
       }
       
       return localDate
   }
}
