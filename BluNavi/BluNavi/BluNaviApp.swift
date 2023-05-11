//
//  BluNaviApp.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/9/23.
//

import SwiftUI

@main
struct BluNaviApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(uwbManager: UWBManager())
        }
    }
}
