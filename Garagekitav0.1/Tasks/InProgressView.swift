//
//  InProgressView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 08/08/2026.
//

import SwiftUI

struct InProgressView: View {
    var body: some View {
        
        
        
        //panggil parameter
        VStack {
            
          
            
            //PendingTaskView()
            
            VStack {
                TaskChecklistView(
                    serviceType: "Tukar Tayar",
                    vehicleName: "Alza 3023",
                    daysLeft: 5,
                    dueDate: "20 Sept 2026"
                )
            }
            Spacer()
        
            
            
        }

        Spacer()
    }
}

#Preview {
    InProgressView()
}
