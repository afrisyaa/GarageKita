//
//  VehicleSummaryCard.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 09/08/2026.
//

import SwiftUI

struct VehicleSummaryCard: View {
    
    let vehicleCount:  Int
    let vehicleLabel: String
    let imageName: String
    var imageWidth: CGFloat = 240
    var imageHeight: CGFloat = 125
    var imageOffsetX: CGFloat = -35
    var imageOffsetY: CGFloat = 10
    
    
    
    var body: some View {
        
        
        
        
        
        ZStack(alignment: .topTrailing) {
            HStack {
            
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Vehicles")
                        .font(.system(size: 12, weight: .heavy))
                        
                        .foregroundStyle(.white)
                    
                    
                    Text("\(vehicleCount)")
                        .font(.system(size: 40, weight: .semibold))
                        
                        .foregroundStyle(.white)
                    
                    Text("Vehicles")
                        .font(.system(size: 15, weight: .heavy))
                        
                        .foregroundStyle(.white)
                    
                    
                  
                
                    
                }
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageWidth, height: imageHeight)
                    .offset(x: imageOffsetX , y: imageOffsetY)
            }
            
            
             NavigationLink {
                   GarageViewAll()
             } label: {
                 Text("View All")
                     .font(.system(size: 15, weight: .semibold))
                     .foregroundStyle(.white)
                     .underline()
                     .offset(x: -1, y: 4)
                     .bold()
             }
            
            
            
        }   .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 180)
            //colour
            .background(Color(red: 0.0, green: 0.32, blue: 0.58))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                
            )
        
            
            .padding(.horizontal, 16)
            
            
            //.frame(height: 140)
        
                  
    }
    
}

#Preview {
    VehicleSummaryCard(
        vehicleCount: 4,
        vehicleLabel: "vehicles",
        imageName: "Myvi"
    )
        .padding(.top, 16)
}
