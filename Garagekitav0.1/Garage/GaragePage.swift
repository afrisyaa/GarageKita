//
//  GaragePage.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 11/08/2026.
//

import SwiftUI

struct GaragePage: View {
    
    //let themeYellow = Color(red: 242/255, green: 177/255, blue: 61/255)
    let themeYellow = Color( red:1.0, green: 0.67, blue: 0.0)
    let themeBlue = Color(red: 30/255, green: 76/255, blue: 124/255)
    
    @State private var vehicles =
        VehicleStorage.load()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                Color.white
                    .frame(height: 1)
                
                // Header Bar dengan Butang '+'
                ZStack {
                    Text("Garage")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                    
                    HStack {
                        Spacer()
                        
                        // Pass $vehicles guna Binding ke AddVehicleView
                        NavigationLink(destination: AddVehicleView(vehicles: $vehicles)) {
                            Image(systemName: "plus")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .frame(height: 65)
                .background(themeYellow)
                
                // Senarai Kenderaan
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("My Vehicles")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(themeBlue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(20)
                        
                        // Bila vehicles bertambah, ForEach auto-render kad baru!
                        ForEach(vehicles.indices, id: \.self) { index in
                            NavigationLink(destination: VehicleDetailView(vehicle: vehicles[index])) {
                                VehicleCard(vehicle: vehicles[index], themeBlue: themeBlue)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .toolbar(.hidden, for: .navigationBar)
            .onAppear {
                vehicles = VehicleStorage.load()
            }
            .onChange(of: vehicles.count) {
                VehicleStorage.save(vehicles)
            }
        }
    }
}

#Preview {
    GaragePage()
}
