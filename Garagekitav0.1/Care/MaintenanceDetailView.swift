//
//  MaintenanceDetailView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 09/08/2026.
//

import SwiftUI

struct MaintenanceDetailView: View {
    
    // MARK: - Environment
    
    @Environment(\.dismiss) private var dismiss
    
    
    // MARK: - Data
    
    let icon: String
    let title: String
    let vehicle: String
    let date: String
    let price: String
    let type: String
    
    
    // MARK: - Colors
    
    private let blueColor = Color(
        red: 0.02,
        green: 0.31,
        blue: 0.53
    )
    
    private let orange = Color(
        red: 1.0,
        green: 0.65,
        blue: 0.05
    )
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Background
            
            Color(
                red: 0.93,
                green: 0.93,
                blue: 0.93
            )
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                // MARK: - Top Bar
                
                HStack {
                    
                    // Back Button
                    
                    Button {
                        dismiss()
                    } label: {
                        
                        Image(
                            systemName: "chevron.left"
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
                    
                    
                    // Page Title
                    
                    Text(
                        type == "Warranty"
                        ? "Warranty Detail"
                        : "Maintenance Detail"
                    )
                    .font(
                        .system(
                            size: 20,
                            weight: .bold
                        )
                    )
                    .foregroundColor(.white)
                    
                    
                    Spacer()
                    
                    
                    // Invisible button for perfect title centering
                    
                    Image(
                        systemName: "chevron.left"
                    )
                    .font(
                        .system(
                            size: 25,
                            weight: .medium
                        )
                    )
                    .foregroundColor(.clear)
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(orange)
                
                
                // MARK: - Main Content
                
                ScrollView(
                    showsIndicators: false
                ) {
                    
                    VStack(
                        alignment: .leading,
                        spacing: 24
                    ) {
                        
                        // MARK: - Centered Header
                        
                        VStack(spacing: 8) {
                            
                            // Service Icon
                            
                            ZStack {
                                
                                Circle()
                                    .fill(
                                        Color.orange.opacity(0.15)
                                    )
                                    .frame(
                                        width: 110,
                                        height: 110
                                    )
                                
                                Image(
                                    systemName: icon
                                )
                                .font(
                                    .system(
                                        size: 48,
                                        weight: .medium
                                    )
                                )
                                .foregroundColor(.orange)
                            }
                            
                            
                            // Service Name
                            
                            Text(title)
                                .font(
                                    .system(
                                        size: 24,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(.primary)
                                .multilineTextAlignment(.center)
                            
                            
                            // Vehicle Name
                            
                            Text(vehicle)
                                .font(
                                    .system(size: 17)
                                )
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                        
                        
                        // MARK: - Type Badge
                        
                        HStack {
                            
                            Spacer()
                            
                            Text(type)
                                .font(
                                    .system(
                                        size: 14,
                                        weight: .semibold
                                    )
                                )
                                .foregroundColor(.white)
                                .padding(
                                    .horizontal,
                                    14
                                )
                                .padding(
                                    .vertical,
                                    7
                                )
                                .background(
                                    Capsule()
                                        .fill(
                                            type == "Warranty"
                                            ? Color.green
                                            : Color.orange
                                        )
                                )
                            
                            Spacer()
                        }
                        
                        
                        // MARK: - Maintenance Information
                        
                        VStack(
                            alignment: .leading,
                            spacing: 16
                        ) {
                            
                            Text(
                                type == "Warranty"
                                ? "Warranty Information"
                                : "Maintenance Information"
                            )
                            .font(
                                .system(
                                    size: 18,
                                    weight: .bold
                                )
                            )
                            
                            
                            DetailRow(
                                icon: "car.fill",
                                title: "Vehicle",
                                value: vehicle
                            )
                            
                            
                            DetailRow(
                                icon: "wrench.and.screwdriver.fill",
                                title: "Service",
                                value: title
                            )
                            
                            
                            DetailRow(
                                icon: "calendar",
                                title: type == "Warranty"
                                ? "Valid Until"
                                : "Maintenance Date",
                                value: date
                            )
                            
                            
                            DetailRow(
                                icon: "creditcard.fill",
                                title: "Price",
                                value: price
                            )
                        }
                        .padding(18)
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
                                Color.gray.opacity(0.3),
                                lineWidth: 1
                            )
                        )
                        
                        
                        // MARK: - Notes
                        
                        VStack(
                            alignment: .leading,
                            spacing: 10
                        ) {
                            
                            Text("Notes")
                                .font(
                                    .system(
                                        size: 18,
                                        weight: .bold
                                    )
                                )
                            
                            
                            Text(
                                "No additional notes available."
                            )
                            .font(
                                .system(size: 15)
                            )
                            .foregroundColor(.secondary)
                        }
                        .padding(18)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .background(Color.white)
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 18
                            )
                        )
                    }
                    .padding(20)
                    .padding(.bottom, 30)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


// MARK: - Detail Row

struct DetailRow: View {
    
    let icon: String
    let title: String
    let value: String
    
    
    var body: some View {
        
        HStack(spacing: 14) {
            
            Image(
                systemName: icon
            )
            .font(
                .system(size: 18)
            )
            .foregroundColor(.orange)
            .frame(
                width: 25
            )
            
            
            VStack(
                alignment: .leading,
                spacing: 3
            ) {
                
                Text(title)
                    .font(
                        .system(size: 13)
                    )
                    .foregroundColor(.secondary)
                
                
                Text(value)
                    .font(
                        .system(
                            size: 16,
                            weight: .medium
                        )
                    )
            }
            
            
            Spacer()
        }
    }
}


// MARK: - Preview

#Preview {
    
    NavigationStack {
        
        MaintenanceDetailView(
            icon: "drop.fill",
            title: "Engine Oil",
            vehicle: "Myvi VVA 1234",
            date: "15 May 2025",
            price: "RM190.00",
            type: "Maintenance"
        )
    }
}
