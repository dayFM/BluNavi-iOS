//
//  ContentView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/9/23.
//

import SwiftUI
import EstimoteUWB

struct ContentView: View {
    let uwbManager: UWBManager
    
    var body: some View {
        NavigationView {
            VStack {
                ScanningView()
                
                NavigationLink(destination: DestinationSelectionView()) {
                    Text("Click me to get started")
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(uwbManager: UWBManager())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}


