//
//  AddVehicleView.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 11/08/2026.
//

import SwiftUI
import PhotosUI

struct AddVehicleView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // Binding ke array vehicles kat GaragePage
    @Binding var vehicles: [VehicleItem]
    
    // State untuk Camera & Gallery
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingCamera = false
    
    // Input fields
    @State private var nameInput = ""
    @State private var plateNumberInput = ""
    @State private var mileageInput = ""
    @State private var fuelTypeInput = ""
    @State private var ownerInput = ""
    @State private var engineNumberInput = ""
    @State private var transmissionInput = ""
    
    let themeYellow = Color(red: 242/255, green: 177/255, blue: 61/255)
    let themeBlue = Color(red: 30/255, green: 76/255, blue: 124/255)
    
    var body: some View {
        VStack(spacing: 0) {
            
            Color.white
                .frame(height: 1)
            
            // Header Bar
            ZStack {
                Text("Add Vehicle")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(.white.opacity(0.3), in: Circle())
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .frame(height: 65)
            .background(themeYellow)
            
            ScrollView {
                VStack(spacing: 16) {
                    
                    // 1. Image Preview Box
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white)
                            .frame(width: 220, height: 140)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        
                        if let selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 120)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        } else {
                            VStack(spacing: 8) {
                                Image(systemName: "photo")
                                    .font(.system(size: 40))
                                    .foregroundStyle(themeBlue)
                                
                                Text("No Photo Selected")
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .padding(.top, 16)
                    
                    // 2. Butang Choice: Gallery vs Camera
                    HStack(spacing: 12) {
                        PhotosPicker(selection: $selectedPhoto, matching: .images) {
                            Label("Gallery", systemImage: "photo.on.rectangle")
                                .font(.caption)
                                .bold()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(themeBlue)
                        .onChange(of: selectedPhoto) {
                            loadSelectedPhoto()
                        }
                        
                        Button {
                            isShowingCamera = true
                        } label: {
                            Label("Camera", systemImage: "camera")
                                .font(.caption)
                                .bold()
                        }
                        .buttonStyle(.bordered)
                        .tint(themeBlue)
                    }
                    
                    // 3. Form Inputs
                    VStack(alignment: .leading, spacing: 16) {
                        customInputField(title: "Model Name:", placeholder: "Example: Perodua Kelisa", text: $nameInput)
                        customInputField(title: "Number Plate:", placeholder: "Example: VEB 1234", text: $plateNumberInput)
                        customInputField(title: "Owner Name:", placeholder: "Example: Farisya", text: $ownerInput)
                        customInputField(title: "Engine Number:", placeholder: "Example: MXWA 12345", text: $engineNumberInput)
                        customInputField(title: "Mileage:", placeholder: "Example: 120,000 km", text: $mileageInput)
                        customInputField(title: "Fuel Type:", placeholder: "Example: Petrol", text: $fuelTypeInput)
                        customInputField(title: "Transmission:", placeholder: "Example: Auto / Manual", text: $transmissionInput)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    
                    Spacer().frame(height: 10)
                    
                    // 4. Save Button
                    Button(action: {
                        AddNewVehicle()
                    }) {
                        Text("Save changes")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(themeYellow)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $isShowingCamera) {
            CameraPicker(selectedImage: $selectedImage)
                .ignoresSafeArea()
        }
    }
    
    private func loadSelectedPhoto() {
        Task {
            guard let selectedPhoto else { return }
            do {
                if let imageData = try await selectedPhoto.loadTransferable(type: Data.self) {
                    selectedImage = UIImage(data: imageData)
                }
            } catch {
                print("Unable to load photo: \(error)")
            }
        }
    }
    
    func AddNewVehicle() {
        let newVehicle = VehicleItem(
            imageName: "scooter",
            name: nameInput.isEmpty ? "Perodua Kelisa" : nameInput,
            plateNumber: plateNumberInput.isEmpty ? "VEB 1234" : plateNumberInput,
            mileage: mileageInput.isEmpty ? "0 km" : mileageInput,
            fuelType: fuelTypeInput.isEmpty ? "Petrol" : fuelTypeInput,
            owner: ownerInput.isEmpty ? "User" : ownerInput,
            engineNumber: engineNumberInput.isEmpty ? "N/A" : engineNumberInput,
            transmission: transmissionInput.isEmpty ? "Auto" : transmissionInput
        )
        
        vehicles.append(newVehicle)
        dismiss()
    }
    
    private func customInputField(title: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.headline)
                .bold()
                .foregroundStyle(themeBlue)
            
            TextField(placeholder, text: text)
                .padding(12)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
}

#Preview {
    AddVehicleView(vehicles: .constant([]))
}
