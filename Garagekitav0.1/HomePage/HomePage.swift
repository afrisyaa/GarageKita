//
//  HomePage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 05/08/2026.
//

import SwiftUI

struct HomePage: View {
    
    
    @EnvironmentObject var taskStore: TaskStore
    
    
    var body: some View {
        
        
        

        NavigationStack {
            VStack(spacing: 0) {
                
                //bar kuning atas
                ZStack {
                    Color(red:1.0, green: 0.67, blue: 0.0)
                    
                    Text("Dashboard")
                        .font(.title3)
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
                .frame(maxWidth: .infinity)
                .frame(height: 65)
                
                ScrollView {
                    VStack(spacing: 0) {
                        //greeting
                        VStack(alignment: .leading, spacing: 4) {
                            
                            
                            Text("Good Morning, Guest!👋")
                                .font(.title2)
                                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                                .bold()
                            
                            Text("Here's what's happening for your car.")
                                .font(.title3)
                                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.top, 30)
                        
                        //card for vehicle summary
                        TabView {
                            VehicleSummaryCard(
                                vehicleCount: 4,
                                vehicleLabel: "Vehicles",
                                imageName: "Myvi"
                            )

                            VehicleSummaryCard(
                                vehicleCount: 4,
                                vehicleLabel: "Vehicles",
                                imageName: "kancil"
                            )
                            
                            
                            
                            VehicleSummaryCard(
                                vehicleCount: 4,
                                vehicleLabel: "Vehicles",
                                imageName: "RXZ"
                            )
                            
                            VehicleSummaryCard(
                                vehicleCount: 4,
                                vehicleLabel: "Vehicles",
                                imageName: "X50",
                                imageWidth: 245,
                                imageHeight: 150,
                                imageOffsetX: -35,
                                imageOffsetY: 12
                            )
                            
                            
                          
                            
                        }
                        .frame(height: 180)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .padding(.top, 16)
                        
                        
                        
                        
                        HStack (spacing: 8){
                            UpcomingView()
                            
                            
                            ActiveWarranty()
                            
                        } .padding(.top, 20)
                        
                        TotalSpentView()
                        
                        
                        
                        
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, 10)
                            .padding(.top, 8)
                        
                        
                        
                        
                        //navigation link
                        HStack {
                            
                            Text("Upcoming Tasks")
                                .font(.title3)
                                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                                .bold()
                            Spacer()
                            
                            
                            
                            NavigationLink("See All") {
                                TaskDashboard()
                            }
                            
                            .font(.title3)
                            .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                            .bold()
                            .padding()
                            
                            //.offset(x: 145)
                            
                            
                            
                        }
                        .padding(.horizontal, 24)
                        
                        //Spacer()
                        
                        ForEach(taskStore.tasks.filter { $0.status == "Pending"}.prefix(4)) { task in
                            TaskChecklistView(
                                serviceType: task.serviceType,
                                vehicleName: task.vehicleName,
                                daysLeft: task.daysLeft,
                                dueDate: task.dueDate,
                                mileage: task.mileage,
                                iconName: task.iconName,
                                status: task.status
                            ) { newStatus in
                                print (newStatus)
                            }
                        }
                    }
                    .padding(.bottom, 120)
                }
            }
        } //petak oren
        
        
        
        
        
      
        
    }
}

#Preview {
    HomePage()
        .environmentObject(TaskStore())
}
