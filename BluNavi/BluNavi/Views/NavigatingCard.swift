//
//  NavigatingCard.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct NavigatingCard: View {
    @ObservedObject var sessionManager: SessionManager
    var timer = Timer.publish(every: 0.25, on: .main, in: .default).autoconnect()
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 10)
            
            VStack(alignment: .leading) {
                Spacer()
                    .frame(height: 10)
                
                Text("Navigating you to")
                    .font(.custom("Inter-Black", size: 30))
                
                Text(sessionManager.selectedDestinationTag?.loc ?? "Unknown")
                    .font(.custom("Inter-Black", size: 30))
                
                Spacer()
                    .frame(height: 70)
                
                Text("Turn " + sessionManager.selectedTagDirection)
                    .font(.custom("Inter-Black", size: 40))
                    .foregroundColor(Color(hex: "00B2FF"))
                
                Text("\(sessionManager.ssidToDistances[sessionManager.selectedDestinationTag?.ssid ?? "99a8c3e5fd7b5ecbe61e91969cfc5605"] ?? 10.0, specifier: "%.1f") feet away")
                    .font(.custom("Inter-Black", size: 40))
                    .foregroundColor(Color(hex: "00B2FF"))
            }
            .frame(width: 342, height: 307)
            
            Spacer()
            
        }
        .frame(width: 342, height: 307)
        .background(.white)
        .cornerRadius(13)
        .transition(.move(edge: .bottom))  // TODO: Haven't tested it
        .shadow(color: Color(hex: "006895").opacity(0.15), radius: 12)
        .onReceive(timer) { _ in
            print("here")
            sessionManager.updateTagDirection()
            sessionManager.checkDestinationFound()
        }
    }
}

struct NavigatingCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigatingCard(sessionManager: SessionManager())
    }
}
