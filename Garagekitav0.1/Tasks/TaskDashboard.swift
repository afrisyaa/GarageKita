//
//  TaskDashboard.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 08/08/2026.
//

import SwiftUI



struct TaskDashboard: View {
    
    
    @Environment(\.dismiss) private var dismiss
    
    //navbar atas
    @State private var selectedStatus = "Pending"
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Bar kuning atas
            ZStack {
                Color(red: 1.0, green: 0.67, blue: 0.0)
                
                Text("Tasks")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .bold()
                
                //logo
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
                
                //addtasknavigation
                
            
            //hide button back
            .navigationBarBackButtonHidden(true)
                
                
                
            }
            .frame(height: 65)
            Spacer()
            
            //status bar
            VStack {
                TaskStatusBar(selectedStatus: $selectedStatus)
                
                switch selectedStatus {
                case "Pending":
                    PendingTaskView()
                case "InProgress":
                    InProgressView()
                case "Completed":
                    CompletedView()
                case "Overdue":
                    OverdueView()
                default:
                    PendingTaskView()
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGray6))
        }
    }
        
}

#Preview {
    TaskDashboard()
}
