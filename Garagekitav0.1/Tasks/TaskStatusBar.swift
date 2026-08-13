//
//  TaskStatusBar.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 06/08/2026.
//

import SwiftUI
    struct TaskStatusBar: View {
    
    //anak dia dari pendingtaskview
    @Binding var selectedStatus: String
    private let taskStatuses = ["Pending", "InProgress", "Completed", "Overdue"]
    private let themeBlue = Color(red: 0.02, green: 0.32, blue: 0.56)
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(taskStatuses, id: \.self) { status in
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedStatus = status
                    }
                }) {
                    Text(status)
                        .font(.caption2)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(selectedStatus == status ? themeBlue : Color.clear)
                        .foregroundStyle(selectedStatus == status ? .white : themeBlue)
                        .cornerRadius(20)
                }
            }
        }
        .padding(4)
        .background(Color.white)
        .cornerRadius(25)
        .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.gray.opacity(0.3), lineWidth: 1))
        .padding(.horizontal)
        .padding(.vertical, 12)
        
        
       
        
    }
}

#Preview {
    //binding preview
    TaskStatusBar(selectedStatus: .constant("Pending"))
}
