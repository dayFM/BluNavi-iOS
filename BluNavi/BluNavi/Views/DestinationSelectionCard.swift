//
//  DestinationSelectionCard.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct DestinationSelectionCard: View {
    @ObservedObject var sessionManager: SessionManager
    
    var body: some View {
        // MARK: - Which object do you want to go?
        HStack {
            Spacer()
                .frame(width: 20)
            
            VStack(alignment: .leading) {
                Text(sessionManager.sessionStarted ? "Which object do you" : "Which object do")
                    .font(sessionManager.sessionStarted ? Font.custom("Inter-ExtraBold", size: 25) : Font.custom("Inter-Black", size: 30))
                    .foregroundColor(sessionManager.sessionStarted ? Color(hex: "898989") : Color.black)
                
                Text(sessionManager.sessionStarted ? "want to go to?" : "you want to go to?")
                    .font(sessionManager.sessionStarted ? Font.custom("Inter-ExtraBold", size: 25) : Font.custom("Inter-Black", size: 30))
                    .foregroundColor(sessionManager.sessionStarted ? Color(hex: "898989") : Color.black)
                
                Spacer()
                    .frame(height: sessionManager.sessionStarted ? 35 : 70)
                
                if sessionManager.sessionStarted {
                    VStack(alignment: .leading) {
                        Text("You have selected")
                            .font(.custom("Inter-Medium", size: 25))
                            .foregroundColor(Color(hex: "898989"))
                        
                        Text(sessionManager.selectedDestinationTag?.loc ?? "Unknown")
                            .font(.custom("Inter-Medium", size: 25))
                            .foregroundColor(Color(hex: "898989"))
                    }
                } else {
                    VStack(alignment: .leading) {
                        // MARK: - Lock button
                        Button {
                            withAnimation {
                                print("Lock button clicked")
                                
                                sessionManager.startLocationing(
                                    selectedTag: Tag(id: "yellow", ssid: "4fdff8d27d4e2c70d274b781710a1000", loc: "lock", battery: 100.0, positionX: 1, positionY: 2, positionZ: 0.8)
                                )
                            }
                        } label: {
                            VStack {
                                Text("Lock.")
                                    .font(.custom("Inter-Black", size: 30))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 116, height: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color(hex: "00B2FF"), Color(hex: "CDE8F4")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                            .cornerRadius(10)
                        }
                        
                        // MARK: - Toilet button
                        Button {
                            withAnimation {
                                print("Toilet button clicked")
                                
                                sessionManager.startLocationing(
                                    selectedTag: Tag(id: "white", ssid: "99a8c3e5fd7b5ecbe61e91969cfc5605", loc: "toilet", battery: 100.0, positionX: 1, positionY: 2, positionZ: 0.8)
                                )
                            }
                        } label: {
                            VStack {
                                Text("Toilet.")
                                    .font(.custom("Inter-Black", size: 30))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 131, height: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color(hex: "00B2FF"), Color(hex: "CDE8F4")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                            .cornerRadius(10)
                        }
                        
                        // MARK: - Toilet Paper button
                        Button {
                            withAnimation {
                                print("Toilet Paper button clicked")
                                
                                sessionManager.startLocationing(
                                    selectedTag: Tag(id: "yellow", ssid: "827239f64378a06c4aacf9a7b286ed30", loc: "toiletpaper", battery: 100.0, positionX: 1, positionY: 2, positionZ: 0.8)
                                )
                            }
                        } label: {
                            VStack {
                                Text("Toilet Paper.")
                                    .font(.custom("Inter-Black", size: 30))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 230, height: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color(hex: "00B2FF"), Color(hex: "CDE8F4")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                            .cornerRadius(10)
                        }
                    }
                }
            }
            .frame(height: sessionManager.sessionStarted ? 192 : 357)
            
            Spacer()
            
        }
        .frame(width: 342, height: sessionManager.sessionStarted ? 192 : 357)
        .background(.white)
        .cornerRadius(13)
        .transition(.move(edge: .bottom))
        .shadow(color: Color(hex: "006895").opacity(0.15), radius: 12)
    }
}

struct DestinationSelectionCard_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSelectionCard(sessionManager: SessionManager())
    }
}
