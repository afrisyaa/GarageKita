//
//  VehicleCard.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 11/08/2026.
//

import SwiftUI

struct VehicleCard: View {
    
    let vehicle: VehicleItem
    let themeBlue: Color
    
    var body: some View {
        HStack(spacing: 16) {
            
            // Gambar Kenderaan
            Image(vehicle.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            
            // Info Kenderaan
            VStack(alignment: .leading, spacing: 4) {
                Text(vehicle.name)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(themeBlue)
                
                Text(vehicle.plateNumber)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(themeBlue)
                
                Text(vehicle.mileage)
                    .font(.subheadline)
                    .foregroundStyle(themeBlue)
                
                Text(vehicle.fuelType)
                    .font(.subheadline)
                    .foregroundStyle(themeBlue)
            }
            
            Spacer()
            
            // Chevron Kiri/Kanan Penunjuk Ke Page Detail
            Image(systemName: "chevron.right")
                .font(.headline)
                .bold()
                .foregroundStyle(themeBlue.opacity(0.6))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    VehicleCard(
        vehicle: VehicleItem(
            imageName: "kelisa",
            name: "Perodua Kelisa",
            plateNumber: "VEB 1234",
            mileage: "120,000 km",
            fuelType: "Petrol",
            owner: "Farisya",
            engineNumber: "MXWA 12345",
            transmission: "Auto"
        ),
        themeBlue: Color(red: 30/255, green: 76/255, blue: 124/255)
    )
    .padding()
}
