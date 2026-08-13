//
//  WorkshopCard.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 10/08/2026.
//

import SwiftUI

struct WorkshopCard: View {
    
    let shop: WorkshopItem
    let themeYellow: Color
    let themeBlue: Color
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                
                // Tajuk Nama Workshop + Badge Collab sebaris
                HStack(spacing: 6) {
                    Text(shop.workshopName)
                        .font(.headline)
                        .bold()
                        .foregroundStyle(themeBlue)
                    
                    if shop.isCollaborated {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.subheadline)
                            .foregroundStyle(themeYellow)
                    }
                }
                
                // Minis info
                HStack(spacing: 6) {
                    Text(shop.isOpen ? "Open" : "Closed")
                        .font(.caption)
                        .foregroundStyle(.green)
                    
                    Text(".")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    Image(systemName: "star.fill")
                        .font(.caption)
                        .foregroundStyle(themeYellow)
                    
                    Text("\(shop.rating)")
                        .font(.caption)
                        .foregroundStyle(themeYellow)
                    
                    Text(".")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    Text("\(shop.distance)")
                        .font(.caption)
                        .foregroundStyle(themeBlue)
                }
                
                Text(shop.address)
                    .font(.caption)
                    .foregroundStyle(themeBlue)
                    .lineLimit(1)
            }
            
            Spacer()
            
            // Button call & direction
            VStack {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "arrow.trianglehead.turn.up.right.diamond.fill")
                        Text("Directions")
                    }
                }
                .font(.caption2)
                .foregroundStyle(.black)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(themeYellow)
                .cornerRadius(15)
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "phone.fill")
                        Text("Call")
                    }
                }
                .font(.caption2)
                .foregroundStyle(.black)
                .padding(.horizontal, 28)
                .padding(.vertical, 6)
                .background(themeYellow)
                .cornerRadius(15)
            }
        }
    }
}

#Preview {
    WorkshopCard(
        shop: WorkshopItem(
            workshopName: "AE Workshop",
            isOpen: true,
            rating: "3.9",
            distance: "3.5km",
            address: "Dataran Otomobil, 21G, Jalan Pahat H 15/H",
            workshopContact: "0123456789",
            latitude: 3.0738,
            longitude: 101.5183,
            isCollaborated: true
        ),
        themeYellow: Color(red: 242/255, green: 177/255, blue: 61/255),
        themeBlue: Color(red: 30/255, green: 76/255, blue: 124/255)
    )
}
