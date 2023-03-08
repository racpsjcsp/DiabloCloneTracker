//
//  DiabloCloneTrackerModel.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 06/03/23.
//

import Foundation

struct DiabloCloneTrackerModel: Codable, Identifiable, Hashable {
    let id = UUID()
    let progress, region, ladder, hc: String
    let timestamped, reporterID: String

    enum CodingKeys: String, CodingKey {
        case progress, region, ladder, hc, timestamped
        case reporterID = "reporter_id"
    }
}
