//
//  ActiveWarranty.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 10/08/2026.
//

import SwiftUI

struct ActiveWarranty: View {
    var body: some View {
        
        HStack {
            
            
            VStack (alignment: .leading) {
                
                Text("Active Warranty")
                    .font(.caption)
                    .bold()
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                
                
                Text("4")
                    .font(.title)
                    .bold()
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                
                
                Text("Items")
                    .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                    .font(.caption)
                    .bold()
                
                
                
                
            }
             
            Spacer()

            Image(systemName: "shield.lefthalf.filled")
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
    ActiveWarranty()
}
