//
//  TaskChecklistView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 06/08/2026.
//

import SwiftUI




struct TaskChecklistView: View {
    
    //parameter
    let serviceType: String
    let vehicleName: String
    let daysLeft: Int
    
    
    //Ia menyimpan status sama ada task sudah selesai atau belum.
    @State private var isCompleted = false
    
    var body: some View {
        
        
       
        
        
        HStack {
            
            
            
            //Image(systemName: "circle")
            //button
            Button {
                isCompleted.toggle()
            } label: {
                Image  (
                    systemName: isCompleted
                    ? "checkmark.circle.fill"
                    : "circle"
                    
                )
                .foregroundStyle(isCompleted ?  .green :  .gray)
                .bold()
                .font(.title2)
                
            }
            
            
            
            
            
              //leading rapat ke tepi
            //vstack kirikanan
            VStack(alignment: .leading) {
                Text(serviceType)
                    .font(.headline)
                
                Text(vehicleName)
                    .font(.caption)
                
                
            }
            
            Spacer()
            
            
            Text("\(daysLeft)days Left")
                        .font(.caption)
                        .foregroundStyle(.orange)
            
            
        } .padding()
    
        
    }
}

#Preview {
    
    TaskChecklistView(
        
                serviceType: "Preview Vehicle",
                vehicleName: "Preview Vehicle",
                daysLeft: 5
                
            
        
    )  
}
