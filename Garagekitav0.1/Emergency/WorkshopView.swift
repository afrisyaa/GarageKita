//
//  WorkshopView.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 10/08/2026.
//

import SwiftUI
import MapKit

struct WorkshopView: View {
    
    @State private var seearchText = ""
    @State private var isExpanded = true
    
    let themeYellow = Color(red: 242/255, green: 177/255, blue: 61/255)
    let themeBlue = Color(red: 30/255, green: 76/255, blue: 124/255)
    
    let workshops = [
        WorkshopItem(
            workshopName: "Bumi Star Bengkel Kereta",
            isOpen: true,
            rating: "4.5",
            distance: "4.1km",
            address: "20, Jalan AR7/AR, Seksyen 7, 40000 Shah Alam, Selangor",
            workshopContact: "0107998155",
            latitude: 3.0773488288100546,
            longitude: 101.48928427680806,
            isCollaborated: true
        ),
        WorkshopItem(
            workshopName: "ASR WORKSHOP",
            isOpen: true,
            rating: "3.2",
            distance: "3.5km",
            address: "Lebuh Keluli, Taman Perindustrian Bukit Raja Selatan, 40000 Shah Alam, Selangor",
            workshopContact: "0176121027",
            latitude: 3.0683955811813215,
            longitude: 101.47844831169584,
            isCollaborated: false
        ),
        
        WorkshopItem(
            workshopName: "MyMechanic Auto Repairs & Battery",
            isOpen: true,
            rating: "3.5",
            distance: "3.5km",
            address: "2, Jalan Platinum, Seksyen 7, 40000 Shah Alam, Selangor",
            workshopContact: "0102277549",
            latitude: 3.079937827880908,
            longitude: 101.49720709231995,
            isCollaborated: false
        ),
        WorkshopItem(
            workshopName: "Tasik Wangsa Sdn Bhd",
            isOpen: true,
            rating: "3.7",
            distance: "3.5km",
            address: "1 , Lorong Keluli 1D, Kawasan Industri Bukit Raja Selatan, Klang, 41050 Klang, 40000 Shah Alam, Selangor",
            workshopContact: "0333412891",
            latitude: 3.0675412391609793,
            longitude:  101.47759274340957,
            isCollaborated: false
        )
    ]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            //Search Bar
            HStack {
                TextField("Search nearby workshop", text: $seearchText)
                    .font(.subheadline)
                
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
            }
            .padding(12)
            .background(.white)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.3)))
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            // 3. Map + Drawer Overlay
            ZStack(alignment: .bottom) {
                
                // Map
                Map {
                    ForEach(workshops.indices, id: \.self) { index in
                        Marker(
                            workshops[index].workshopName, coordinate: CLLocationCoordinate2D(
                                latitude: workshops[index].latitude,
                                longitude: workshops[index].longitude
                            )
                        )
                    }
                }
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Workshop Sheet Drawer Container
                VStack(spacing: 0) {
                    
                    // Header Handle (Button sahaja)
                    Button(action: {
                        withAnimation(.spring()) {
                            isExpanded.toggle()
                        }
                    }) {
                        VStack(spacing: 12) {
                            
                            Capsule()
                                .fill(themeBlue)
                                .frame(width: 45, height: 5)
                            
                            HStack {
                                Text("Nearby Workshop")
                                    .font(.headline)
                                    .bold()
                                    .foregroundStyle(themeBlue)
                                
                                Spacer()
                                
                            
                            }
                            .padding(.horizontal)
                            .padding(.top, 10)
                            .padding(.bottom, 8)
                        }
                    }
                    
                    // List Workshop (Berada di Luar Button)
                    if isExpanded {
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(workshops.indices, id: \.self) { index in
                                    WorkshopCard(
                                        shop: workshops[index],
                                        themeYellow: themeYellow,
                                        themeBlue: themeBlue
                                    )
                                    
                                    Divider()
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 10)
                        }
                        .frame(maxHeight: 160)
                    }
                }
                .background(.white)
                .cornerRadius(24)
                .padding(.horizontal)
                .padding(.bottom, 60)
            }
            
            Spacer(minLength: 10)
        }
        .background(Color(UIColor.systemGroupedBackground))
    }
}

#Preview {
    WorkshopView()
}
