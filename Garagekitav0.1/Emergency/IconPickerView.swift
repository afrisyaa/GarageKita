//
//  IconPickerView.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 11/08/2026.
//

import SwiftUI

struct IconPickerView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var selectedIcon: String
    
    // Preset list of emergency SF Symbols
    let icons = [
        "cross.case.fill",
        "gearshape.fill",
        "wrench.and.screwdriver.fill",
        "person.fill",
        "phone.fill",
        
    ]
    
    let themeYellow = Color(red: 242/255, green: 177/255, blue: 61/255)
    let themeBlue = Color(red: 30/255, green: 76/255, blue: 124/255)
    
    let columns = [
        GridItem(.adaptive(minimum: 60))
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            Color.white
                .frame(height: 1)
            
            // Header Bar
            ZStack {
                Text("Select Icon")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                
                HStack {
                    Spacer()
                    Button("Done") {
                        dismiss()
                    }
                    .bold()
                    .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .frame(height: 65)
            .background(themeYellow)
            
            // Icon Selection Grid
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(icons, id: \.self) { icon in
                        ZStack {
                            Circle()
                                .fill(themeYellow.opacity(selectedIcon == icon ? 0.3 : 0.15))
                                .frame(width: 60, height: 60)
                                .overlay(
                                    Circle()
                                        .stroke(selectedIcon == icon ? themeYellow : Color.clear, lineWidth: 2)
                                )
                            
                            Image(systemName: icon)
                                .font(.title2)
                                .foregroundStyle(themeYellow)
                        }
                        .onTapGesture {
                            selectedIcon = icon
                            dismiss()
                        }
                    }
                }
                .padding(20)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    IconPickerView(selectedIcon: .constant("cross.case.fill"))
}
