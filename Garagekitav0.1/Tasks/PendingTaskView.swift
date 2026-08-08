//
//  PendingTaskView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 06/08/2026.
//

import SwiftUI




struct PendingTaskView: View {
    
   
    
    
    var body: some View {
        
        //
        
       
        //panggil parameter
        VStack {
            
          
            
            //PendingTaskView()
            
            TaskChecklistView(
                serviceType: "Engine Oil Service",
                vehicleName: "Myvi WEB 232",
                daysLeft: 5,
                dueDate: "15 Aug 2026"
            )
            
            TaskChecklistView(
                serviceType: "Engine Oil Service",
                vehicleName: "Myvi WEB 232",
                daysLeft: 5,
                dueDate: "20 Sept 2026"
            )
            
            
        }

        Spacer()
    }
}

#Preview {
    PendingTaskView()
}
