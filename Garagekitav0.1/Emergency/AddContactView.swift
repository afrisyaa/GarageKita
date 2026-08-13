//
//  AddContactView.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 09/08/2026.
//

import SwiftUI

struct AddContactView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // Binding to emergency contacts array
    @Binding var contacts: [ContactItem]
    
    @State private var selectedIcon = "phone.fill"
    @State private var showingIconPicker = false
    
    @State private var nameInput = ""
    @State private var serviceInput = ""
    @State private var contactInput = ""
    
    let themeYellow = Color(red:1.0, green: 0.67, blue: 0.0)
    let themeBlue = Color(red: 0.02, green: 0.32, blue: 0.56)
    
    var body: some View {
        VStack(spacing: 0) {
            
            Color.white
                .frame(height: 1)
            
            // Header Bar
            ZStack {
                Text("Add Emergency Contact")
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
            
            // Form Content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Avatar Icon Selection (Tema Warna Yellow + Blue Badge)
                    VStack(spacing: 8) {
                        Button(action: {
                            showingIconPicker.toggle()
                        }) {
                            ZStack {
                                // Circle Background Warna Yellow Soft (0.15 opacity)
                                Circle()
                                    .fill(themeYellow.opacity(0.15))
                                    .frame(width: 110, height: 110)
                                
                                // Icon SF Symbol Warna Yellow Pekat
                                Image(systemName: selectedIcon)
                                    .font(.system(size: 45))
                                    .foregroundStyle(themeYellow)
                                
                                // Lencana Edit Kecil Warna Biru di bucu bawah
                                Circle()
                                    .fill(themeBlue)
                                    .frame(width: 32, height: 32)
                                    .overlay(
                                        Image(systemName: "pencil")
                                            .font(.caption)
                                            .bold()
                                            .foregroundStyle(.white)
                                    )
                                    .offset(x: 35, y: 35)
                            }
                        }
                        
                        Text("Tap to change icon")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity) // Center-kan avatar kat tengah skrin
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    
                    // Name Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Name:")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(themeBlue)
                        
                        TextField("Example: Bengkel Palica", text: $nameInput)
                            .padding()
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray.opacity(0.3)))
                    }
                    
                    // Service Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Service:")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(themeBlue)
                        
                        TextField("Example: Workshop", text: $serviceInput)
                            .padding()
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray.opacity(0.3)))
                    }
                    
                    // Contact Number Field
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Contact Number:")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(themeBlue)
                        
                        TextField("Example: 0123456789", text: $contactInput)
                            .keyboardType(.phonePad)
                            .padding()
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray.opacity(0.3)))
                    }
                    
                    Spacer().frame(height: 10)
                    
                    // Save Button
                    Button(action: {
                        saveContact()
                    }) {
                        Text("Save Emergency Contact")
                            .font(.headline)
                            .bold()
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(themeYellow)
                            .cornerRadius(12)
                    }
                }
                .padding(20)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $showingIconPicker) {
            IconPickerView(selectedIcon: $selectedIcon)
        }
    }
    
    // Save contact function using the selected SF Symbol
    func saveContact() {
        let newContact = ContactItem(
            iconName: selectedIcon,
            service: serviceInput.isEmpty ? "General Service" : serviceInput,
            serviceName: nameInput.isEmpty ? "Emergency Contact" : nameInput,
            contactNum: contactInput.isEmpty ? "012-000 0000" : contactInput
        )
        
        contacts.append(newContact)
        dismiss()
    }
}

#Preview {
    AddContactView(contacts: .constant([]))
}
