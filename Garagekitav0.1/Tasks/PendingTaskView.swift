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
            
            TaskStatusBar()
            //PendingTaskView()
            
            TaskChecklistView(
                serviceType: "Engine Oil Service",
                vehicleName: "Myvi WEB 232",
                daysLeft: 5
            )
            
            TaskChecklistView(
                serviceType: "Engine Oil Service",
                vehicleName: "Myvi WEB 232",
                daysLeft: 5
            )
            
            
        }

        Spacer()
    }
}

#Preview {
    PendingTaskView()
}
