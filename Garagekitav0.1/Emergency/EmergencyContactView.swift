//
//  EmergencyContactView.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 08/08/2026.
//

import SwiftUI

struct EmergencyContactView: View {
    
    // 0 = contact, 1 = workshop
    @State private var selectedSegment = 0
    
    // Senarai dynamic contacts
    @State private var contacts: [ContactItem] = [
        ContactItem(iconName: "cross.case.fill", service: "Insurance", serviceName: "Etika Insurance", contactNum: "1800881000"),
        ContactItem(iconName: "gearshape.fill", service: "Towing service", serviceName: "B auto towing", contactNum: "012-3456789"),
        ContactItem(iconName: "wrench.and.screwdriver.fill", service: "Preferred Workshop", serviceName: "AutoPlus Shah Alam", contactNum: "03-5522 3344"),
        ContactItem(iconName: "person.fill", service: "Family Contact", serviceName: "Dad", contactNum: "012-555 1234")
    ]
    
    let themeYellow = Color(red:1.0, green: 0.67, blue: 0.0)
    let themeBlue = Color(red: 30/255, green: 76/255, blue: 124/255)
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                Color.white
                    .frame(height: 1)
                
                // Header Bar Custom
                ZStack {
                    Text("Emergency")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                    
                    HStack {
                        Spacer()
                        
                        // Pass $contacts guna Binding ke AddContactView
                        if selectedSegment == 0 {
                            NavigationLink(destination: AddContactView(contacts: $contacts)) {
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .frame(height: 65)
                .background(themeYellow)
                
                // Slider Contact & Workshop
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedSegment = 0
                        }
                    }) {
                        Text("Contact")
                            .font(.headline)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(selectedSegment == 0 ? themeBlue : Color.clear)
                            .foregroundStyle(selectedSegment == 0 ? .white : themeBlue)
                            .cornerRadius(20)
                    }
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedSegment = 1
                        }
                    }) {
                        Text("Workshop")
                            .font(.headline)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(selectedSegment == 1 ? themeBlue : Color.clear)
                            .foregroundStyle(selectedSegment == 1 ? .white : themeBlue)
                            .cornerRadius(20)
                    }
                }
                .padding(4)
                .background(Color.white)
                .cornerRadius(25)
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .padding(.horizontal)
                .padding(.vertical, 12)
                
                // Switch Content
                if selectedSegment == 0 {
                    List {
                        
                        ForEach(contacts.indices, id: \.self) { index in
                            
                            ContactCard(
                                iconName: contacts[index].iconName,
                                service: contacts[index].service,
                                serviceName: contacts[index].serviceName,
                                contactNum: contacts[index].contactNum
                            )
                            .listRowInsets(
                                EdgeInsets(
                                    top: 0,
                                    leading: 16,
                                    bottom: 12,
                                    trailing: 16
                                )
                            )
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .swipeActions(edge: .trailing) {
                                
                                Button(role: .destructive) {
                                    
                                    deleteContact(at: index)
                                    
                                } label: {
                                    
                                    Label(
                                        "Delete",
                                        systemImage: "trash"
                                    )
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                } else {
                    WorkshopView()
                }
                
                Spacer(minLength: 0)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .toolbar(.hidden, for: .navigationBar)
        }
    }
    
    
    private func deleteContact(
        at index: Int
    ) {
        
        contacts.remove(
            at: index
        )
    }
}

#Preview {
    EmergencyContactView()
}
