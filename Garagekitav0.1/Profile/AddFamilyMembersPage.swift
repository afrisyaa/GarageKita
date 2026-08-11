//
//  AddFamilyMemberPage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 09/08/2026.
//

import SwiftUI

struct AddFamilyMembersPage: View {
    
    // MARK: - Dismiss
    
    @Environment(\.dismiss) private var dismiss
    
    
    // MARK: - Form Data
    
    @State private var name = ""
    @State private var relationship = "Child"
    @State private var phone = ""
    @State private var email = ""
    @State private var selectedVehicle = "Myvi VVA 1234"
    
    
    // MARK: - Vehicle List
    
    private let vehicles = [
        "Myvi VVA 1234",
        "Honda City VAB 5678",
        "Proton X70 VGN 9012"
    ]
    
    
    // MARK: - Colors
    
    private let blueColor = Color(
        red: 0.02,
        green: 0.31,
        blue: 0.53
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
                    
                    
                    Text("Add Family Member")
                        .font(
                            .system(
                                size: 20,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    
                    
                    // Balance title
                    Image(systemName: "chevron.left")
                        .font(.system(size: 25))
                        .foregroundColor(.clear)
                }
                .padding(.horizontal, 20)
                .frame(height: 56)
                .background(Color.orange)
                
                
                // MARK: - Scrollable Content
                
                ScrollView(
                    showsIndicators: false
                ) {
                    
                    VStack(spacing: 20) {
                        
                        // MARK: - Profile Icon
                        
                        ZStack {
                            
                            Circle()
                                .fill(
                                    Color(
                                        red: 0.92,
                                        green: 0.95,
                                        blue: 0.98
                                    )
                                )
                                .frame(
                                    width: 120,
                                    height: 120
                                )
                            
                            Image(
                                systemName:
                                    "person.fill"
                            )
                            .font(
                                .system(
                                    size: 50,
                                    weight: .medium
                                )
                            )
                            .foregroundColor(
                                blueColor
                            )
                        }
                        .padding(.top, 25)
                        
                        
                        // MARK: - Page Title
                        
                        Text("Add Family Member")
                            .font(
                                .system(
                                    size: 24,
                                    weight: .bold
                                )
                            )
                            .foregroundColor(
                                blueColor
                            )
                        
                        
                        Text(
                            "Add a family member and manage\ntheir vehicle access."
                        )
                        .font(
                            .system(size: 16)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(
                            Color(
                                red: 0.30,
                                green: 0.33,
                                blue: 0.40
                            )
                        )
                        .lineSpacing(3)
                        .padding(.bottom, 5)
                        
                        
                        // MARK: - Personal Information
                        
                        VStack(spacing: 0) {
                            
                            // Name
                            AddFamilyFormRow(
                                title: "Full Name",
                                icon: "person.fill"
                            ) {
                                TextField(
                                    "Enter full name",
                                    text: $name
                                )
                                .font(.system(size: 16))
                                .foregroundColor(blueColor)
                                .multilineTextAlignment(.trailing)
                            }
                            
                            
                            Divider()
                                .padding(.leading, 20)
                            
                            
                            // Relationship
                            HStack {
                                
                                HStack(spacing: 10) {
                                    
                                    Image(
                                        systemName:
                                            "person.2.fill"
                                    )
                                    .foregroundColor(
                                        blueColor
                                    )
                                    .frame(
                                        width: 25
                                    )
                                    
                                    Text("Relationship")
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            blueColor
                                        )
                                }
                                
                                Spacer()
                                
                                Menu {
                                    
                                    Button("Spouse") {
                                        relationship = "Spouse"
                                    }
                                    
                                    Button("Child") {
                                        relationship = "Child"
                                    }
                                    
                                    Button("Parent") {
                                        relationship = "Parent"
                                    }
                                    
                                    Button("Sibling") {
                                        relationship = "Sibling"
                                    }
                                    
                                    Button("Other") {
                                        relationship = "Other"
                                    }
                                    
                                } label: {
                                    
                                    HStack(spacing: 5) {
                                        
                                        Text(relationship)
                                        
                                        Image(
                                            systemName:
                                                "chevron.down"
                                        )
                                        .font(
                                            .system(size: 11)
                                        )
                                    }
                                    .font(
                                        .system(size: 16)
                                    )
                                    .foregroundColor(
                                        blueColor
                                    )
                                }
                            }
                            .padding(.horizontal, 20)
                            .frame(minHeight: 62)
                            
                            
                            Divider()
                                .padding(.leading, 20)
                            
                            
                            // Phone
                            AddFamilyFormRow(
                                title: "Phone Number",
                                icon: "phone.fill"
                            ) {
                                TextField(
                                    "Enter phone number",
                                    text: $phone
                                )
                                .keyboardType(.phonePad)
                                .font(.system(size: 16))
                                .foregroundColor(blueColor)
                                .multilineTextAlignment(.trailing)
                            }
                            
                            
                            Divider()
                                .padding(.leading, 20)
                            
                            
                            // Email
                            AddFamilyFormRow(
                                title: "Email Address",
                                icon: "envelope.fill"
                            ) {
                                TextField(
                                    "Enter email",
                                    text: $email
                                )
                                .keyboardType(
                                    .emailAddress
                                )
                                .textInputAutocapitalization(
                                    .never
                                )
                                .autocorrectionDisabled()
                                .font(.system(size: 16))
                                .foregroundColor(blueColor)
                                .multilineTextAlignment(.trailing)
                            }
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
                                Color.gray.opacity(0.2),
                                lineWidth: 1
                            )
                        )
                        
                        
                        // MARK: - Vehicle Access
                        
                        VStack(
                            alignment: .leading,
                            spacing: 12
                        ) {
                            
                            Text("VEHICLE ACCESS")
                                .font(
                                    .system(
                                        size: 15,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(
                                    Color.gray
                                )
                            
                            
                            VStack(spacing: 0) {
                                
                                HStack {
                                    
                                    HStack(spacing: 10) {
                                        
                                        Image(
                                            systemName:
                                                "car.fill"
                                        )
                                        .font(
                                            .system(size: 20)
                                        )
                                        .foregroundColor(
                                            blueColor
                                        )
                                        
                                        Text(
                                            "Linked Vehicle"
                                        )
                                        .font(
                                            .system(
                                                size: 15,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            blueColor
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
                                            blueColor
                                        )
                                    }
                                }
                                .padding(.horizontal, 20)
                                .frame(minHeight: 62)
                                
                                
                                Divider()
                                    .padding(.leading, 20)
                                
                                
                                // Access Information
                                HStack(
                                    alignment: .top,
                                    spacing: 10
                                ) {
                                    
                                    Image(
                                        systemName:
                                            "info.circle.fill"
                                    )
                                    .foregroundColor(
                                        blueColor
                                    )
                                    
                                    Text(
                                        "The family member will be able to access the selected vehicle information."
                                    )
                                    .font(
                                        .system(size: 14)
                                    )
                                    .foregroundColor(
                                        Color.gray
                                    )
                                    .fixedSize(
                                        horizontal: false,
                                        vertical: true
                                    )
                                }
                                .padding(20)
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
                                    Color.gray.opacity(0.2),
                                    lineWidth: 1
                                )
                            )
                        }
                        
                        
                        // MARK: - Save Button
                        
                        Button {
                            saveFamilyMember()
                        } label: {
                            
                            Text("Save Family Member")
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
                                    blueColor
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 16
                                    )
                                )
                        }
                        
                        
                        // MARK: - Bottom Space
                        
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
    
    
    // MARK: - Save
    
    private func saveFamilyMember() {
        
        print("Family Member Saved")
        print("Name: \(name)")
        print("Relationship: \(relationship)")
        print("Phone: \(phone)")
        print("Email: \(email)")
        print("Vehicle: \(selectedVehicle)")
        
        dismiss()
    }
}


// MARK: - Form Row

struct AddFamilyFormRow<Content: View>: View {
    
    let title: String
    let icon: String
    let content: Content
    
    
    init(
        title: String,
        icon: String,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    
    var body: some View {
        
        HStack(spacing: 10) {
            
            HStack(spacing: 10) {
                
                Image(systemName: icon)
                    .foregroundColor(
                        Color(
                            red: 0.02,
                            green: 0.31,
                            blue: 0.53
                        )
                    )
                    .frame(width: 25)
                
                Text(title)
                    .font(
                        .system(
                            size: 15,
                            weight: .semibold
                        )
                    )
                    .foregroundColor(
                        Color(
                            red: 0.02,
                            green: 0.31,
                            blue: 0.53
                        )
                    )
            }
            
            Spacer()
            
            content
        }
        .padding(.horizontal, 20)
        .frame(minHeight: 62)
    }
}


// MARK: - Preview

#Preview {
    AddFamilyMembersPage()
}
