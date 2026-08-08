//
//  OverdueView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 08/08/2026.
//

import SwiftUI

struct OverdueView: View {
    var body: some View {
        
        
        VStack {
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
    OverdueView()
}
