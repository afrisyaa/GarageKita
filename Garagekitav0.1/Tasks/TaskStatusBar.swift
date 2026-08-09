//
//  TaskStatusBar.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 06/08/2026.
//

import SwiftUI
import UIKit




struct TaskStatusBar: View {
    
    //anak dia dari pendingtaskview
    @Binding var selectedStatus: String
    
    
    
    //tukar color status bar
    init(selectedStatus: Binding<String>) {
        self._selectedStatus = selectedStatus
        
            //warna bg bila selected
           UISegmentedControl.appearance().selectedSegmentTintColor = .systemBlue
        
        //tulisan bila selected putih
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected )
       
       
        //tak selected hitam
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal )
        
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
        .frame(maxWidth: .infinity)
        .frame(height: 32)
        .padding(.horizontal, 1)
        .padding(.vertical, 8) //jarak task
        //.background(Color.white)
        .frame(height: 50)
        //.scaleEffect(x:1.0, y:1.2) //ubah saiz
        .padding()
        
        
       
        
    }
}

#Preview {
    //binding preview
    TaskStatusBar(selectedStatus: .constant("Pending"))
}
