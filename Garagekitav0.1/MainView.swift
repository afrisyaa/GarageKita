//
//  MainView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 05/08/2026.
//

import SwiftUI

struct MainView: View {
    
    // Simpan tab yang sedang dipilih oleh pengguna.
    @State private var selectedTab: AppTab = .home
    
    @StateObject private var taskstore  = TaskStore()
    
    var body: some View {
        // ZStack digunakan supaya page berada di belakang dan navbar berada di bawah.
        ZStack(alignment: .bottom) {
            selectedPage
                .environmentObject(taskstore)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            customTabBar
        }
    }
    
    // Tukar paparan page mengikut tab yang dipilih.
    private var selectedPage: some View {
        Group {
            switch selectedTab {
            case .home:
                HomePage()
            case .care:
                CarePage()
            case .garage:
                GaragePage()
            case .emergency:
                EmergencyPage()
            case .profile:
                ProfilePage()
            }
        }
    }
    
    // Navbar custom di bahagian bawah app.
    private var customTabBar: some View {
        HStack {
            tabButton(.home)
            tabButton(.care)
            
            garageButton()
            
            tabButton(.emergency)
            tabButton(.profile)
        }
        
        // Reka bentuk background navbar.
        .padding(.horizontal, 4)
        .padding(.vertical, 0.5)
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
        )
        .padding(.horizontal, 5)
        
        .padding(.bottom, -10)
    }
    
    // Button biasa untuk tab Home, Care, Emergency dan Profile.
    private func tabButton(_ tab: AppTab) -> some View {
        Button {
            
            
            // Bila button ditekan, tab yang aktif akan bertukar.
            selectedTab = tab
        } label: {
            
            
            VStack(spacing: 4) {
                Image(systemName: tab.iconName)
                    .font(.title2)
                    .foregroundStyle(selectedTab == tab ? .blue : .black)
                
                Text(tab.title)
                    .font(.caption2)
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    // Button khas untuk Garage kerana posisinya di tengah dan dinaikkan ke atas.
    private func garageButton() -> some View {
        Button {
            selectedTab = .garage
        } label: {
            
            
            VStack(spacing: 0.5) {
                ZStack {
                    
                    // Bulatan background untuk icon Garage.
                    Circle()
                        .fill(selectedTab == .garage ? Color.blue : Color.white)
                        .frame(width: 62, height: 62)
                        .shadow(color: .black.opacity(0.18), radius: 6, x: 0, y: 3)
                    
                    Image(systemName: AppTab.garage.iconName)
                        .font(.title)
                        .foregroundStyle(selectedTab == .garage ? .white : .black)
                }
                
                Text(AppTab.garage.title)
                    .font(.caption2)
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
            .offset(y: -18)
        }
    }
}

// Senarai semua tab yang digunakan dalam navbar.
enum AppTab {
    case home
    case care
    case garage
    case emergency
    case profile
    
    // Nama yang dipaparkan di bawah icon.
    var title: String {
        switch self {
        case .home:
            "Home"
        case .care:
            "Care"
        case .garage:
            "Garage"
        case .emergency:
            "Emergency"
        case .profile:
            "Profile"
        }
    }
    

    // Nama SF Symbol untuk setiap icon tab.
    var iconName: String {
        switch self {
        case .home:
            "house.fill"
        case .care:
            "long.text.page.and.pencil.fill"
        case .garage:
            "car.fill"
        case .emergency:
            "phone.fill"
        case .profile:
            "person.fill"
        }
    }
}

#Preview {
    MainView()
}
