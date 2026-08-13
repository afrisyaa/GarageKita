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
        VehicleStorage.vehicleNames().first ?? ""
    
    @State private var vehicles =
        VehicleStorage.vehicleNames()
    
    @State private var maintenanceDate =
        Date()
    
    @State private var price = ""
    
    @State private var isMaintenanceReminderOn = false
    
    @State private var showingWarrantyPage = false
    
    @State private var savedWarrantyMaintenance:
        MaintenanceItem?
    
    
    @State private var selectedMaintenanceType =
        MaintenanceType(
            name: "Oil / Engine Oil",
            icon: "drop.fill"
        )
    
    
    // MARK: - Vehicles
    
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
            //.ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                // MARK: Header
                
                Color.white
                    .frame(height: 1)
                
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
                .frame(height: 65)
                .background(Color(red: 1.0, green: 0.67, blue: 0.0))
                
                
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
                                ZStack {
                                    
                                    Circle()
                                        .fill(
                                            Color(red: 1.0, green: 0.67, blue: 0.0).opacity(
                                                0.15
                                            )
                                        )
                                        .frame(
                                            width: 90,
                                            height: 90
                                        )
                                    
                                    Image(
                                        systemName:
                                            selectedMaintenanceType.icon
                                    )
                                    .font(
                                        .system(
                                            size: 36,
                                            weight: .medium
                                        )
                                    )
                                    .foregroundStyle(
                                        Color(red: 1.0, green: 0.67, blue: 0.0)
                                    )
                                    
                                    Circle()
                                        .fill(
                                            Color(red: 0.02, green: 0.32, blue: 0.56)
                                        )
                                        .frame(
                                            width: 28,
                                            height: 28
                                        )
                                        .overlay(
                                            Image(systemName: "pencil")
                                                .font(.caption2)
                                                .bold()
                                                .foregroundStyle(.white)
                                        )
                                        .offset(x: 29, y: 29)
                                }
                            }
                            
                            Text("Tap to change icon")
                                .font(.caption)
                                .bold()
                                .foregroundStyle(.gray)
                            
                            
                            Text("Add Maintenance")
                                .font(
                                    .system(
                                        size: 24,
                                        weight: .bold
                                    )
                                )
                                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))

                            
                            Text(
                                "Record your vehicle maintenance"
                            )
                            .font(
                                .system(size: 15)
                            )
                            .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))

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
                                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                                    .frame(width: 25)
                                    
                                    Text("Maintenance")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))

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
                                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
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
                                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                                    .frame(width: 25)
                                    
                                    Text("Vehicle")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))

                                        
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
                                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))

                                    
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
                                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56)

                                    )
                                    .frame(width: 25)
                                    
                                    Text("Type")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56)

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
                                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))

                                    
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
                                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56)

                                    )
                                    .frame(width: 25)
                                    
                                    Text("Date")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56)

                                        )
                                }
                                
                                Spacer()
                                
                                ZStack {
                                    Text(formattedDate(maintenanceDate))
                                        .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                                    
                                    DatePicker(
                                        "",
                                        selection:
                                            $maintenanceDate,
                                        displayedComponents:
                                            .date
                                    )
                                    .labelsHidden()
                                    //.tint(.orange)
                                    .tint(Color(red: 0.02, green: 0.32, blue: 0.56))
                                    .opacity(0.02)
                                }
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
                                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56)

                                    )
                                    .frame(width: 25)
                                    
                                    Text("Price")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))

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
                        
                        HStack {
                            Text("Does the maintenance have warrenty?")
                                .font(
                                    .system(
                                        size: 15,
                                        weight: .bold
                                    )
                                )
                                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            
                            Spacer()
                            
                            Toggle("", isOn: $isMaintenanceReminderOn)
                                .labelsHidden()
                                .tint(.green)
                        }
                        .padding(.horizontal, 5)
                        
                        
                        // MARK: Save Button
                        
                        Button {
                            
                            saveMaintenance()
                            
                        } label: {
                            
                            Text("Next")
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
                                .background(Color(red: 1.0, green: 0.67, blue: 0.0))
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
        .onAppear {
            refreshVehicles()
        }
        .fullScreenCover(
            isPresented: $showingWarrantyPage
        ) {
            
            if let savedWarrantyMaintenance {
                
                WarrantyPage(
                    vehicleName:
                        savedWarrantyMaintenance.vehicle,
                    serviceName:
                        savedWarrantyMaintenance.title,
                    store: "",
                    serviceDate:
                        savedWarrantyMaintenance.date,
                    notes: "",
                    onFinished: {
                        showingWarrantyPage = false
                        dismiss()
                    }
                )
            }
        }
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
        
        
        // MARK: Next Step
        
        if isMaintenanceReminderOn {
            
            savedWarrantyMaintenance =
                newMaintenance
            
            showingWarrantyPage = true
            
        } else {
            
            dismiss()
        }
    }
    
    
    private func refreshVehicles() {
        
        vehicles =
            VehicleStorage.vehicleNames()
        
        if !vehicles.contains(selectedVehicle) {
            selectedVehicle =
                vehicles.first ?? ""
        }
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
