//
//  SessionManager.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import Foundation

class SessionManager: ObservableObject {
    @Published var selectedDestinationTag: Tag?
    @Published var sessionStarted: Bool
    
    init() {
        self.selectedDestinationTag = nil
        self.sessionStarted = false
    }
    
    func startLocationing(selectedTag: Tag) {
        self.selectedDestinationTag = selectedTag
        self.sessionStarted = true
    }
    
    func stopLocationing() {
        self.selectedDestinationTag = nil
        self.sessionStarted = false
    }
    
}
