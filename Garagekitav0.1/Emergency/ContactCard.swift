//
//  Contact Card.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 08/08/2026.
//

import SwiftUI

struct ContactCard: View {
    
    let iconName: String
    let service: String
    let serviceName: String
    let contactNum: String
    
    
    var body: some View {
        
        HStack(spacing: 16){
            
            //icon
            ZStack {
                Circle()
                    .fill(Color(red: 242/255, green: 177/255, blue: 61/255).opacity(0.15))
                    .frame(width: 50, height: 50)
                Image(systemName: iconName)
                    .font(.title2)
                    .foregroundStyle(Color(red: 242/255, green: 177/255, blue: 61/255))
            }
            
            
            VStack(alignment: .leading, spacing: 4){
                    Text(service)
                        .font(.headline)
                        .bold()
                        .foregroundStyle(Color(red: 30/255, green: 76/255, blue: 124/255))
                    
                    Text(serviceName)
                        .font(.subheadline)
                        .foregroundStyle(Color(red: 30/255, green: 76/255, blue: 124/255))
                
                    Text(contactNum)
                        .font(.subheadline)
                        .foregroundStyle(Color(red: 30/255, green: 76/255, blue: 124/255))
                    
                }
            Spacer()
                
                Image(systemName: "phone.fill")
                .font(.title2)
                .foregroundStyle(Color(red: 30/255, green: 76/255, blue: 124/255))
                
        }
        .padding()
        .background(.white, in: RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(
                    Color.gray.opacity(0.3),
                    lineWidth: 1
                )
        )
        
        
        
    }
}

#Preview {
    ContactCard(iconName: "shield.checkered",
                service: "Insurance",
                serviceName: "Etika Insurance",
                contactNum: "1800881000")
}
