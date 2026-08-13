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
    var imageWidth: CGFloat = 165
    var imageHeight: CGFloat = 128
    var imageOffsetX: CGFloat = 0
    var imageOffsetY: CGFloat = 0
    var onViewAll: () -> Void = {}
    
    
    
    var body: some View {
        
        
        
        
        
        GeometryReader { geometry in
            HStack(spacing: 18) {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Button {
                        onViewAll()
                    } label: {
                        HStack(spacing: 7) {
                            Text("View All")
                                .underline()
                            
                            Image(systemName: "arrow.right")
                        }
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.white)
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Text("Your Vehicles")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    Text("\(vehicleCount)")
                        .font(.system(size: 44, weight: .bold))
                        .foregroundStyle(.white)
                   
                    /*
                    Text(vehicleLabel)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.white)
                     */
                    
                    Spacer()
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: max(geometry.size.width * 0.48, imageWidth),
                        height: imageHeight
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .offset(x: imageOffsetX, y: imageOffsetY)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
        }
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            //colour
            .background(Color(red: 0.0, green: 0.32, blue: 0.58))
            .clipShape(RoundedRectangle(cornerRadius: 22))
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                
            )
        
            
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
