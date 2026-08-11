//
//  UpcomingView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 10/08/2026.
// upcoming task view
//swipaction kanan ', kiri

import SwiftUI

struct UpcomingView: View {
    
    
    
    
    var body: some View {
        
        
        
        HStack {
            
            
            VStack (alignment: .leading) {
                
                Text("Upcoming")
                    .font(.headline)
                    .bold()
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                
                
                Text("3")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                
                
                Text("Overdue Tasks")
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                    .font(.caption)
                    .bold()
                
                
                
                
            }
             
            Spacer()

            Image(systemName: "exclamationmark")
                .font(.title2)
                .bold()
                .foregroundStyle(.orange)
                .frame(width: 40, height: 40)
                .background(Color.orange.opacity(0.15))
                .clipShape(Circle())
                .offset(x: 0)
            
        
            
            
            
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        
        .frame(width: 168,  alignment: .leading )
        
        
        .frame(height: 92)
        //colour
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
            .stroke(Color.black.opacity(0.3), lineWidth: 2)
            
       
            
        )
        
        
        
        
    }
}

#Preview {
    UpcomingView()
}
