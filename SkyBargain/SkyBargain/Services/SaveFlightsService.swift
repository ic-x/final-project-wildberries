//
//  SaveFlightsService.swift
//  SkyBargain
//
//  Created by ARMBP on 8/17/24.
//

import Foundation

class SaveFlightsService: ObservableObject {
    private let userDefaults = UserDefaults.standard
    private let key = "savedIDs"
    
    // Сохранение ID
    func saveID(_ id: String) {
        var savedIDs = userDefaults.stringArray(forKey: key) ?? []
        if !savedIDs.contains(id) {
            savedIDs.append(id)
            userDefaults.set(savedIDs, forKey: key)
        }
    }
    
    // Проверка наличия ID
    func isIDSaved(_ id: String) -> Bool {
        let savedIDs = userDefaults.stringArray(forKey: key) ?? []
        return savedIDs.contains(id)
    }
}
