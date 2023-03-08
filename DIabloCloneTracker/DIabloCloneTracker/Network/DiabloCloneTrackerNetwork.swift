//
//  DiabloCloneTrackerNetwork.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 06/03/23.
//
//
import Foundation
import Combine

class DiabloCloneTrackerNetwork: ObservableObject {
    
    static let shared = DiabloCloneTrackerNetwork()

    func apiCall() -> AnyPublisher<[DiabloCloneTrackerModel], Error> {
        let url = URL(string: K.apiURL)
        guard let requestUrl = url else { fatalError("Missing or wrong URL") }
        
        return URLSession.shared.dataTaskPublisher(for: requestUrl)
            .map { $0.data }
            .decode(type: [DiabloCloneTrackerModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
