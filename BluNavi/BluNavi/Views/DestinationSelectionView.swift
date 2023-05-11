//
//  DestinationSelectionView.swift
//  BluNavi
//
//  Created by Derrick Ding on 5/11/23.
//

import SwiftUI

struct DestinationSelectionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                    .frame(width: 20)
                
                Circle()
                    .frame(width: 11, height: 11)
                    .foregroundColor(Color(hex: "00B2FF"))
                
                BluNaviLogo()
            }
            
            HStack {
                Spacer()
                    .frame(width: 20)
                
                VStack(alignment: .leading) {
                    Text("Restroom")
                        .font(.custom("Inter-Medium", size: 30))
                        .foregroundColor(Color(hex: "898989"))
                    
                    Text("Detected.")
                        .font(.custom("Inter-Meidum", size: 30))
                        .foregroundColor(Color(hex: "898989"))
                }
                
                Spacer()
            }
            .frame(width: 342, height: 97)
            .background(.white)
            .cornerRadius(13)
            .transition(.move(edge: .bottom))  // TODO: Haven't tested it
            .shadow(color: Color(hex: "006895").opacity(0.15), radius: 12)
            
            
            HStack {
                Spacer()
                    .frame(width: 20)
                
                VStack(alignment: .leading) {
                    Text("Which object do")
                        .font(.custom("Inter-Black", size: 30))
                    
                    Text("you want to go to?")
                        .font(.custom("Inter-Black", size: 30))
                    
                    Spacer()
                        .frame(height: 70)
                    
                    VStack(alignment: .leading) {
                        // MARK: - Sink button
                        Button {
                            // TODO: Add function here
                            print("Sink button clicked")
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
                
                Spacer()
                
            }
            .frame(width: 342, height: 357)
            .background(.white)
            .cornerRadius(13)
            .transition(.move(edge: .bottom))  // TODO: Haven't tested it
            .shadow(color: Color(hex: "006895").opacity(0.15), radius: 12)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "FCFEFF"), Color(hex: "CFF1FF")]), startPoint: .top, endPoint: .bottom)
            )
    }
}

struct DestinationSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationSelectionView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
