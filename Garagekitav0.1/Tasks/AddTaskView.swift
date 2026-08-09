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
    
    let onAddTask: (TaskItem) -> Void
    
    var body: some View {
        
        
        
        
        NavigationStack {
            //ui kt sini
            
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ZStack {
                        Color(red: 1.0, green: 0.67, blue: 0.0)
                        
                        Text("Save Task")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .bold()
                        
                        
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.left")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .padding(.leading, 20)
                            }
                            Spacer()
                        }
                        
                        
                    }
                    .frame(height: 65)
            //.padding(.top, 30)
            
            
            VStack(alignment: .leading, spacing: 18) {
                        
                
                Text("Vehicle:")
                    .padding(.top, 30)
                    .foregroundStyle(.blue)
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
                    //.padding(.top, 30)
                    .foregroundStyle(.blue)
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
                    //.padding(.top, 30)
                    .foregroundStyle(.blue)
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
                    //.padding(.top, 30)
                    .foregroundStyle(.blue)
                    .bold()
                TextField("km", text: $mileage)
                    .padding(.horizontal, 14)
                    .frame(height: 48)
                    .background(Color.white)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    
                        
                
                        
                        //select status
                Text("Status")
                    .foregroundStyle(.blue)
                    .bold()
                Picker("Status", selection: $status){
                            Text("Pending").tag("Pending")
                            Text("InProgress").tag("InProgress")
                            Text("Completed").tag("Completed")
                            Text("Overdue").tag("Overdue")
                        }
                        .pickerStyle(.menu)
                        .foregroundStyle(.blue)
                        .bold()
                        .padding(.horizontal, 14)
                        .frame(height: 48)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                
                
                        //select icon
                        Text("Icon")
                        .foregroundStyle(.blue)
                        .bold()
                        Picker("Icon", selection: $iconName) {
                            Text("Tire").tag("tire")
                            Text("Oil").tag("drop.fill")
                            Text("Insurance").tag("shield.fill")
                            Text("Roadtax").tag("doc.text.fill")
                            Text("Battery").tag("battery.100")
                        } .pickerStyle(.menu)
                    .       foregroundStyle(.blue)
                            .bold()
                            .padding(.horizontal, 14)
                            .frame(height: 48)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1))
                        
                        
                        Button {
                            
                            let newTask = TaskItem(
                                serviceType: serviceType,
                                vehicleName: vehicleName,
                                daysLeft: 0,
                                dueDate: dueDate,
                                mileage: mileage,
                                iconName: iconName,
                                status: status)
                            
                            onAddTask(newTask)
                            dismiss()
                            
                            
                        } label: {
                            Text("Save Task")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(width: 260, height: 50)
                                .background(Color(red: 1.0, green: 0.67, blue: 0.0))
                            
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .padding(.horizontal, 40)
                            
                        }
                        .padding(.top, 30)
                        
                       
            
                    
            }
            
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background(Color(.systemGray6))
            Spacer()
                }
           
            
        }
       
        
    }
}
}
       

#Preview {
    AddTaskView { _ in }
}
