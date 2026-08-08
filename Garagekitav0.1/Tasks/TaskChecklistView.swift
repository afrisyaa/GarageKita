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
    let dueDate: String
    
    
    //Ia menyimpan status sama ada task sudah selesai atau belum.
    @State private var isCompleted = false
    
    var body: some View {
        
        
       
        
        
        HStack  {
            
            
            /*
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
            */
            
            
              //leading rapat ke tepi
            //vstack kirikanan
            HStack {
                //icon tepi
                Image(systemName: "tire")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 50)
                    .background(Color.orange)
                    .clipShape(Circle())
              
                
                
                
                //title
                VStack(alignment: .leading) {
                    Text(serviceType)
                        .font(.headline)
                    
                    Text(vehicleName)
                        .font(.caption)
                    
                    Text("DUE")
                        .font(.caption)
                    
                    Text(dueDate)
                        .font(.caption)
                    
                    
                }
            }
            
            Spacer()
            
            
            Text("\(daysLeft)days Left")
                        .font(.caption)
                        .foregroundStyle(.orange)
            
            
        }
        .padding()
        //.frame(width: 10)
        //.background(Color.white)
        //.clipShape(RoundedRectangle(cornerRadius: 12))
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray.opacity(0.3), lineWidth: 2)
        )
        
        
    }
    
}

#Preview {
    
    TaskChecklistView(
        
                serviceType: "Preview Vehicle",
                vehicleName: "Preview Vehicle",
                daysLeft: 5,
                dueDate: "26 September 2023"
                
            
        
    )  
}
