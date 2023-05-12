//
//  ScanningView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct ScanningView: View {
    @ObservedObject var uwbManager: UWBManager
    @ObservedObject var sessionManager: SessionManager
    @State var buttonClicked = false
    @State var shouldStartNavigation = false
    
    // Inspired by https://stackoverflow.com/questions/64687144/animation-of-shazams-button-in-swiftui
    @State var startAnimation = false
    @State var random1: CGFloat = 0.5
    @State var random2: CGFloat = 0.5
    
    @State var timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    func stopTimer() {
        timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    }
    
    var body: some View {
        if !shouldStartNavigation {
            Button {
                // Animation control
                print("Scanning button clikced")
                buttonClicked = true
                startAnimation = true
                startTimer()
                
                // logic control
                uwbManager.startScanningUWBAccessories()
                
            } label: {
                ZStack {
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [Color(hex: "00B2FF"), Color.white]), center: .center, startRadius: 0, endRadius: 400))
                        .frame(width: random2*500, height: random2*500)
                    
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [Color(hex: "00B2FF"), Color.white]), center: .center, startRadius: 0, endRadius: 400))
                        .frame(width: random1*400, height: random1*400)
                    
                    
                    Circle()
                        .fill(RadialGradient(gradient: Gradient(colors: [Color.white]), center: .center, startRadius: 150, endRadius: 190))
                        .frame(width: 200, height: 200)
                    
                    VStack {
                        BluNaviLogo()
                        
                        VStack {
                            Text(startAnimation ? "Scanning.." : "Scan")
                                .font(.custom("Inter-Black", size: 30))
                                .foregroundColor(Color(hex: "AAAAAA"))
                        }
                    }
                    .frame(width: 200, height: 100)
                }
                .scaleEffect(startAnimation ? random1 : 1 )
                .animation(.easeInOut)
                //            .onTapGesture {
                //                startAnimation.toggle()
                //
                //                if !startAnimation {
                //                    stopTimer()
                //                } else {
                //                    startTimer()
                //                }
                //            }
            }
            .onReceive(timer) { _ in
                random1 = CGFloat.random(in: 0.5...1)
                random2 = CGFloat.random(in: 0.5...1)
            }
            .onReceive(uwbManager.$connectedTags) { connectedTags in
                print(connectedTags.count)
                
                if connectedTags.count == TagForDemo.TAGS_ID_FOR_DEMO.count {
                    shouldStartNavigation = true
                }
            }
            .onAppear {
                stopTimer()
            }
        } else {
            DestinationSelectionView(sessionManager: sessionManager)
        }
    }
}

struct ScanningView_Previews: PreviewProvider {
    static var previews: some View {
        let sessionManager = SessionManager()
        let uwbManager = UWBManager(sessionManager: sessionManager)
        
        ScanningView(uwbManager: uwbManager, sessionManager: sessionManager)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
