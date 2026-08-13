//
//  InviteFamilyMemberView.swift
//  Garagekitav0.1
//

import SwiftUI

struct InviteFamilyMemberView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedRelationship = "Child"
    @State private var selectedVehicle =
        VehicleStorage.vehicleNames().first ?? ""
    @State private var vehicles =
        VehicleStorage.vehicleNames()
    
    private let relationships = [
        "Spouse",
        "Child",
        "Parent",
        "Sibling",
        "Other"
    ]
    
    private let themeOrange = Color(red: 1.0, green: 0.67, blue: 0.0)
    private let themeBlue = Color(red: 0.02, green: 0.32, blue: 0.56)
    private let backgroundGrey = Color(red: 0.95, green: 0.95, blue: 0.97)
    
    var body: some View {
        ZStack {
            backgroundGrey
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top navigation
                ZStack {
                    themeOrange
                    
                    Text("Invite Family Member")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.white)
                    
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 25, weight: .medium))
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 65)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 22) {
                        // Hero section
                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(themeOrange.opacity(0.15))
                                    .frame(width: 110, height: 110)
                                
                                Image(systemName: "person.2.fill")
                                    .font(.system(size: 44, weight: .medium))
                                    .foregroundStyle(themeOrange)
                            }
                            
                            Text("Invite Family Member")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(themeBlue)
                                .multilineTextAlignment(.center)
                            
                            Text("Share an invitation link with your family member to connect them to GarageKita.")
                                .font(.system(size: 15))
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 18)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 28)
                        
                        // Family role section
                        VStack(spacing: 0) {
                            HStack(spacing: 14) {
                                CircleIcon(systemName: "person.2.fill", themeOrange: themeOrange)
                                
                                Text("Relationship")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(themeBlue)
                                
                                Spacer()
                                
                                Picker("Relationship", selection: $selectedRelationship) {
                                    ForEach(relationships, id: \.self) { relationship in
                                        Text(relationship).tag(relationship)
                                    }
                                }
                                .pickerStyle(.menu)
                                .tint(themeBlue)
                            }
                            .padding(.horizontal, 18)
                            .frame(height: 70)
                        }
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                        )
                        /*
                        // Vehicle access section
                        VStack(alignment: .leading, spacing: 10) {
                            Text("VEHICLE ACCESS")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.gray)
                            
                            VStack(spacing: 0) {
                                HStack(spacing: 14) {
                                    CircleIcon(systemName: "car.fill", themeOrange: themeOrange)
                                    
                                    Text("Linked Vehicle")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundStyle(themeBlue)
                                    
                                    Spacer()
                                    
                                    Picker("Linked Vehicle", selection: $selectedVehicle) {
                                        ForEach(vehicles, id: \.self) { vehicle in
                                            Text(vehicle).tag(vehicle)
                                        }
                                    }
                                    .pickerStyle(.menu)
                                    .tint(themeBlue)
                                }
                                .padding(.horizontal, 18)
                                .frame(height: 70)
                                
                                Divider()
                                    .padding(.leading, 18)
                                
                                HStack(alignment: .top, spacing: 12) {
                                    Image(systemName: "info.circle.fill")
                                        .foregroundStyle(themeBlue)
                                    
                                    Text("The family member will be able to access the selected vehicle information.")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.gray)
                                }
                                .padding(18)
                            }
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                            )
                        }
                         */
                        
                        // Invitation link section
                        VStack(alignment: .leading, spacing: 14) {
                            Text("Family Invitation Link")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(themeBlue)
                            
                            Text("garagekita.app/invite/F7K9P2")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(themeBlue)
                                .padding(.horizontal, 14)
                                .frame(maxWidth: .infinity, minHeight: 48, alignment: .leading)
                                .background(backgroundGrey)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Button {
                                // UI only: copy action will be added later.
                            } label: {
                                Label("Copy Link", systemImage: "doc.on.doc")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(themeBlue)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 44)
                                    .background(themeBlue.opacity(0.08))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                        .padding(18)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                        )
                        
                        // Primary button
                        Button {
                            // UI only: sharing will be added later.
                        } label: {
                            Label("Share Invitation", systemImage: "square.and.arrow.up")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                                .background(themeOrange)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                        // Secondary button
                        Button {
                            // UI only: link generation will be added later.
                        } label: {
                            Label("Generate New Link", systemImage: "arrow.clockwise")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(themeBlue)
                                .frame(maxWidth: .infinity)
                        }
                        
                        // Security note
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: "lock.fill")
                                .foregroundStyle(themeBlue)
                            
                            Text("This invitation can only be used once and will expire after 7 days.")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        .padding(16)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        
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
    }
    
    private func refreshVehicles() {
        
        vehicles =
            VehicleStorage.vehicleNames()
        
        if !vehicles.contains(selectedVehicle) {
            selectedVehicle =
                vehicles.first ?? ""
        }
    }
}

struct CircleIcon: View {
    
    let systemName: String
    let themeOrange: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(themeOrange.opacity(0.15))
                .frame(width: 42, height: 42)
            
            Image(systemName: systemName)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(themeOrange)
        }
    }
}

#Preview {
    InviteFamilyMemberView()
}
