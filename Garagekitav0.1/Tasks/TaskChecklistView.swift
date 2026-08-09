//
//  TaskChecklistView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 06/08/2026.
//

import SwiftUI





struct TaskChecklistView: View {
    
   
    let serviceType: String
    let vehicleName: String
    let daysLeft: Int
    let dueDate: String
    let mileage: String
    let iconName: String
    var status: String
    let onStatusChange: (String) -> Void
    
    //Ia menyimpan status sama ada task sudah selesai atau belum.
    @State private var isCompleted = false
    
    @State private var removeTask = false
    
    var body: some View {
        
        
        
        HStack {
            
            
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
            HStack (spacing: 5){
                //icon tepi
                Image(systemName: iconName)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.orange)
                    .clipShape(Circle())
              
                
                
                
                //title
                VStack(alignment: .leading, spacing: 2) {
                    Text(serviceType)
                        .font(.subheadline)
                    
                    Text(vehicleName)
                        .font(.caption2)
                    
                    Text("DUE")
                        .font(.caption2)
                    
                    Text(dueDate)
                        .font(.caption2)
                    
                    Text(mileage)
                        .font(.caption2)
                    
                    
                }
            }
            
            Spacer()
            
            
            Text("\(daysLeft)days Left")
                        .font(.caption)
                        .foregroundStyle(.orange)
            
            
        }
        //.padding kotak
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowSeparator(.hidden)
        .listRowBackground(Color(.systemGray6))
        
        //swipe
        .swipeActions(edge: .trailing) {
            
            Button {
                //print("Move to Completed")
                onStatusChange("Completed")
            } label: {
                Label("Completed", systemImage: "checkmark.circle.fill")
            }
            .tint(.green)
            
            
            Button {
                onStatusChange("InProgress")
            } label: {
                Label("Progress", systemImage: "clock.fill")
            }
            .tint(.blue)
        }
        .swipeActions(edge: .leading) {
            Button {
                onStatusChange("Overdue")
            } label: {
                Label("Overdue", systemImage: "exclamationmark.triangle.fill")
            }
            .tint(.red)
        }
        

        
        
        
        
    }
    
}

#Preview {
    
    TaskChecklistView(
        
        serviceType: "Preview Vehicle",
        vehicleName: "Preview Vehicle",
        daysLeft: 5,
        dueDate: "26 September 2023",
        mileage: "80,000 KM",
        iconName: "star.fill",
        status: "Pending"
        
        
        
    )   {newsStatus in print(newsStatus)
    }
}
