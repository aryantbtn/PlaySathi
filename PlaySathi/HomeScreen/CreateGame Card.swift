//
//  CreateGame Card.swift
//  PlaySathi
//
//  Created by Mac on 23/02/25.
//

import Foundation
import SwiftUI
// Your imports remain the same
import SwiftUI

struct CreateGameCardView: View {
    // Properties
    @Binding var isPresented: Bool
    var playerName: String
    var playerImage: String
    var elitePoints: Int
    var venueName: String
    var courtNumber: String
    var timeSlot: String
    var date: String
    var price: String
    var status: String
    var dismissAction: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismissAction()
                }
            
            VStack(spacing: 20) {
                // Player Section
                HStack(spacing: 16) {
                    Image(playerImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(playerName)
                            .font(.title2)
                            .bold()
                        
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(elitePoints) Elite Points")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                        }
                        
                        Text(status)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(statusColor(status))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(statusColor(status).opacity(0.1))
                            .cornerRadius(12)
                    }
                    
                    Spacer()
                    
                    Button(action: { dismissAction() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.gray.opacity(0.6))
                    }
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                // Venue Section
                HStack(alignment: .top) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue.opacity(0.7), Color.blue.opacity(0.5)]),
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
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 12) {
                            Text("Court \(courtNumber)")
                                .font(.system(size: 14))
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(12)
                        }
                    }
                    
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                // Date and Time Section
                VStack(spacing: 12) {
                    HStack(spacing: 8) {
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                        Text(date)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .foregroundColor(.blue)
                        Text(timeSlot)
                            .font(.system(size: 16, weight: .medium))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(12)
                }
                
                // Price Section
                HStack {
                    Text("Total Price")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(price)
                        .font(.title)
                        .bold()
                        .foregroundColor(.green)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(16)
                }
            }
            .padding(24)
            .frame(width: 360)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 6)
            )
        }
    }
    
    // Status color helper function
    private func statusColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "accepted": return .green
        case "pending": return .orange
        case "declined": return .red
        default: return .black
        }
    }
}

// End of file. No additional code.
