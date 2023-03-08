//
//  K.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 08/03/23.
//

import SwiftUI

struct K {
    
    static let apiURL = "https://diablo2.io/dclone_api.php"

    enum DiabloColor {
        static var red: Color { return Color(.systemRed) }
        static var green: Color { return Color(.systemGreen) }
        static var orange: Color { return Color(.systemOrange) }
        static var yellow: Color { return Color(.systemYellow) }
        static var blue: Color { return Color(.systemBlue) }
        static var purple: Color { return Color(.systemPurple) }
        static var pink: Color { return Color(.systemPink) }
    }
    
    enum Region: String {
        case america = "Americas"
        case asia = "Asia"
        case europe = "Europe"
    }

    enum GameDifficulty: String {
        case hardcore = "Hardcore"
        case softcore = "Softcore"
    }

    enum GameMode: String {
        case ladder = "Ladder"
        case nonLadder = "Non-Ladder"
    }
    
    struct BellAlertIcon {
        static let isOn = "bell-slash"
        static let isOff = "bell"
    }
}
