//
//  BluNaviLogo.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct BluNaviLogo: View {
    var body: some View {
        HStack {
            Text("BLU")
                .font(.custom("Inter-Regular", size: 20))
                .foregroundColor(Color(hex: "00B2FF"))
            Text("NAVI")
                .font(.custom("Inter-Thin", size: 20))
                .foregroundColor(.black)
        }
    }
}

struct BluNaviLogo_Previews: PreviewProvider {
    static var previews: some View {
        BluNaviLogo()
    }
}
