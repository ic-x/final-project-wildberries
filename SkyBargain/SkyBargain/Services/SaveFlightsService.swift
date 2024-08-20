//
//  SaveFlightsService.swift
//  SkyBargain
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
        if isIDSaved(id) {
            deleteByID(id)
        } else {
            savedIDs.append(id)
            userDefaults.set(savedIDs, forKey: key)
        }
    }
    
    func isIDSaved(_ id: String) -> Bool {
        return savedIDs.contains(id)
    }
    
    private func deleteByID(_ id: String) {
        if let index = savedIDs.firstIndex(of: id) {
            savedIDs.remove(at: index)
            userDefaults.set(savedIDs, forKey: key)
        }
    }
}
