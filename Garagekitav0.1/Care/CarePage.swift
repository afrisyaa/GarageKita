//
//  CarePage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 07/08/2026.
//

import SwiftUI

struct CarePage: View {
    
    // MARK: - State
    
    @State private var showingWarranty = false
    @State private var showingAddMaintenance = false
    
    @State private var maintenanceItems: [MaintenanceItem] = []
    @State private var warrantyItems: [WarrantyItem] = [
        WarrantyItem(
            title: "Engine Oil",
            vehicle: VehicleStorage.vehicleName(at: 1),
            validUntil: "Valid until 24 Aug 2026",
            date: "24 Aug 2026",
            daysLeft: "22 days left",
            price: "RM190.00"
        ),
        WarrantyItem(
            title: "Brake Pad (Front)",
            vehicle: VehicleStorage.vehicleName(at: 0),
            validUntil: "Valid until 10 Sept 2026",
            date: "10 Sept 2026",
            daysLeft: "40 days left",
            price: "RM350.00"
        ),
        WarrantyItem(
            title: "Aircond Service",
            vehicle: VehicleStorage.vehicleName(at: 3),
            validUntil: "Valid until 15 Sept 2026",
            date: "15 Sept 2026",
            daysLeft: "45 days left",
            price: "RM250.00"
        )
    ]
    
    
    // MARK: - Colors
    
    private let blueColor = Color(
        red: 0.02, green: 0.32, blue: 0.56
    )
    
    
    private let orangeColor = Color(
        red:1.0, green: 0.67, blue: 0.0
    )
    
    
    // MARK: - Body
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // MARK: Background
                
              
                
                Color(
                    red: 0.95,
                    green: 0.95,
                    blue: 0.97
                )
                
                
                
                VStack(spacing: 0) {
                    
                    // MARK: Header
                    
                    Color.white
                        .frame(height: 1)

                    
                    HStack {
                        
                        
                        Text("Care")
                            .font(.title3
                            )
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .offset(x: 25)
                        
                        Button {
                            
                            showingAddMaintenance = true
                            
                        } label: {
                            
                            Image(systemName: "plus")
                                .font(
                                    .system(
                                        size: 25,
                                        weight: .medium
                                    )
                                )
                                .foregroundColor(.white)
                        }
                        .frame(width: 40)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity)
                    .frame(height: 65)
                    .background(Color(red:1.0, green: 0.67, blue: 0.0))
                    //Color(red:1.0, green: 0.67, blue: 0.0)
                    
                    // MARK: Main Content
                    
                    List {
                        
                        // MARK: Maintenance / Warranty Toggle
                        
                        HStack(spacing: 0) {
                            
                            // MARK: Maintenance
                            
                            Button {
                                
                                withAnimation(
                                    .easeInOut(duration: 0.2)
                                ) {
                                    showingWarranty = true
                                }
                                
                            } label: {
                                
                                Text("Maintenance")
                                    .font(
                                        .system(
                                            size: 17,
                                            weight: showingWarranty
                                            ? .regular
                                            : .bold
                                        )
                                    )
                                    .foregroundColor(
                                        showingWarranty
                                        ? blueColor
                                        : .white
                                    )
                                    .frame(
                                        maxWidth: .infinity
                                    )
                                    .frame(height: 38)
                                    .background(
                                        Capsule()
                                            .fill(
                                                showingWarranty
                                                ? Color.clear
                                                : blueColor
                                            )
                                    )
                            }
                            
                            
                            // MARK: Warranty
                            
                            Button {
                                
                                withAnimation(
                                    .easeInOut(duration: 0.2)
                                ) {
                                    showingWarranty = true
                                }
                                
                            } label: {
                                
                                Text("Warranty")
                                    .font(
                                        .system(
                                            size: 17,
                                            weight: .bold
                                        )
                                    )
                                    .foregroundColor(
                                        showingWarranty
                                        ? .white
                                        : blueColor
                                    )
                                    .frame(
                                        maxWidth: .infinity
                                    )
                                    .frame(height: 40)
                                    .background(
                                        Capsule()
                                            .fill(
                                                showingWarranty
                                                ? blueColor
                                                : Color.clear
                                            )
                                    )
                            }
                        }
                        .padding(4)
                        .frame(height: 50)
                        .background(
                            Capsule()
                                .fill(Color.white)
                        )
                        .overlay(
                            Capsule()
                                .stroke(
                                    Color.gray.opacity(0.55),
                                    lineWidth: 1
                                )
                        )
                        .padding(.horizontal, 20)
                        .padding(.top, 22)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        
                        
                        // MARK: Section Title
                        
                        Text(
                            showingWarranty
                            ? "Active Warranties"
                            : "Maintenance Log"
                        )
                        .font(
                            .system(
                                size: 20,
                                weight: .bold
                            )
                        )
                        .foregroundColor(blueColor)
                        .padding(.horizontal, 20)
                        .padding(.top, 4)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        
                        
                        // MARK: Content Cards
                        
                        if showingWarranty {
                            
                            warrantyContent
                            
                        } else {
                            
                            maintenanceContent
                        }
                        
                        Color.clear
                            .frame(height: 120)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            
            // MARK: Add Maintenance
            
            .fullScreenCover(
                isPresented: $showingAddMaintenance
            ) {
                
                AddMaintenancePage(
                    maintenanceItems: $maintenanceItems
                )
            }
            
            // MARK: Load Data
            
            .onAppear {
                loadMaintenanceItems()
            }
        }
    }
    
    
    // MARK: - Maintenance Content
    
    @ViewBuilder
    private var maintenanceContent: some View {
        
        ForEach(maintenanceItems) { item in
            
            NavigationLink {
                
                MaintenanceDetailView(
                    icon: item.icon,
                    title: item.title,
                    vehicle: item.vehicle,
                    date: formattedDate(item.date),
                    price: item.price,
                    type: "Maintenance"
                )
                
            } label: {
                
                MaintenanceCard(
                    icon: item.icon,
                    title: item.title,
                    vehicle: item.vehicle,
                    date: item.date,
                    price: item.price,
                    blueColor: blueColor,
                    orangeColor: orangeColor
                )
            }
            .buttonStyle(.plain)
            .listRowInsets(
                EdgeInsets(
                    top: 0,
                    leading: 34,
                    bottom: 8,
                    trailing: 34
                )
            )
            .listRowSeparator(.hidden)
            .listRowBackground(cardRowBackground)
            .swipeActions(edge: .trailing) {
                
                Button(role: .destructive) {
                    
                    deleteMaintenanceItem(item)
                    
                } label: {
                    
                    Label("Delete", systemImage: "trash")
                }
            }
        }
    }
    
    
    // MARK: - Warranty Content
    
    @ViewBuilder
    private var warrantyContent: some View {
        
        ForEach(warrantyItems) { item in
            
            NavigationLink {
                
                MaintenanceDetailView(
                    icon: "shield.fill",
                    title: item.title,
                    vehicle: item.vehicle,
                    date: item.date,
                    price: item.price,
                    type: "Warranty"
                )
                
            } label: {
                
                WarrantyCard(
                    title: item.title,
                    vehicle: item.vehicle,
                    validUntil: item.validUntil,
                    daysLeft: item.daysLeft,
                    blueColor: blueColor,
                    orangeColor: orangeColor
                )
            }
            .buttonStyle(.plain)
            .listRowInsets(
                EdgeInsets(
                    top: 0,
                    leading: 34,
                    bottom: 8,
                    trailing: 34
                )
            )
            .listRowSeparator(.hidden)
            .listRowBackground(cardRowBackground)
            .swipeActions(edge: .trailing) {
                
                Button(role: .destructive) {
                    
                    deleteWarrantyItem(item)
                    
                } label: {
                    
                    Label("Delete", systemImage: "trash")
                }
            }
        }
    }
    
    
    private var cardRowBackground: some View {
        
        RoundedRectangle(cornerRadius: 18)
            .fill(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(
                        Color.gray.opacity(0.65),
                        lineWidth: 1
                    )
            )
            .padding(.horizontal, 20)
            .padding(.bottom, 8)
    }
    
    
    // MARK: - Load Maintenance
    
    private func loadMaintenanceItems() {
        
        let savedItems = MaintenanceStorage.load()
        
        if savedItems.isEmpty {
            
            // First time:
            // create the 3 default maintenance records.
            
            maintenanceItems = [
                
                MaintenanceItem(
                    icon: "drop.fill",
                    title: "Engine Oil",
                    vehicle: VehicleStorage.vehicleName(at: 1),
                    date: Calendar.current.date(
                        byAdding: .day,
                        value: -15,
                        to: Date()
                    ) ?? Date(),
                    price: "RM190.00"
                ),
                
                MaintenanceItem(
                    icon: "lock.fill",
                    title: "Brake Pad Placement",
                    vehicle: VehicleStorage.vehicleName(at: 1),
                    date: Calendar.current.date(
                        byAdding: .month,
                        value: -2,
                        to: Date()
                    ) ?? Date(),
                    price: "RM190.00"
                ),
                
                MaintenanceItem(
                    icon: "snowflake",
                    title: "Aircond Service",
                    vehicle: VehicleStorage.vehicleName(at: 1),
                    date: Calendar.current.date(
                        byAdding: .day,
                        value: -30,
                        to: Date()
                    ) ?? Date(),
                    price: "RM190.00"
                )
            ]
            
            MaintenanceStorage.save(
                maintenanceItems
            )
            
        } else {
            
            // Existing data
            
            maintenanceItems = savedItems
            
            // Update the original 3 icons
            // in case they were saved using
            // the old wrench icon.
            
            var changed = false
            
            for index in maintenanceItems.indices {
                
                switch maintenanceItems[index].title {
                    
                case "Engine Oil":
                    
                    if maintenanceItems[index].icon
                        != "drop.fill" {
                        
                        maintenanceItems[index].icon =
                            "drop.fill"
                        
                        changed = true
                    }
                    
                case "Brake Pad Placement":
                    
                    if maintenanceItems[index].icon
                        != "lock.fill" {
                        
                        maintenanceItems[index].icon =
                            "lock.fill"
                        
                        changed = true
                    }
                    
                case "Aircond Service":
                    
                    if maintenanceItems[index].icon
                        != "snowflake" {
                        
                        maintenanceItems[index].icon =
                            "snowflake"
                        
                        changed = true
                    }
                    
                default:
                    break
                }
            }
            
            if changed {
                
                MaintenanceStorage.save(
                    maintenanceItems
                )
            }
        }
    }
    
    
    // MARK: - Delete Maintenance
    
    private func deleteMaintenanceItem(
        _ item: MaintenanceItem
    ) {
        
        maintenanceItems.removeAll {
            $0.id == item.id
        }
        
        MaintenanceStorage.save(
            maintenanceItems
        )
    }
    
    
    // MARK: - Delete Warranty
    
    private func deleteWarrantyItem(
        _ item: WarrantyItem
    ) {
        
        warrantyItems.removeAll {
            $0.id == item.id
        }
    }
    
    
    // MARK: - Date Formatter
    
    private func formattedDate(
        _ date: Date
    ) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        
        return formatter.string(
            from: date
        )
    }
}


// MARK: - Maintenance Item

struct MaintenanceItem: Identifiable, Codable {
    
    var id: UUID = UUID()
    
    var icon: String
    
    var title: String
    
    var vehicle: String
    
    var date: Date
    
    var price: String
}


// MARK: - Warranty Item

struct WarrantyItem: Identifiable {
    
    let id: UUID = UUID()
    
    let title: String
    
    let vehicle: String
    
    let validUntil: String
    
    let date: String
    
    let daysLeft: String
    
    let price: String
}


// MARK: - Maintenance Storage

struct MaintenanceStorage {
    
    private static let key =
        "garageKitaMaintenanceItems"
    
    
    static func save(
        _ items: [MaintenanceItem]
    ) {
        
        do {
            
            let data =
                try JSONEncoder().encode(items)
            
            UserDefaults.standard.set(
                data,
                forKey: key
            )
            
        } catch {
            
            print(
                "Failed to save maintenance: \(error)"
            )
        }
    }
    
    
    static func load()
        -> [MaintenanceItem] {
        
        guard let data =
                UserDefaults.standard.data(
                    forKey: key
                )
        else {
            return []
        }
        
        do {
            
            return try JSONDecoder().decode(
                [MaintenanceItem].self,
                from: data
            )
            
        } catch {
            
            print(
                "Failed to load maintenance: \(error)"
            )
            
            return []
        }
    }
}


// MARK: - Maintenance Card

struct MaintenanceCard: View {
    
    let icon: String
    let title: String
    let vehicle: String
    let date: Date
    let price: String
    let blueColor: Color
    let orangeColor: Color
    
    
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            // MARK: Icon
            
            ZStack {
                
                Circle()
                    .fill(
                        Color(red: 242/255, green: 177/255, blue: 61/255).opacity(0.15)
                    )
                    .frame(
                        width: 54,
                        height: 45
                    )
                
                Image(systemName: icon)
                    .font(
                        .system(
                            size: 20,
                            weight: .medium
                        )
                    )
                    .foregroundColor(
                        orangeColor
                    )
            }
            
            
            // MARK: Information
            
            VStack(
                alignment: .leading,
                spacing: 3
            ) {
                
                Text(title)
                    .font(
                        .system(
                            size: 15,
                            weight: .bold
                        )
                    )
                    .foregroundColor(
                        blueColor
                    )
                
                Text(vehicle)
                    .font(
                        .system(size: 13)
                    )
                    .foregroundColor(
                        blueColor
                    )
                
                Text(price)
                    .font(
                        .system(size: 11)
                    )
                    .foregroundColor(
                        blueColor
                    )
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 14)
        .frame(height: 70)
    }
}


// MARK: - Warranty Card

struct WarrantyCard: View {
    
    let title: String
    let vehicle: String
    let validUntil: String
    let daysLeft: String
    let blueColor: Color
    let orangeColor: Color
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            // MARK: Shield Icon
            
            ZStack {
                
                Circle()
                    .fill(
                        Color(red: 242/255, green: 177/255, blue: 61/255).opacity(0.15)
                    )
                    .frame(
                        width: 45,
                        height: 54
                    )
                
                // Shield ONLY
                
                Image(
                    systemName: "shield.fill"
                )
                .font(
                    .system(
                        size: 20,
                        weight: .medium
                    )
                )
                .foregroundColor(
                    orangeColor
                )
            }
            
            
            // MARK: Information
            
            VStack(
                alignment: .leading,
                spacing: 5
            ) {
                
                Text(title)
                    .font(
                        .system(
                            size: 13,
                            weight: .bold
                        )
                    )
                    .foregroundColor(
                        blueColor
                    )
                
                Text(vehicle)
                    .font(
                        .system(size: 13)
                    )
                    .foregroundColor(
                        blueColor
                    )
                
                Text(validUntil)
                    .font(
                        .system(size: 13)
                    )
                    .foregroundColor(
                        blueColor
                    )
            }
            
            
            Spacer()
            
            
            // MARK: Days Left
            
            Text(daysLeft)
                .font(
                    .system(
                        size: 13,
                        weight: .medium
                    )
                )
                .foregroundColor(.green)
                .multilineTextAlignment(.trailing)
                .frame(
                    maxWidth: 65,
                    alignment: .trailing
                )
        }
        .padding(.horizontal, 14)
        .frame(height: 70)
    }
}


// MARK: - Preview

#Preview {
    CarePage()
}
