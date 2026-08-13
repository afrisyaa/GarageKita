//
//  VehicleDetailView.swift
//  Garagekitav0.1
//
//  Created by STDC_26 charged on 11/08/2026.
//

import SwiftUI

struct VehicleDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let vehicle: VehicleItem
    
    //let themeYellow = Color(red: 242/255, green: 177/255, blue: 61/255)
    let themeYellow = Color( red:1.0, green: 0.67, blue: 0.0)
    let themeBlue = Color(red: 30/255, green: 76/255, blue: 124/255)
    
    var body: some View {
        VStack(spacing: 0) {
            
            Color.white
                .frame(height: 1)
            
            // Header Bar Custom
            ZStack {
                Text("Garage")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                            .padding(8)
                            //.background(.white.opacity(0.3), in: Circle())
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .frame(height: 65)
            .background(themeYellow)
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    Spacer().frame(height: 30)
                    
                    // Card Container dengan Bulatan Gambar bertindih di atas
                    ZStack(alignment: .top) {
                        
                        // White Box Card
                        VStack(spacing: 16) {
                            
                            // Space untuk gambar bulatan kat atas
                            Spacer().frame(height: 70)
                            
                            // Title Nama Kenderaan & No Plat
                            Text("\(vehicle.name) \(vehicle.plateNumber)")
                                .font(.title3)
                                .bold()
                                .foregroundStyle(themeBlue)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Divider()
                            
                            // Detail Rows Table
                            VStack(spacing: 0) {
                                detailRow(title: "Owner", value: vehicle.owner)
                                Divider()
                                
                                detailRow(title: "Model Name", value: vehicle.name)
                                Divider()
                                
                                detailRow(title: "Number Plate", value: vehicle.plateNumber)
                                Divider()
                                
                                detailRow(title: "Engine Number", value: vehicle.engineNumber)
                                Divider()
                                
                                detailRow(title: "Mileage", value: vehicle.mileage)
                                Divider()
                                
                                detailRow(title: "Fuel Type", value: vehicle.fuelType)
                                Divider()
                                
                                detailRow(title: "Transmission", value: vehicle.transmission)
                            }
                            .padding(.horizontal, 8)
                            .padding(.bottom, 12)
                        }
                        .background(Color.white)
                        .cornerRadius(24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        .padding(.top, 60) // Tolak box ke bawah sikit
                        
                        // Bulatan Gambar Kereta
                        ZStack {
                            /*Circle()
                                .fill(themeBlue)
                                .frame(width: 130, height: 130) */
                            
                            Image(vehicle.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer().frame(height: 30)
                }
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .toolbar(.hidden, for: .navigationBar)
    }
    
    // Subview untuk sebaris maklumat (Title & Value)
    private func detailRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .bold()
                .foregroundStyle(themeBlue)
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .foregroundStyle(themeBlue)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
    }
}

#Preview {
    VehicleDetailView(
        vehicle: VehicleItem(
            imageName: "Kelisa",
            name: "Perodua Kelisa",
            plateNumber: "VEB 1234",
            mileage: "120,000 km",
            fuelType: "Petrol",
            owner: "Farisya",
            engineNumber: "MXWA 12345",
            transmission: "Auto"
        )
    )
}
