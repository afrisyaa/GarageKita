import SwiftUI

struct MainView: View {
    
    // Tab yang sedang dipilih
    @State private var selectedTab: AppTab = .home
    
    @StateObject private var taskstore  = TaskStore()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            selectedPage
                .environmentObject(taskstore)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            customTabBar
        }
    }
    
    
    // MARK: - Selected Page
    
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
    
    
    // MARK: - Custom Tab Bar
    
    private var customTabBar: some View {
        
        HStack {
            
            tabButton(.home)
            
            tabButton(.care)
            
            garageButton()
            
            tabButton(.emergency)
            
            tabButton(.profile)
        }
        .padding(.horizontal, 4)
        .padding(.vertical, 0.5)
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(
                    color: .black.opacity(0.15),
                    radius: 4,
                    x: 0,
                    y: 2
                )
        )
        .padding(.horizontal, 5)
        .padding(.bottom, -10)
    }
    
    
    // MARK: - Normal Tab Button
    
    private func tabButton(
        _ tab: AppTab
    ) -> some View {
        
        Button {
            
            selectedTab = tab
            
        } label: {
            
            VStack(spacing: 4) {
                
                Image(
                    systemName: tab.iconName
                )
                .font(.title2)
                .foregroundStyle(
                    selectedTab == tab
                    ? .blue
                    : .black
                )
                
                Text(tab.title)
                    .font(.caption2)
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    
    // MARK: - Garage Button
    
    private func garageButton() -> some View {
        
        Button {
            
            selectedTab = .garage
            
        } label: {
            
            VStack(spacing: 0.5) {
                
                ZStack {
                    
                    Circle()
                        .fill(
                            selectedTab == .garage
                            ? Color.blue
                            : Color.white
                        )
                        .frame(
                            width: 62,
                            height: 62
                        )
                        .shadow(
                            color: .black.opacity(0.18),
                            radius: 6,
                            x: 0,
                            y: 3
                        )
                    
                    Image(
                        systemName:
                            AppTab.garage.iconName
                    )
                    .font(.title)
                    .foregroundStyle(
                        selectedTab == .garage
                        ? .white
                        : .black
                    )
                }
                
                Text(
                    AppTab.garage.title
                )
                .font(.caption2)
                .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
            .offset(y: -18)
        }
    }
}


// MARK: - App Tab

enum AppTab {
    
    case home
    case care
    case garage
    case emergency
    case profile
    
    
    // MARK: Tab Title
    
    var title: String {
        
        switch self {
            
        case .home:
            return "Home"
            
        case .care:
            return "Care"
            
        case .garage:
            return "Garage"
            
        case .emergency:
            return "Emergency"
            
        case .profile:
            return "Profile"
        }
    }
    
    
    // MARK: SF Symbol
    
    var iconName: String {
        
        switch self {
            
        case .home:
            return "house.fill"
            
        case .care:
            return "long.text.page.and.pencil.fill"
            
        case .garage:
            return "car.fill"
            
        case .emergency:
            return "phone.fill"
            
        case .profile:
            return "person.fill"
        }
    }
}


// MARK: - Preview

#Preview {
    MainView()
}
