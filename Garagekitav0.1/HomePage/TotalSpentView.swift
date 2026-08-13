//
//  TotalSpentView.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 10/08/2026.
//

import SwiftUI

struct TotalSpentView: View {
    var body: some View {
        
        
        HStack {
            
            
            VStack (alignment: .leading) {
                
                Text("Total Spent")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                
                
                Text("RM 1,250.00")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                
                
              
                
                
                
                
            }
             
            Spacer()

            Image(systemName: "chart.line.uptrend.xyaxis")
                .font(.title2)
                .bold()
                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                .frame(width: 40, height: 40)
                //.background(Color.orange.opacity(0.15))
                //.clipShape(Circle())
                .offset(x: 0)
            
        
            
            
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
        .frame(height: 75)
        //colour
        .background(Color(red: 0.95, green: 0.97, blue: 0.99))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
            
       
            
        )
        
        
        
        
        
        
        
        
        
        
        
        
    
    }
}

#Preview {
    TotalSpentView()
}
