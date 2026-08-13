//
//  FamilyMembersPage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 09/08/2026.
//

import SwiftUI

struct FamilyMembersPage: View {
    
    // MARK: - Dismiss
    
    @Environment(\.dismiss) private var dismiss
    
    
    // MARK: - State
    
    @State private var showAddMember = false
    @State private var showInviteMember = false
    
    
    // MARK: - Colors
    
    private let blueColor = Color(
        red: 0.02,
        green: 0.31,
        blue: 0.53
    )
    
    private let orangeColor = Color(
        red: 1.0,
        green: 0.67,
        blue: 0.0
    )
    
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Background
            
            Color(
                red: 0.96,
                green: 0.96,
                blue: 0.98
            )
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                // MARK: - Top Bar
                
                Color.white
                    .frame(height: 1)
                
                HStack {
                    
                    // Back Button
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(
                                .system(
                                    size: 25,
                                    weight: .medium
                                )
                            )
                            .foregroundColor(.white)
                    }
                    
                    
                    Spacer()
                    
                    
                    // Title
                    Text("Family Members")
                        .font(
                            .system(
                                size: 22,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    
                    
                    // Add Button
                    Button {
                        //showAddMember = true
                        showInviteMember = true
                    } label: {
                        Image(systemName: "square.and.arrow.up")
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
                .frame(height: 65)
                .background(Color(red:1.0, green: 0.67, blue: 0.0))
                
                
                // MARK: - Scrollable Content
                
                ScrollView(
                    showsIndicators: false
                ) {
                    
                    VStack(spacing: 18) {
                        
                        // MARK: - Header Icon
                        
                        ZStack {
                            
                            Circle()
                                .fill(
                                    orangeColor.opacity(0.15)
                                )
                                .frame(
                                    width: 120,
                                    height: 120
                                )
                            
                            Image(
                                systemName:
                                    "person.3.fill"
                            )
                            .font(
                                .system(
                                    size: 48,
                                    weight: .medium
                                )
                            )
                            .foregroundColor(
                                orangeColor
                            )
                        }
                        .padding(.top, 22)
                        
                        
                        // MARK: - Page Title
                        
                        Text("Family Members")
                            .font(
                                .system(
                                    size: 25,
                                    weight: .bold
                                )
                            )
                            .foregroundColor(
                                blueColor
                            )
                        
                        
                        Text(
                            "Manage your family members\nand their vehicle access."
                        )
                        .font(
                            .system(size: 17)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(
                            Color(
                                red: 0.30,
                                green: 0.33,
                                blue: 0.40
                            )
                        )
                        .lineSpacing(4)
                        .padding(.bottom, 10)
                        
                        
                        // MARK: - Siti Aisyah
                        
                        FamilyMemberCard(
                            name: "Ariena",
                            role: "Daughter",
                            phone: "012-345 6789",
                            email: "Ariena@example.com",
                            vehicles: [
                                vehicleName(at: 1)
                            ],
                            blueColor: blueColor,
                            orangeColor: orangeColor
                        )
                        
                        
                        // MARK: - Ahmad Danish
                        
                        FamilyMemberCard(
                            name: "Norshahid",
                            role: "Child",
                            phone: "013-987 6543",
                            email: "Norshahid@example.com",
                            vehicles: [
                                vehicleName(at: 2)
                            ],
                            blueColor: blueColor,
                            orangeColor: orangeColor
                        )
                        
                        
                        // MARK: - Nur Iman
                        
                        FamilyMemberCard(
                            name: "Farisya",
                            role: "Daughter",
                            phone: "017-111 2233",
                            email: "FarisyaImut@example.com",
                            vehicles: [
                                vehicleName(at: 0)
                            ],
                            blueColor: blueColor,
                            orangeColor: orangeColor
                        )
                        
                        
                        // Bottom spacing
                        Spacer()
                            .frame(height: 30)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        
        // MARK: - Add Family Member
        
        .sheet(isPresented: $showAddMember) {
            AddFamilyMembersPage()
        }
        .sheet(isPresented: $showInviteMember) {
            InviteFamilyMemberView()
        }
    }
    
    
    private func vehicleName(
        at index: Int
    ) -> String {
        
        let vehicles =
            VehicleStorage.vehicleNames()
        
        guard vehicles.indices.contains(index) else {
            return vehicles.first ?? "No Vehicle"
        }
        
        return vehicles[index]
    }
}


// MARK: - Family Member Card

struct FamilyMemberCard: View {
    
    let name: String
    let role: String
    let phone: String
    let email: String
    let vehicles: [String]
    let blueColor: Color
    let orangeColor: Color
    
    
    var body: some View {
        
        Button {
            print("Selected family member: \(name)")
        } label: {
            
            VStack(spacing: 0) {
                
                // MARK: Member Information
                
                HStack(
                    alignment: .top,
                    spacing: 15
                ) {
                    
                    // Profile Icon
                    ZStack {
                        
                        Circle()
                            .fill(
                                orangeColor.opacity(0.15)
                            )
                            .frame(
                                width: 82,
                                height: 82
                            )
                        
                        Image(
                            systemName:
                                "person.fill"
                        )
                        .font(
                            .system(
                                size: 35,
                                weight: .medium
                            )
                        )
                        .foregroundColor(
                            orangeColor
                        )
                    }
                    
                    
                    // Member Details
                    VStack(
                        alignment: .leading,
                        spacing: 5
                    ) {
                        
                        HStack {
                            
                            Text(name)
                                .font(
                                    .system(
                                        size: 19,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(
                                    blueColor
                                )
                            
                            Spacer()
                            
                            Image(
                                systemName:
                                    "chevron.right"
                            )
                            .font(
                                .system(
                                    size: 17,
                                    weight: .medium
                                )
                            )
                            .foregroundColor(
                                Color.gray
                            )
                        }
                        
                        
                        // Role Badge
                        Text(role)
                            .font(
                                .system(
                                    size: 15,
                                    weight: .medium
                                )
                            )
                            .foregroundColor(
                                blueColor
                            )
                            .padding(
                                .horizontal,
                                12
                            )
                            .padding(
                                .vertical,
                                4
                            )
                            .background(
                                Color(
                                    red: 0.90,
                                    green: 0.95,
                                    blue: 1.0
                                )
                            )
                            .clipShape(
                                Capsule()
                            )
                        
                        
                        // Phone
                        HStack(spacing: 8) {
                            
                            Image(
                                systemName:
                                    "phone.fill"
                            )
                            .font(
                                .system(size: 13)
                            )
                            .foregroundColor(
                                Color.gray
                            )
                            
                            Text(phone)
                                .font(
                                    .system(size: 15)
                                )
                                .foregroundColor(
                                    Color.gray
                                )
                        }
                        
                        
                        // Email
                        HStack(spacing: 8) {
                            
                            Image(
                                systemName:
                                    "envelope.fill"
                            )
                            .font(
                                .system(size: 13)
                            )
                            .foregroundColor(
                                Color.gray
                            )
                            
                            Text(email)
                                .font(
                                    .system(size: 15)
                                )
                                .foregroundColor(
                                    Color.gray
                                )
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                        }
                    }
                }
                
                
                // MARK: Divider
                
                Divider()
                    .padding(.vertical, 13)
                
                
                // MARK: Linked Vehicles
                
                VStack(
                    alignment: .leading,
                    spacing: 6
                ) {
                    
                    Text("Linked Vehicles")
                        .font(
                            .system(
                                size: 15,
                                weight: .medium
                            )
                        )
                        .foregroundColor(
                            Color(
                                red: 0.30,
                                green: 0.33,
                                blue: 0.40
                            )
                        )
                    
                    
                    HStack(
                        alignment: .top,
                        spacing: 10
                    ) {
                        
                        Image(
                            systemName:
                                "car.fill"
                        )
                        .font(
                            .system(size: 17)
                        )
                        .foregroundColor(
                            orangeColor
                        )
                        
                        
                        Text(
                            vehicles.joined(
                                separator: ", "
                            )
                        )
                        .font(
                            .system(size: 15)
                        )
                        .foregroundColor(
                            Color(
                                red: 0.15,
                                green: 0.20,
                                blue: 0.30
                            )
                        )
                        .multilineTextAlignment(
                            .leading
                        )
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
            }
            .padding(18)
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
                    Color.gray.opacity(0.15),
                    lineWidth: 1
                )
            )
            .shadow(
                color: .black.opacity(0.05),
                radius: 8,
                x: 0,
                y: 3
            )
        }
        .buttonStyle(.plain)
    }
}


// MARK: - Preview

#Preview {
    FamilyMembersPage()
}
