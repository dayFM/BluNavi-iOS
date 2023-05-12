//
//  NavigatingSuccessView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct NavigatingSuccessView: View {
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
            
            NavigatingSuccessCard(sessionManager: sessionManager)

            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "FCFEFF"), Color(hex: "CFF1FF")]), startPoint: .top, endPoint: .bottom)
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct NavigatingSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatingSuccessView(sessionManager: SessionManager())
    }
}
