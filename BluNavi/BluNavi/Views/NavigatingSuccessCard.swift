//
//  NavigatingSuccessCard.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct NavigatingSuccessCard: View {
    @ObservedObject var sessionManager: SessionManager
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            
            VStack(alignment: .leading) {
                Text("Navigating you to")
                    .font(.custom("Inter-ExtraBold", size: 25))
                    .foregroundColor(Color(hex: "898989"))
                
                Text(sessionManager.selectedDestinationTag?.loc ?? "Unknown")
                    .font(.custom("Inter-ExtraBold", size: 25))
                    .foregroundColor(Color(hex: "898989"))
                
                Spacer()
                    .frame(height: 40)
                
                Text("Done!")
                    .font(.custom("Inter-Black", size: 25))
                    .foregroundColor(Color(hex: "414141"))
                
                Spacer()
                    .frame(height: 25)
                
                Text("It's right in front of you!")
                    .font(.custom("Inter-Black", size: 25))
                    .foregroundColor(.black)
                
                Text("About 3 meters high")
                    .font(.custom("Inter-Black", size: 25))
                    .foregroundColor(.black)
                
            }
            .frame(height: 245)
            
            Spacer()
            
        }
        .frame(width: 342, height: 245)
        .background(.white)
        .cornerRadius(13)
        .transition(.move(edge: .bottom))  // TODO: Haven't tested it
        .shadow(color: Color(hex: "006895").opacity(0.15), radius: 12)
    }
}

struct NavigatingSuccessCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigatingSuccessCard(sessionManager: SessionManager())
    }
}
