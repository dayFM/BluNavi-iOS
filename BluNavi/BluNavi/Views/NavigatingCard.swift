//
//  NavigatingCard.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct NavigatingCard: View {
    @ObservedObject var sessionManager: SessionManager
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        // MARK: - Which object do you want to go?
        HStack {
            Spacer()
                .frame(width: 20)
            
            VStack(alignment: .leading) {
                Text("Navigating you to")
                    .font(.custom("Inter-Black", size: 30))
                
                Text(sessionManager.selectedDestinationTag?.loc ?? "Unknown")
                    .font(.custom("Inter-Black", size: 30))
                
                Spacer()
                    .frame(height: 70)
                
                Text("Turn " + sessionManager.selectedTagDirection)
                    .font(.custom("Inter-Black", size: 40))
                    .foregroundColor(Color(hex: "00B2FF"))
                
                Text(String(sessionManager.ssidToDistances[sessionManager.selectedDestinationTag?.ssid ?? "4fdff8d27d4e2c70d274b781710a1000"] ?? 10.0) + " feet away.")
                    .font(.custom("Inter-Black", size: 40))
                    .foregroundColor(Color(hex: "00B2FF"))
            }
            
            Spacer()
            
        }
        .frame(width: 342, height: 357)
        .background(.white)
        .cornerRadius(13)
        .transition(.move(edge: .bottom))  // TODO: Haven't tested it
        .shadow(color: Color(hex: "006895").opacity(0.15), radius: 12)
        .onReceive(timer) { time in
            sessionManager.updateTagDirection()
        }
    }
}

struct NavigatingCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigatingCard(sessionManager: SessionManager())
    }
}
