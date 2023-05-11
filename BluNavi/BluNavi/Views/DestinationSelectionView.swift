//
//  DestinationSelectionView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct DestinationSelectionView: View {
    @ObservedObject var sessionManager: SessionManager
    
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
                        Text("Restroom")
                            .font(.custom("Inter-Medium", size: 30))
                            .foregroundColor(Color(hex: "898989"))
                        
                        Text("Detected.")
                            .font(.custom("Inter-Medium", size: 30))
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
            
            DestinationSelectionCard(sessionManager: sessionManager)
            
            // MARK: - After user selects a destination
            if sessionManager.sessionStarted {
                Spacer()
                    .frame(height: 25)
                
                // FIXME: cannot show animation
                NavigatingCard(sessionManager: sessionManager)
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "FCFEFF"), Color(hex: "CFF1FF")]), startPoint: .top, endPoint: .bottom)
        )
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct DestinationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSelectionView(sessionManager: SessionManager())
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
