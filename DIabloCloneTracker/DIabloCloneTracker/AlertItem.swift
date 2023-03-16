//
//  AlertItem.swift
//  DIabloCloneTracker
//
//  Created by Rafael Augusto Campos Plinio on 08/03/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let buttonTitle: Text
}

struct AlertContext {
    static let alertOn = AlertItem(title: Text("Alert is now ON!"),
                                   message: Text("You will receive an alert sound when one of the realms reach 6/6 progress."),
                                   buttonTitle: Text("OK"))
    
    static let alertOff = AlertItem(title: Text("Alert is now OFF!"),
                                    message: Text("You will NOT receive any alert when one of the realms reach 6/6 progress."),
                                    buttonTitle: Text("OK"))
}
