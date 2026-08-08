//
//  HomePage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 05/08/2026.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        
        NavigationStack {
            
            VStack (spacing:0){
                
                //bar kuning atas
                ZStack {
                    Color(red:1.0, green: 0.67, blue: 0.0)
                    
                    Text("Dashboard")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .bold()
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.trailing, 16)
                        
                        
                    }
                    
                }
        
            }
            .frame(height: 65)
            
            
            
            
            //navigation link
            NavigationLink("Task") {
                TaskDashboard()
            }
            .padding()
            Spacer()
            
        } //petak oren
        
        
        
        
        
      
        
    }
}

#Preview {
    HomePage()
}
