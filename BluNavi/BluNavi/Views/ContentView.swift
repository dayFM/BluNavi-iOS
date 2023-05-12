//
//  ContentView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/9/23.
//

import SwiftUI
import EstimoteUWB

struct ContentView: View {
    @ObservedObject var uwbManager: UWBManager
    @ObservedObject var sessionManager: SessionManager
    
    var body: some View {
        ScanningView(uwbManager: uwbManager, sessionManager: sessionManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uwbManager: UWBManager(sessionManager: SessionManager()), sessionManager: SessionManager())
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}


