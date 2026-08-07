//
//  TaskStatusBar.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 06/08/2026.
//

import SwiftUI
import UIKit




struct TaskStatusBar: View {
    
    
    //navbar atas
    @State private var selectedStatus = "Pending"
    
    //tukar color status bar
    init() {
           UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
       }
    
    var body: some View {
        //status bar
        Picker("Task Status", selection: $selectedStatus){
            
                        Text("Pending")
                            .tag("Pending")
            
                        Text("InProgress")
                            .tag("InProgress")

                        Text("Completed")
                            .tag("Completed")

                        Text("Overdue")
                            .tag("Overdue")
            
            
            
            
        }
       
        .pickerStyle(.segmented)
        .tint(.blue)
        .padding()
       
        
    }
}

#Preview {
    PendingTaskView()
}
