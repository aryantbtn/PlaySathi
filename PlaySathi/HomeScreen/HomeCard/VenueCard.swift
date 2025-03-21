//
//  VenueCard.swift
//  PlaySathi
//
//  Created by Mac on 23/02/25.
//

import Foundation
import SwiftUI

// Your imports remain the same

struct VenueCardView: View {
    // Properties
    @Binding var isPresented: Bool
    var venueName: String
    var courtNumber: String
    var timeSlot: String
    var date: String
    var distance: String
    var price: String
    var dismissAction: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismissAction()
                }
            
            VStack(spacing: 20) {
    
                VStack(spacing: 16) {
                    HStack(alignment: .top) {
                       
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.accentColor.opacity(0.7), Color.blue.opacity(0.5)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 56, height: 56)
                            
                            Image(systemName: "sportscourt.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                        }
                        .shadow(color: Color.blue.opacity(0.3), radius: 5, x: 0, y: 2)
                        
                       
                        VStack(alignment: .leading, spacing: 8) {
                            Text(venueName)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.black)
                            
                            // Info Pills
                            HStack(spacing: 12) {
                                // Distance Pill
                                HStack(spacing: 4) {
                                    Image(systemName: "location.fill")
                                        .font(.system(size: 12))
                                        .foregroundColor(.accentColor)
                                    Text(distance)
                                        .font(.system(size: 14))
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                                
                                // Court Pill
                                HStack(spacing: 4) {
                                    Image(systemName: "number.circle.fill")
                                        .font(.system(size: 12))
                                        .foregroundColor(.accentColor)
                                    Text("Court \(courtNumber)")
                                        .font(.system(size: 14))
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.accentColor.opacity(0.1))
                                .cornerRadius(12)
                            }
                        }
                        
                        Spacer()
                        
                        // Dismiss button
                        Button(action: { dismissAction() }) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.gray.opacity(0.6))
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                    }
                }
                
                Divider()
                
                // Date and Time Section
                VStack(spacing: 12) {
                    // Date Box
                    HStack(spacing: 8) {
                        Image(systemName: "calendar")
                            .foregroundColor(.accent)
                        Text(date)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.accentColor.opacity(0.1))
                    .cornerRadius(12)
                    
                    // Time Box
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .foregroundColor(.accentColor)
                        Text(timeSlot)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.accentColor.opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Price Section
                HStack {
                    Text("Total Price")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(price)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.accentColor.opacity(0.1))
                        .cornerRadius(12)
                }
            }
            .padding(24)
            .frame(width: 340)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            )
        }
    }
}
