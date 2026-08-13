//
//  AddTaskView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 09/08/2026.
//

import SwiftUI

struct AddTaskView: View {
    
    //disable
    @Environment(\.dismiss) private var dismiss
    
    @State private var vehicleName = ""
    @State private var serviceType = ""
    @State private var dueDate = ""
    @State private var mileage = ""
    @State private var iconName = "tire"
    @State private var status = "Pending"
    @State private var showingIconPicker = false
    
    let themeYellow = Color(red: 1.0, green: 0.67, blue: 0.0)
    let themeBlue = Color(red: 0.02, green: 0.32, blue: 0.56)
    
    let onAddTask: (TaskItem) -> Void
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Color.white
                        .frame(height: 1)
                    
                    ZStack {
                        themeYellow
                        
                        Text("Save Task")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .bold()
                            .padding(.top, 16)
                        
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 20)
                                    .padding(.top, 16)
                            }
                            
                            Spacer()
                        }
                    }
                    .frame(height: 75)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 18) {
                            VStack(spacing: 8) {
                                Button {
                                    showingIconPicker.toggle()
                                } label: {
                                    ZStack {
                                        Circle()
                                            .fill(themeYellow.opacity(0.15))
                                            .frame(width: 90, height: 90)
                                        
                                        Image(systemName: iconName)
                                            .font(.system(size: 36))
                                            .foregroundStyle(themeYellow)
                                        
                                        Circle()
                                            .fill(themeBlue)
                                            .frame(width: 28, height: 28)
                                            .overlay(
                                                Image(systemName: "pencil")
                                                    .font(.caption2)
                                                    .bold()
                                                    .foregroundStyle(.white)
                                            )
                                            .offset(x: 29, y: 29)
                                    }
                                }
                                
                                Text("Tap to change icon")
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(.gray)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 28)
                            .padding(.bottom, 10)
                            
                            Text("Vehicle:")
                                .foregroundStyle(themeBlue)
                                .bold()
                            
                            TextField("Choose you vechicle", text: $vehicleName)
                                .padding(.horizontal, 14)
                                .frame(height: 48)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            Text("Type Service:")
                                .foregroundStyle(themeBlue)
                                .bold()
                            
                            TextField("service", text: $serviceType)
                                .padding(.horizontal, 14)
                                .frame(height: 48)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            Text("Valid until:")
                                .foregroundStyle(themeBlue)
                                .bold()
                            
                            TextField("Date", text: $dueDate)
                                .padding(.horizontal, 14)
                                .frame(height: 48)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            Text("Mileage")
                                .foregroundStyle(themeBlue)
                                .bold()
                            
                            TextField("km", text: $mileage)
                                .padding(.horizontal, 14)
                                .frame(height: 48)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                            
                            Text("Status")
                                .foregroundStyle(themeBlue)
                                .bold()
                            
                            Picker("Status", selection: $status) {
                                Text("Pending").tag("Pending")
                                Text("InProgress").tag("InProgress")
                                Text("Completed").tag("Completed")
                                Text("Overdue").tag("Overdue")
                            }
                            .pickerStyle(.menu)
                            .foregroundStyle(themeBlue)
                            .bold()
                            .padding(.horizontal, 14)
                            .frame(height: 48)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            
                            Button {
                                let newTask = TaskItem(
                                    serviceType: serviceType,
                                    vehicleName: vehicleName,
                                    daysLeft: 0,
                                    dueDate: dueDate,
                                    mileage: mileage,
                                    iconName: iconName,
                                    status: status
                                )
                                
                                onAddTask(newTask)
                                dismiss()
                            } label: {
                                Text("Save Task")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                    .frame(width: 260, height: 50)
                                    .background(themeYellow)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding(.horizontal, 40)
                            }
                            .padding(.top, 30)
                            .padding(.bottom, 40)
                        }
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                    }
                    .background(Color(.systemGray6))
                    
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showingIconPicker) {
            TaskIconPickerView(selectedIcon: $iconName)
        }
    }
}

struct TaskIconPickerView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedIcon: String
    
    let icons = [
        "tire",
        "drop.fill",
        "shield.fill",
        "doc.text.fill",
        "battery.100"
    ]
    
    let themeYellow = Color(red: 1.0, green: 0.67, blue: 0.0)
    
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Color.white
                .frame(height: 1)
            
            ZStack {
                Text("Select Icon")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                HStack {
                    Spacer()
                    
                    Button("Done") {
                        dismiss()
                    }
                    .bold()
                    .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .frame(height: 65)
            .background(themeYellow)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(icons, id: \.self) { icon in
                        ZStack {
                            Circle()
                                .fill(themeYellow.opacity(selectedIcon == icon ? 0.3 : 0.15))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Circle()
                                        .stroke(selectedIcon == icon ? themeYellow : Color.clear, lineWidth: 2)
                                )
                            
                            Image(systemName: icon)
                                .font(.title2)
                                .foregroundStyle(themeYellow)
                        }
                        .onTapGesture {
                            selectedIcon = icon
                            dismiss()
                        }
                    }
                }
                .padding(20)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    AddTaskView { _ in }
}
