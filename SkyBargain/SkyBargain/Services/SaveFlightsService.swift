//
//  SaveFlightsService.swift
//  SkyBargain
//
//  Created by ARMBP on 8/17/24.
//

import Foundation

final class SaveFlightsService: ObservableObject {
    private let userDefaults = UserDefaults.standard
    private let key = "savedIDs"
    
    @Published var savedIDs: [String] = []
    
    init() {
        savedIDs = userDefaults.stringArray(forKey: key) ?? []
    }
    
    func trySaveID(_ id: String) {
        guard isIDSaved(id) else {
            if !savedIDs.contains(id) {
                savedIDs.append(id)
                userDefaults.set(savedIDs, forKey: key)
            }
            return
        }
        deleteByID(id)
    }
    
    func isIDSaved(_ id: String) -> Bool {
        let savedIDs = userDefaults.stringArray(forKey: key) ?? []
        return savedIDs.contains(id)
    }
    
    private func deleteByID(_ id: String) {
        if let index = savedIDs.firstIndex(of: id) {
            savedIDs.remove(at: index)
            userDefaults.set(savedIDs, forKey: key)
        }
    }
}
