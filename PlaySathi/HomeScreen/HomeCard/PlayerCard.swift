
//  PlaySathi
//
//  Created by Mac on 22/02/25.
//

import SwiftUI

struct InviteCardView: View {
    @Binding var isPresented: Bool  
    var playerName: String
    var elitePoints: Int
    var date: String
    var time: String
    var status: String
    
    // Add dismiss action
    var dismissAction: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    dismissAction()
                }
            
            VStack(spacing: 20) {
                // Header
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.accent)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(playerName)
                            .font(.title2)
                            .bold()
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(elitePoints) Elite Points")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { dismissAction() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                // Date and Time Section
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.accent)
                        Text(date)
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                            .foregroundColor(.accent)
                        Text(time)
                            .foregroundColor(.primary)
                    }
                }
                
                // Status Section
                HStack {
                    Text("Status")
                        .foregroundColor(.accent)
                    
                    Text(status)
                        .bold()
                        .foregroundColor(statusColor(status))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(statusColor(status).opacity(0.2))
                        .cornerRadius(20)
                    
                    Spacer()
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
    
    func statusColor(_ status: String) -> Color {
        switch status.lowercased() {
        case "accepted": return .green
        case "pending": return .orange
        case "declined": return .red
        default: return .black
        }
    }
    
}
