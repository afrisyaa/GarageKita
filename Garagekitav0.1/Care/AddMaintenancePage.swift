//
//  AddMaintenancePage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 09/08/2026.
//

import SwiftUI

struct AddMaintenancePage: View {
    
    // MARK: - Dismiss
    
    @Environment(\.dismiss)
    private var dismiss
    
    
    // MARK: - Binding
    
    @Binding var maintenanceItems:
        [MaintenanceItem]
    
    
    // MARK: - Form State
    
    @State private var maintenanceTitle = ""
    
    @State private var selectedVehicle =
        "Myvi VVA 1234"
    
    @State private var maintenanceDate =
        Date()
    
    @State private var price = ""
    
    
    @State private var selectedMaintenanceType =
        MaintenanceType(
            name: "Oil / Engine Oil",
            icon: "drop.fill"
        )
    
    
    // MARK: - Vehicles
    
    private let vehicles = [
        "Myvi VVA 1234",
        "Honda City VAB 5678",
        "Proton X70 VGN 9012"
    ]
    
    
    // MARK: - Maintenance Types
    
    private let maintenanceTypes = [
        
        MaintenanceType(
            name: "Oil / Engine Oil",
            icon: "drop.fill"
        ),
        
        MaintenanceType(
            name: "Brake / Brake Pad",
            icon: "lock.fill"
        ),
        
        MaintenanceType(
            name: "Aircond Service",
            icon: "snowflake"
        ),
        
        MaintenanceType(
            name: "General Maintenance",
            icon: "wrench.and.screwdriver.fill"
        )
    ]
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            // MARK: Background
            
            Color(
                red: 0.95,
                green: 0.95,
                blue: 0.97
            )
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                // MARK: Header
                
                HStack {
                    
                    Button {
                        dismiss()
                    } label: {
                        
                        Image(
                            systemName:
                                "chevron.left"
                        )
                        .font(
                            .system(
                                size: 25,
                                weight: .medium
                            )
                        )
                        .foregroundColor(.white)
                    }
                    
                    
                    Spacer()
                    
                    
                    Text("Add Maintenance")
                        .font(
                            .system(
                                size: 20,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    
                    
                    // Keeps title centered
                    
                    Image(
                        systemName:
                            "chevron.left"
                    )
                    .font(
                        .system(size: 25)
                    )
                    .foregroundColor(.clear)
                }
                .padding(.horizontal, 20)
                .frame(height: 56)
                .background(Color.orange)
                
                
                // MARK: Scroll Content
                
                ScrollView(
                    showsIndicators: false
                ) {
                    
                    VStack(
                        alignment: .leading,
                        spacing: 22
                    ) {
                        
                        // MARK: Top Icon / Title
                        
                        VStack(spacing: 12) {
                            
                            ZStack {
                                
                                Circle()
                                    .fill(
                                        Color.orange.opacity(
                                            0.15
                                        )
                                    )
                                    .frame(
                                        width: 110,
                                        height: 110
                                    )
                                
                                Image(
                                    systemName:
                                        selectedMaintenanceType.icon
                                )
                                .font(
                                    .system(
                                        size: 48,
                                        weight: .medium
                                    )
                                )
                                .foregroundColor(
                                    .orange
                                )
                            }
                            
                            
                            Text("Add Maintenance")
                                .font(
                                    .system(
                                        size: 24,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(
                                    .orange
                                )
                            
                            
                            Text(
                                "Record your vehicle maintenance"
                            )
                            .font(
                                .system(size: 15)
                            )
                            .foregroundColor(
                                .gray
                            )
                        }
                        .frame(
                            maxWidth: .infinity
                        )
                        .padding(.top, 25)
                        
                        
                        // MARK: Form
                        
                        VStack(spacing: 0) {
                            
                            // MARK: Maintenance Name
                            
                            HStack {
                                
                                HStack(spacing: 10) {
                                    
                                    Image(
                                        systemName:
                                            "wrench.and.screwdriver.fill"
                                    )
                                    .foregroundColor(
                                        .orange
                                    )
                                    .frame(width: 25)
                                    
                                    Text("Maintenance")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            .orange
                                        )
                                }
                                
                                Spacer()
                                
                                TextField(
                                    "e.g. Engine Oil",
                                    text:
                                        $maintenanceTitle
                                )
                                .font(
                                    .system(size: 16)
                                )
                                .foregroundColor(
                                    .orange
                                )
                                .multilineTextAlignment(
                                    .trailing
                                )
                            }
                            .padding(.horizontal, 20)
                            .frame(minHeight: 65)
                            
                            
                            Divider()
                                .padding(.leading, 20)
                            
                            
                            // MARK: Vehicle
                            
                            HStack {
                                
                                HStack(spacing: 10) {
                                    
                                    Image(
                                        systemName:
                                            "car.fill"
                                    )
                                    .foregroundColor(
                                        .orange
                                    )
                                    .frame(width: 25)
                                    
                                    Text("Vehicle")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            .orange
                                        )
                                }
                                
                                Spacer()
                                
                                Menu {
                                    
                                    ForEach(
                                        vehicles,
                                        id: \.self
                                    ) { vehicle in
                                        
                                        Button(vehicle) {
                                            
                                            selectedVehicle =
                                                vehicle
                                        }
                                    }
                                    
                                } label: {
                                    
                                    HStack(spacing: 5) {
                                        
                                        Text(
                                            selectedVehicle
                                        )
                                        
                                        Image(
                                            systemName:
                                                "chevron.down"
                                        )
                                        .font(
                                            .system(size: 11)
                                        )
                                    }
                                    .font(
                                        .system(size: 15)
                                    )
                                    .foregroundColor(
                                        .orange
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .frame(minHeight: 65)
                            
                            
                            Divider()
                                .padding(.leading, 20)
                            
                            
                            // MARK: Maintenance Type
                            
                            HStack {
                                
                                HStack(spacing: 10) {
                                    
                                    Image(
                                        systemName:
                                            selectedMaintenanceType.icon
                                    )
                                    .foregroundColor(
                                        .orange
                                    )
                                    .frame(width: 25)
                                    
                                    Text("Type")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            .orange
                                        )
                                }
                                
                                Spacer()
                                
                                Menu {
                                    
                                    ForEach(
                                        maintenanceTypes,
                                        id: \.name
                                    ) { type in
                                        
                                        Button {
                                            
                                            selectedMaintenanceType =
                                                type
                                            
                                        } label: {
                                            
                                            Label(
                                                type.name,
                                                systemImage:
                                                    type.icon
                                            )
                                        }
                                    }
                                    
                                } label: {
                                    
                                    HStack(spacing: 7) {
                                        
                                        Image(
                                            systemName:
                                                selectedMaintenanceType.icon
                                        )
                                        
                                        Text(
                                            selectedMaintenanceType.name
                                        )
                                        .lineLimit(1)
                                        
                                        Image(
                                            systemName:
                                                "chevron.down"
                                        )
                                        .font(
                                            .system(size: 11)
                                        )
                                    }
                                    .font(
                                        .system(size: 14)
                                    )
                                    .foregroundColor(
                                        .orange
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .frame(minHeight: 65)
                            
                            
                            Divider()
                                .padding(.leading, 20)
                            
                            
                            // MARK: Date
                            
                            HStack {
                                
                                HStack(spacing: 10) {
                                    
                                    Image(
                                        systemName:
                                            "calendar"
                                    )
                                    .foregroundColor(
                                        .orange
                                    )
                                    .frame(width: 25)
                                    
                                    Text("Date")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            .orange
                                        )
                                }
                                
                                Spacer()
                                
                                DatePicker(
                                    "",
                                    selection:
                                        $maintenanceDate,
                                    displayedComponents:
                                        .date
                                )
                                .labelsHidden()
                                .tint(.orange)
                            }
                            .padding(.horizontal, 20)
                            .frame(minHeight: 65)
                            
                            
                            Divider()
                                .padding(.leading, 20)
                            
                            
                            // MARK: Price
                            
                            HStack {
                                
                                HStack(spacing: 10) {
                                    
                                    Image(
                                        systemName:
                                            "dollarsign.circle.fill"
                                    )
                                    .foregroundColor(
                                        .orange
                                    )
                                    .frame(width: 25)
                                    
                                    Text("Price")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            .orange
                                        )
                                }
                                
                                Spacer()
                                
                                TextField(
                                    "RM0.00",
                                    text: $price
                                )
                                .keyboardType(
                                    .decimalPad
                                )
                                .font(
                                    .system(size: 16)
                                )
                                .foregroundColor(
                                    .orange
                                )
                                .multilineTextAlignment(
                                    .trailing
                                )
                            }
                            .padding(.horizontal, 20)
                            .frame(minHeight: 65)
                        }
                        .background(Color.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                        )
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .stroke(
                                Color.gray.opacity(0.25),
                                lineWidth: 1
                            )
                        )
                        
                        
                        // MARK: Selected Date
                        
                        VStack(
                            alignment: .leading,
                            spacing: 8
                        ) {
                            
                            Text("Maintenance Date")
                                .font(
                                    .system(
                                        size: 15,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(
                                    .gray
                                )
                            
                            Text(
                                formattedDate(
                                    maintenanceDate
                                )
                            )
                            .font(
                                .system(
                                    size: 17,
                                    weight: .semibold
                                )
                            )
                            .foregroundColor(
                                .orange
                            )
                        }
                        .padding(.horizontal, 5)
                        
                        
                        // MARK: Save Button
                        
                        Button {
                            
                            saveMaintenance()
                            
                        } label: {
                            
                            Text("Save Maintenance")
                                .font(
                                    .system(
                                        size: 17,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(.white)
                                .frame(
                                    maxWidth: .infinity
                                )
                                .frame(height: 55)
                                .background(
                                    Color.orange
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 16
                                    )
                                )
                        }
                        
                        
                        Spacer()
                            .frame(height: 30)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    // MARK: - Save Maintenance
    
    private func saveMaintenance() {
        
        let cleanTitle =
            maintenanceTitle
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
        
        
        // Don't allow empty title
        
        guard !cleanTitle.isEmpty else {
            return
        }
        
        
        // MARK: Format Price
        
        let finalPrice: String
        
        if price.isEmpty {
            
            finalPrice = "RM0.00"
            
        } else if price.uppercased().hasPrefix("RM") {
            
            finalPrice = price
            
        } else {
            
            finalPrice = "RM\(price)"
        }
        
        
        // MARK: Create Maintenance
        
        let newMaintenance =
            MaintenanceItem(
                icon:
                    selectedMaintenanceType.icon,
                title:
                    cleanTitle,
                vehicle:
                    selectedVehicle,
                date:
                    maintenanceDate,
                price:
                    finalPrice
            )
        
        
        // MARK: Add To List
        
        maintenanceItems.append(
            newMaintenance
        )
        
        
        // MARK: Save Permanently
        
        MaintenanceStorage.save(
            maintenanceItems
        )
        
        
        // MARK: Return To Care
        
        dismiss()
    }
    
    
    // MARK: - Date Formatter
    
    private func formattedDate(
        _ date: Date
    ) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        
        return formatter.string(
            from: date
        )
    }
}


// MARK: - Maintenance Type

struct MaintenanceType {
    
    let name: String
    let icon: String
}


// MARK: - Preview

#Preview {
    
    AddMaintenancePage(
        maintenanceItems:
            .constant([])
    )
}
