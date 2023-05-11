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
                        // MARK: - Sink button
                        Button {
                            withAnimation {
                                // TODO: Add function here
                                print("Sink button clicked")
                                
                                sessionManager.startLocationing(
                                    selectedTag: Tag(id: "", ssid: "asdas", loc: "Sink", battery: 100.0, positionX: 0.0, positionY: 0.0, positionZ: 0.0)
                                )
                            }
                        } label: {
                            VStack {
                                Text("Sink.")
                                    .font(.custom("Inter-Black", size: 30))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 116, height: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color(hex: "00B2FF"), Color(hex: "CDE8F4")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                            .cornerRadius(10)
                        }
                        
                        // MARK: - Room Door button
                        Button {
                            // TODO: Add function here
                            print("Room Door button clicked")
                        } label: {
                            VStack {
                                Text("Room Door.")
                                    .font(.custom("Inter-Black", size: 30))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 208, height: 50)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color(hex: "00B2FF"), Color(hex: "CDE8F4")]), startPoint: .bottomLeading, endPoint: .topTrailing)
                            )
                            .cornerRadius(10)
                        }
                        
                        // MARK: - Room Handle button
                        Button {
                            // TODO: Add function here
                            print("Room handle button clicked")
                        } label: {
                            VStack {
                                Text("Room Handle.")
                                    .font(.custom("Inter-Black", size: 30))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 241, height: 50)
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
