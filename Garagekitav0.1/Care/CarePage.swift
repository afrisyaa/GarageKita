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
    
    
    // MARK: - Colors
    
    private let blueColor = Color(
        red: 0.02,
        green: 0.31,
        blue: 0.53
    )
    
    private let orangeColor = Color(
        red: 1.0,
        green: 0.55,
        blue: 0.10
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
                .ignoresSafeArea()
                
                
                VStack(spacing: 0) {
                    
                    // MARK: Header
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("Care")
                            .font(
                                .system(
                                    size: 22,
                                    weight: .bold
                                )
                            )
                            .foregroundColor(.white)
                        
                        Spacer()
                        
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
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 48)
                    .background(orangeColor)
                    
                    
                    // MARK: Main Content
                    
                    ScrollView(
                        showsIndicators: false
                    ) {
                        
                        VStack(
                            alignment: .leading,
                            spacing: 20
                        ) {
                            
                            // MARK: Maintenance / Warranty Toggle
                            
                            HStack(spacing: 0) {
                                
                                // MARK: Maintenance
                                
                                Button {
                                    
                                    withAnimation(
                                        .easeInOut(duration: 0.2)
                                    ) {
                                        showingWarranty = false
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
                                        .frame(height: 38)
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
                            
                            
                            // MARK: Section Title
                            
                            Text(
                                showingWarranty
                                ? "Active Warranties"
                                : "Active Maintenance"
                            )
                            .font(
                                .system(
                                    size: 20,
                                    weight: .bold
                                )
                            )
                            .foregroundColor(
                                showingWarranty
                                ? blueColor
                                : orangeColor
                            )
                            
                            
                            // MARK: Content Cards
                            
                            if showingWarranty {
                                
                                warrantyContent
                                
                            } else {
                                
                                maintenanceContent
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 22)
                        .padding(.bottom, 120)
                    }
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
                    orangeColor: orangeColor
                )
            }
            .buttonStyle(.plain)
        }
    }
    
    
    // MARK: - Warranty Content
    
    @ViewBuilder
    private var warrantyContent: some View {
        
        // MARK: Warranty 1
        
        NavigationLink {
            
            MaintenanceDetailView(
                icon: "shield.fill",
                title: "Engine Oil",
                vehicle: "Myvi VVA 1234",
                date: "24 Aug 2026",
                price: "RM190.00",
                type: "Warranty"
            )
            
        } label: {
            
            WarrantyCard(
                title: "Engine Oil",
                vehicle: "Myvi VVA 1234",
                validUntil: "Valid until 24 Aug 2026",
                daysLeft: "22 days left",
                blueColor: blueColor
            )
        }
        .buttonStyle(.plain)
        
        
        // MARK: Warranty 2
        
        NavigationLink {
            
            MaintenanceDetailView(
                icon: "shield.fill",
                title: "Brake Pad (Front)",
                vehicle: "Honda City VAB 5678",
                date: "10 Sept 2026",
                price: "RM350.00",
                type: "Warranty"
            )
            
        } label: {
            
            WarrantyCard(
                title: "Brake Pad (Front)",
                vehicle: "Honda City VAB 5678",
                validUntil: "Valid until 10 Sept 2026",
                daysLeft: "40 days left",
                blueColor: blueColor
            )
        }
        .buttonStyle(.plain)
        
        
        // MARK: Warranty 3
        
        NavigationLink {
            
            MaintenanceDetailView(
                icon: "shield.fill",
                title: "Aircond Service",
                vehicle: "Proton X70 VGN 9012",
                date: "15 Sept 2026",
                price: "RM250.00",
                type: "Warranty"
            )
            
        } label: {
            
            WarrantyCard(
                title: "Aircond Service",
                vehicle: "Proton X70 VGN 9012",
                validUntil: "Valid until 15 Sept 2026",
                daysLeft: "45 days left",
                blueColor: blueColor
            )
        }
        .buttonStyle(.plain)
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
                    vehicle: "Myvi VVA 1234",
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
                    vehicle: "Myvi VVA 1234",
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
                    vehicle: "Myvi VVA 1234",
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
    let orangeColor: Color
    
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            // MARK: Icon
            
            ZStack {
                
                Circle()
                    .fill(
                        Color.orange.opacity(0.15)
                    )
                    .frame(
                        width: 54,
                        height: 54
                    )
                
                Image(systemName: icon)
                    .font(
                        .system(
                            size: 25,
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
                            size: 17,
                            weight: .bold
                        )
                    )
                    .foregroundColor(
                        orangeColor
                    )
                
                Text(vehicle)
                    .font(
                        .system(size: 16)
                    )
                    .foregroundColor(
                        orangeColor
                    )
                
                Text(price)
                    .font(
                        .system(size: 16)
                    )
                    .foregroundColor(
                        orangeColor
                    )
            }
            
            
            Spacer()
            
            
            // MARK: Maintenance Age
            
            Text(
                maintenanceAge(
                    from: date
                )
            )
            .font(
                .system(
                    size: 13,
                    weight: .medium
                )
            )
            .foregroundColor(.red)
            .multilineTextAlignment(.trailing)
            .frame(
                maxWidth: 70,
                alignment: .trailing
            )
        }
        .padding(.horizontal, 14)
        .frame(height: 118)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 18
            )
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 18
            )
            .stroke(
                Color.gray.opacity(0.65),
                lineWidth: 1
            )
        )
    }
    
    
    // MARK: Maintenance Age
    
    private func maintenanceAge(
        from date: Date
    ) -> String {
        
        let calendar = Calendar.current
        
        let startDate =
            calendar.startOfDay(for: date)
        
        let today =
            calendar.startOfDay(for: Date())
        
        
        // MARK: Today
        
        if calendar.isDateInToday(date) {
            return "Today"
        }
        
        
        // MARK: Future
        
        if startDate > today {
            
            let days =
                calendar.dateComponents(
                    [.day],
                    from: today,
                    to: startDate
                ).day ?? 0
            
            if days == 1 {
                return "In 1 day"
            }
            
            return "In \(days) days"
        }
        
        
        // MARK: Years
        
        let years =
            calendar.dateComponents(
                [.year],
                from: startDate,
                to: today
            ).year ?? 0
        
        if years > 0 {
            
            if years == 1 {
                return "1 year ago"
            }
            
            return "\(years) years ago"
        }
        
        
        // MARK: Months
        
        let months =
            calendar.dateComponents(
                [.month],
                from: startDate,
                to: today
            ).month ?? 0
        
        if months > 0 {
            
            if months == 1 {
                return "1 month ago"
            }
            
            return "\(months) months ago"
        }
        
        
        // MARK: Days
        
        let days =
            calendar.dateComponents(
                [.day],
                from: startDate,
                to: today
            ).day ?? 0
        
        if days == 1 {
            return "1 day ago"
        }
        
        return "\(days) days ago"
    }
}


// MARK: - Warranty Card

struct WarrantyCard: View {
    
    let title: String
    let vehicle: String
    let validUntil: String
    let daysLeft: String
    let blueColor: Color
    
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            // MARK: Shield Icon
            
            ZStack {
                
                Circle()
                    .fill(
                        Color(
                            red: 0.90,
                            green: 0.94,
                            blue: 0.98
                        )
                    )
                    .frame(
                        width: 54,
                        height: 54
                    )
                
                // Shield ONLY
                
                Image(
                    systemName: "shield.fill"
                )
                .font(
                    .system(
                        size: 27,
                        weight: .medium
                    )
                )
                .foregroundColor(
                    blueColor
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
                            size: 17,
                            weight: .bold
                        )
                    )
                    .foregroundColor(
                        blueColor
                    )
                
                Text(vehicle)
                    .font(
                        .system(size: 16)
                    )
                    .foregroundColor(
                        blueColor
                    )
                
                Text(validUntil)
                    .font(
                        .system(size: 16)
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
        .frame(height: 118)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 18
            )
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 18
            )
            .stroke(
                Color.gray.opacity(0.65),
                lineWidth: 1
            )
        )
    }
}


// MARK: - Preview

#Preview {
    CarePage()
}
