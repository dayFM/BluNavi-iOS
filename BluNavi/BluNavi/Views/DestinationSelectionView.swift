//
//  DestinationSelectionView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct DestinationSelectionView: View {
    @ObservedObject var sessionManager: SessionManager
    @ObservedObject var uwbManager: UWBManager
    @State var userStartedOver = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 30)
            
            HStack {
                Spacer()
                    .frame(width: 20)
                
                Circle()
                    .frame(width: 11, height: 11)
                    .foregroundColor(Color(hex: "00B2FF"))
                
                BluNaviLogo()
            }
            
            // MARK: - Restroom Detected.
            if !sessionManager.sessionStarted {
                HStack {
                    Spacer()
                        .frame(width: 20)
                    
                    VStack(alignment: .leading) {
                        Text("Restroom Detected.")
                            .font(.custom("Inter-Bold", size: 27))
                            .foregroundColor(Color(hex: "898989"))
                    }
                    
                    Spacer()
                }
                .frame(width: 342, height: 97)
                .background(.white)
                .cornerRadius(13)
                .transition(.move(edge: .bottom))
                .shadow(color: Color(hex: "006895").opacity(0.15), radius: 12)
            }
            
            if !sessionManager.destinationFound {
                DestinationSelectionCard(sessionManager: sessionManager)
            }
            
            // MARK: - After user selects a destination
            if sessionManager.sessionStarted {
                Spacer()
                    .frame(height: 25)
                
                if !sessionManager.destinationFound {
                    NavigatingCard(sessionManager: sessionManager)
                } else {
                    NavigatingSuccessCard(sessionManager: sessionManager)
                    
                    Spacer()
                        .frame(height: 30)
                    
                    Text("Double tap to start over")
                        .font(sessionManager.sessionStarted ? Font.custom("Inter-ExtraBold", size: 25) : Font.custom("Inter-Black", size: 30))
                        .foregroundColor(sessionManager.sessionStarted ? Color(hex: "898989") : Color.black)
                    
                }
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "FCFEFF"), Color(hex: "CFF1FF")]), startPoint: .top, endPoint: .bottom)
        )
        .navigationBarBackButtonHidden(true)
        .onTapGesture(count: 2) {  // Double tap to start over
            print("Double tap here")
            self.userStartedOver = true
            sessionManager.stopLocationing()
//            uwbManager.stopScanningUWBAccessories()
        }
    }
    
}

struct DestinationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        let sessionManager = SessionManager()
        let uwbManager = UWBManager(sessionManager: sessionManager)
        
        DestinationSelectionView(sessionManager: sessionManager, uwbManager: uwbManager)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
