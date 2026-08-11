//
//  ProfilePage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 07/08/2026.
//

import SwiftUI
import PhotosUI

struct ProfilePage: View {
    
    // MARK: - Profile Information
    
    @State private var fullName = "Irfan Khasim"
    @State private var email = "irfankhasim@icloud.com"
    @State private var phoneNumber = "011-2359 1242"
    @State private var password = "12345678"
    
    @State private var dateOfBirth: Date = Calendar.current.date(
        from: DateComponents(
            year: 2004,
            month: 1,
            day: 12
        )
    ) ?? Date()
    
    
    // MARK: - Profile Photo
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var profileImage: UIImage?
    
    
    // MARK: - Edit Popup
    
    @State private var showEditPopup = false
    @State private var editType: ProfileEditType?
    
    @State private var temporaryText = ""
    @State private var temporaryDate = Date()
    
    
    // MARK: - Logout
    
    @State private var showLogoutAlert = false
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Background
            
            Color(.systemGray6)
                .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                // MARK: - Top Bar
                
                HStack {
                    
                    Spacer()
                    
                    Text("Profile")
                        .font(
                            .system(
                                size: 24,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Balance header
                    Image(systemName: "chevron.left")
                        .font(.system(size: 27))
                        .foregroundColor(.clear)
                }
                .padding(.horizontal, 20)
                .frame(height: 56)
                .background(Color.orange)
                
                
                // MARK: - Main Content
                
                ScrollView(
                    showsIndicators: false
                ) {
                    
                    VStack(spacing: 20) {
                        
                        // MARK: - Profile Header
                        
                        VStack(spacing: 10) {
                            
                            // Profile Photo
                            
                            PhotosPicker(
                                selection: $selectedPhoto,
                                matching: .images,
                                photoLibrary: .shared()
                            ) {
                                
                                ZStack(
                                    alignment: .bottomTrailing
                                ) {
                                    
                                    // Profile Image
                                    
                                    if let profileImage = profileImage {
                                        
                                        Image(uiImage: profileImage)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(
                                                width: 120,
                                                height: 120
                                            )
                                            .clipShape(Circle())
                                        
                                    } else {
                                        
                                        Image(
                                            systemName:
                                                "person.circle.fill"
                                        )
                                        .resizable()
                                        .scaledToFit()
                                        .frame(
                                            width: 120,
                                            height: 120
                                        )
                                        .foregroundColor(
                                            ProfileColors.darkBlue
                                        )
                                    }
                                    
                                    
                                    // Edit Photo Button
                                    
                                    Circle()
                                        .fill(Color.white)
                                        .frame(
                                            width: 38,
                                            height: 38
                                        )
                                        .shadow(
                                            color: .black.opacity(0.15),
                                            radius: 3
                                        )
                                        .overlay(
                                            Image(
                                                systemName: "pencil"
                                            )
                                            .font(
                                                .system(
                                                    size: 16,
                                                    weight: .bold
                                                )
                                            )
                                            .foregroundColor(
                                                ProfileColors.darkBlue
                                            )
                                        )
                                }
                            }
                            .buttonStyle(.plain)
                            
                            
                            // Name
                            
                            Text(
                                fullName.isEmpty
                                ? "Your Name"
                                : fullName
                            )
                            .font(
                                .system(
                                    size: 27,
                                    weight: .bold
                                )
                            )
                            .foregroundColor(
                                ProfileColors.darkBlue
                            )
                            
                            
                            // Email
                            
                            Text(email)
                                .font(
                                    .system(size: 16)
                                )
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 25)
                        .background(Color.white)
                        .cornerRadius(25)
                        .shadow(
                            color: .black.opacity(0.08),
                            radius: 5
                        )
                        .padding(.horizontal, 20)
                        
                        
                        // MARK: - Personal Information
                        
                        ProfileSectionTitle(
                            title: "PERSONAL INFORMATION"
                        )
                        
                        
                        // MARK: - Combined Card
                        
                        VStack(spacing: 0) {
                            
                            // MARK: Full Name
                            
                            Button {
                                
                                openTextEditor(
                                    type: .fullName,
                                    value: fullName
                                )
                                
                            } label: {
                                
                                ProfileInformationRow(
                                    icon: "person.fill",
                                    title: "Full Name",
                                    value: fullName
                                )
                            }
                            .buttonStyle(.plain)
                            
                            
                            Divider()
                            
                            
                            // MARK: Email
                            
                            Button {
                                
                                openTextEditor(
                                    type: .email,
                                    value: email
                                )
                                
                            } label: {
                                
                                ProfileInformationRow(
                                    icon: "envelope.fill",
                                    title: "Email Address",
                                    value: email
                                )
                            }
                            .buttonStyle(.plain)
                            
                            
                            Divider()
                            
                            
                            // MARK: Phone Number
                            
                            Button {
                                
                                openTextEditor(
                                    type: .phone,
                                    value: phoneNumber
                                )
                                
                            } label: {
                                
                                ProfileInformationRow(
                                    icon: "phone.fill",
                                    title: "Phone Number",
                                    value: phoneNumber
                                )
                            }
                            .buttonStyle(.plain)
                            
                            
                            Divider()
                            
                            
                            // MARK: Date of Birth
                            
                            Button {
                                
                                openDateEditor()
                                
                            } label: {
                                
                                ProfileInformationRow(
                                    icon: "calendar",
                                    title: "Date of Birth",
                                    value: formattedDate(
                                        dateOfBirth
                                    )
                                )
                            }
                            .buttonStyle(.plain)
                            
                            
                            Divider()
                            
                            
                            // MARK: Password
                            
                            Button {
                                
                                openTextEditor(
                                    type: .password,
                                    value: password
                                )
                                
                            } label: {
                                
                                ProfileInformationRow(
                                    icon: "lock.fill",
                                    title: "Password",
                                    value: "••••••••"
                                )
                            }
                            .buttonStyle(.plain)
                            
                            
                            // MARK: My Vehicles
                            
                            Divider()
                            
                            NavigationLink {
                                
                                // MyVehiclesPage()
                                
                            } label: {
                                
                                ProfileActionRow(
                                    icon: "car.fill",
                                    title: "My Vehicles",
                                    subtitle:
                                        "View and manage your vehicles"
                                )
                            }
                            .buttonStyle(.plain)
                            
                            
                            // MARK: Family Members
                            
                            Divider()
                            
                            NavigationLink {
                                
                                FamilyMembersPage()
                                
                            } label: {
                                
                                ProfileActionRow(
                                    icon: "person.3.fill",
                                    title: "Family Members",
                                    subtitle:
                                        "Manage family members using the app"
                                )
                            }
                            .buttonStyle(.plain)
                        }
                        .background(Color.white)
                        .cornerRadius(22)
                        .shadow(
                            color: .black.opacity(0.05),
                            radius: 4
                        )
                        .padding(.horizontal, 20)
                        
                        
                        // MARK: - Logout
                        
                        Button {
                            
                            showLogoutAlert = true
                            
                        } label: {
                            
                            HStack(spacing: 16) {
                                
                                Circle()
                                    .fill(
                                        Color.red.opacity(0.12)
                                    )
                                    .frame(
                                        width: 48,
                                        height: 48
                                    )
                                    .overlay(
                                        Image(
                                            systemName:
                                                "rectangle.portrait.and.arrow.right"
                                        )
                                        .font(
                                            .system(
                                                size: 20,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(.red)
                                    )
                                
                                
                                Text("Log Out")
                                    .font(
                                        .system(
                                            size: 18,
                                            weight: .semibold
                                        )
                                    )
                                    .foregroundColor(.red)
                                
                                Spacer()
                                
                                Image(
                                    systemName: "chevron.right"
                                )
                                .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(22)
                        .shadow(
                            color: .black.opacity(0.05),
                            radius: 4
                        )
                        .padding(.horizontal, 20)
                        
                        
                        // MARK: - Bottom Space
                        
                        Spacer()
                            .frame(height: 100)
                    }
                    .padding(.top, 20)
                }
            }
        }
        .navigationBarHidden(true)
        
        
        // MARK: - Photo Picker
        
        .onChange(
            of: selectedPhoto
        ) { _, newItem in
            
            guard let newItem = newItem else {
                return
            }
            
            Task {
                
                if let data = try? await newItem.loadTransferable(
                    type: Data.self
                ) {
                    
                    if let image = UIImage(
                        data: data
                    ) {
                        profileImage = image
                    }
                }
            }
        }
        
        
        // MARK: - Edit Popup
        
        .overlay {
            
            if showEditPopup {
                
                ProfileEditPopup(
                    editType: editType,
                    temporaryText: $temporaryText,
                    temporaryDate: $temporaryDate,
                    onCancel: {
                        showEditPopup = false
                    },
                    onSave: {
                        saveEdit()
                    }
                )
                .transition(
                    .opacity.combined(
                        with: .scale(scale: 0.95)
                    )
                )
                .zIndex(10)
            }
        }
        .animation(
            .easeInOut(duration: 0.2),
            value: showEditPopup
        )
        
        
        // MARK: - Logout Alert
        
        .alert(
            "Log Out",
            isPresented: $showLogoutAlert
        ) {
            
            Button(
                "Cancel",
                role: .cancel
            ) {}
            
            Button(
                "Log Out",
                role: .destructive
            ) {
                logout()
            }
            
        } message: {
            
            Text(
                "Are you sure you want to log out?"
            )
        }
    }
    
    
    // MARK: - Open Text Editor
    
    private func openTextEditor(
        type: ProfileEditType,
        value: String
    ) {
        
        editType = type
        temporaryText = value
        showEditPopup = true
    }
    
    
    // MARK: - Open Date Editor
    
    private func openDateEditor() {
        
        editType = .dateOfBirth
        temporaryDate = dateOfBirth
        showEditPopup = true
    }
    
    
    // MARK: - Save Edit
    
    private func saveEdit() {
        
        guard let editType = editType else {
            return
        }
        
        switch editType {
            
        case .fullName:
            fullName = temporaryText
            
        case .email:
            email = temporaryText
            
        case .phone:
            phoneNumber = temporaryText
            
        case .password:
            password = temporaryText
            
        case .dateOfBirth:
            dateOfBirth = temporaryDate
        }
        
        showEditPopup = false
    }
    
    
    // MARK: - Format Date
    
    private func formattedDate(
        _ date: Date
    ) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        
        return formatter.string(
            from: date
        )
    }
    
    
    // MARK: - Logout
    
    private func logout() {
        
        print("User logged out")
    }
}


// MARK: - Profile Edit Type

enum ProfileEditType {
    
    case fullName
    case email
    case phone
    case dateOfBirth
    case password
    
    
    var title: String {
        
        switch self {
            
        case .fullName:
            return "Edit Full Name"
            
        case .email:
            return "Edit Email Address"
            
        case .phone:
            return "Edit Phone Number"
            
        case .dateOfBirth:
            return "Edit Date of Birth"
            
        case .password:
            return "Edit Password"
        }
    }
}


// MARK: - Profile Edit Popup

struct ProfileEditPopup: View {
    
    let editType: ProfileEditType?
    
    @Binding var temporaryText: String
    @Binding var temporaryDate: Date
    
    let onCancel: () -> Void
    let onSave: () -> Void
    
    @FocusState private var textFieldFocused: Bool
    
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Dim Background
            
            Color.black
                .opacity(0.45)
                .ignoresSafeArea()
                .onTapGesture {
                    onCancel()
                }
            
            
            // MARK: - Popup
            
            VStack(spacing: 0) {
                
                // MARK: Header
                
                HStack {
                    
                    Button {
                        onCancel()
                    } label: {
                        
                        Image(
                            systemName: "xmark"
                        )
                        .font(
                            .system(
                                size: 17,
                                weight: .semibold
                            )
                        )
                        .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Text(
                        editType?.title
                        ?? "Edit Profile"
                    )
                    .font(
                        .system(
                            size: 20,
                            weight: .bold
                        )
                    )
                    
                    Spacer()
                    
                    Image(
                        systemName: "xmark"
                    )
                    .font(.system(size: 17))
                    .foregroundColor(.clear)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
                
                
                Divider()
                
                
                // MARK: Form
                
                VStack(
                    alignment: .leading,
                    spacing: 12
                ) {
                    
                    if let editType = editType {
                        
                        Text(
                            fieldTitle(
                                for: editType
                            )
                        )
                        .font(
                            .system(
                                size: 14,
                                weight: .semibold
                            )
                        )
                        .foregroundColor(.primary)
                        
                        
                        switch editType {
                            
                        case .fullName:
                            
                            TextField(
                                "Full Name",
                                text: $temporaryText
                            )
                            .textFieldStyle(
                                .roundedBorder
                            )
                            .font(
                                .system(size: 16)
                            )
                            .focused(
                                $textFieldFocused
                            )
                            
                            
                        case .email:
                            
                            TextField(
                                "Email Address",
                                text: $temporaryText
                            )
                            .keyboardType(
                                .emailAddress
                            )
                            .textInputAutocapitalization(
                                .never
                            )
                            .autocorrectionDisabled()
                            .textFieldStyle(
                                .roundedBorder
                            )
                            .font(
                                .system(size: 16)
                            )
                            .focused(
                                $textFieldFocused
                            )
                            
                            
                        case .phone:
                            
                            TextField(
                                "Phone Number",
                                text: $temporaryText
                            )
                            .keyboardType(
                                .phonePad
                            )
                            .textFieldStyle(
                                .roundedBorder
                            )
                            .font(
                                .system(size: 16)
                            )
                            .focused(
                                $textFieldFocused
                            )
                            
                            
                        case .dateOfBirth:
                            
                            DatePicker(
                                "",
                                selection: $temporaryDate,
                                displayedComponents: .date
                            )
                            .datePickerStyle(.wheel)
                            .frame(
                                maxWidth: .infinity
                            )
                            
                            
                        case .password:
                            
                            SecureField(
                                "New Password",
                                text: $temporaryText
                            )
                            .textFieldStyle(
                                .roundedBorder
                            )
                            .font(
                                .system(size: 16)
                            )
                            .focused(
                                $textFieldFocused
                            )
                        }
                    }
                }
                .padding(20)
                
                
                // MARK: Buttons
                
                HStack(spacing: 12) {
                    
                    Button {
                        onCancel()
                    } label: {
                        
                        Text("Cancel")
                            .font(
                                .system(
                                    size: 16,
                                    weight: .semibold
                                )
                            )
                            .foregroundColor(
                                ProfileColors.darkBlue
                            )
                            .frame(
                                maxWidth: .infinity
                            )
                            .frame(height: 48)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(
                                    cornerRadius: 10
                                )
                                .stroke(
                                    Color.gray.opacity(0.35),
                                    lineWidth: 1
                                )
                            )
                            .cornerRadius(10)
                    }
                    
                    
                    Button {
                        onSave()
                    } label: {
                        
                        Text("Save")
                            .font(
                                .system(
                                    size: 16,
                                    weight: .bold
                                )
                            )
                            .foregroundColor(.white)
                            .frame(
                                maxWidth: .infinity
                            )
                            .frame(height: 48)
                            .background(
                                ProfileColors.darkBlue
                            )
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            .background(Color.white)
            .cornerRadius(25)
            .padding(.horizontal, 25)
            .shadow(
                color: .black.opacity(0.25),
                radius: 20
            )
            .onAppear {
                
                if editType != .dateOfBirth {
                    
                    DispatchQueue.main.asyncAfter(
                        deadline: .now() + 0.3
                    ) {
                        textFieldFocused = true
                    }
                }
            }
        }
    }
    
    
    // MARK: - Field Title
    
    private func fieldTitle(
        for type: ProfileEditType
    ) -> String {
        
        switch type {
            
        case .fullName:
            return "Full Name"
            
        case .email:
            return "Email Address"
            
        case .phone:
            return "Phone Number"
            
        case .dateOfBirth:
            return "Date of Birth"
            
        case .password:
            return "New Password"
        }
    }
}


// MARK: - Profile Section Title

struct ProfileSectionTitle: View {
    
    let title: String
    
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(
                    .system(
                        size: 16,
                        weight: .bold
                    )
                )
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding(.horizontal, 25)
    }
}


// MARK: - Profile Information Row

struct ProfileInformationRow: View {
    
    let icon: String
    let title: String
    let value: String
    
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            // Icon
            
            Circle()
                .fill(
                    ProfileColors.darkBlue.opacity(0.10)
                )
                .frame(
                    width: 44,
                    height: 44
                )
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 18))
                        .foregroundColor(
                            ProfileColors.darkBlue
                        )
                )
            
            
            // Title
            
            Text(title)
                .font(
                    .system(
                        size: 16,
                        weight: .semibold
                    )
                )
                .foregroundColor(.primary)
            
            
            Spacer()
            
            
            // Value
            
            Text(value)
                .font(
                    .system(size: 14)
                )
                .foregroundColor(
                    ProfileColors.darkBlue
                )
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            
            
            // Arrow
            
            Image(
                systemName: "chevron.right"
            )
            .font(
                .system(
                    size: 13,
                    weight: .medium
                )
            )
            .foregroundColor(.gray)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 11)
        .contentShape(Rectangle())
    }
}


// MARK: - Profile Action Row

struct ProfileActionRow: View {
    
    let icon: String
    let title: String
    let subtitle: String
    
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            // Icon
            
            Circle()
                .fill(
                    ProfileColors.darkBlue.opacity(0.10)
                )
                .frame(
                    width: 48,
                    height: 48
                )
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 19))
                        .foregroundColor(
                            ProfileColors.darkBlue
                        )
                )
            
            
            // Text
            
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                
                Text(title)
                    .font(
                        .system(
                            size: 17,
                            weight: .semibold
                        )
                    )
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(
                        .system(size: 14)
                    )
                    .foregroundColor(.gray)
                    .multilineTextAlignment(
                        .leading
                    )
            }
            
            
            Spacer()
            
            
            // Arrow
            
            Image(
                systemName: "chevron.right"
            )
            .font(
                .system(
                    size: 15,
                    weight: .medium
                )
            )
            .foregroundColor(.gray)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
}


// MARK: - Profile Navigation Item

struct ProfileNavigationItem: View {
    
    let icon: String
    let title: String
    let isSelected: Bool
    
    
    var body: some View {
        
        Button {
            // Connect navigation here later
        } label: {
            
            VStack(spacing: 5) {
                
                Image(systemName: icon)
                    .font(
                        .system(
                            size: 23,
                            weight: .medium
                        )
                    )
                    .foregroundColor(
                        isSelected
                        ? ProfileColors.darkBlue
                        : .black
                    )
                
                Text(title)
                    .font(.system(size: 11))
                    .foregroundColor(
                        isSelected
                        ? ProfileColors.darkBlue
                        : .black
                    )
            }
        }
        .buttonStyle(.plain)
    }
}


// MARK: - Colors

struct ProfileColors {
    
    static let darkBlue = Color(
        red: 0.05,
        green: 0.30,
        blue: 0.50
    )
}


// MARK: - Preview

#Preview {
    NavigationStack {
        ProfilePage()
    }
}
