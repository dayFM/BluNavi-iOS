//
//  ScanningView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct ScanningView: View {
    var body: some View {
        VStack {
            BluNaviLogo()
            
            VStack {
                Text("Scanning..")
                    .font(.custom("Inter-Black", size: 30))
                    .foregroundColor(Color(hex: "AAAAAA"))
                
            }
        }
    }
}

struct ScanningView_Previews: PreviewProvider {
    static var previews: some View {
        ScanningView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
