//
//  BluNaviApp.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/9/23.
//

import SwiftUI

@main
struct BluNaviApp: App {
    let sessionManager: SessionManager
    let uwbManager: UWBManager
    
    init() {
        self.sessionManager = SessionManager()
        self.uwbManager = UWBManager(sessionManager: self.sessionManager)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(uwbManager: self.uwbManager, sessionManager: self.sessionManager)
        }
    }
}
