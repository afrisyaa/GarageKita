//
//  HomePage.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 05/08/2026.
//

import SwiftUI

struct HomePage: View {
    
    
    @EnvironmentObject var taskStore: TaskStore
    var onViewAllVehicles: () -> Void = {}
    
    @State private var vehicles =
        VehicleStorage.load()
    
    
    var body: some View {
        
        
        

        NavigationStack {
            VStack(spacing: 0) {
                
                Color.white
                    .frame(height: 1)
                
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
                            
                            
                            Text("Good Morning, IrfanKhasim!👋")
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
                            ForEach(vehicles) { vehicle in
                                VehicleSummaryCard(
                                    vehicleCount:
                                        vehicles.count,
                                    vehicleLabel: "Vehicles",
                                    imageName:
                                        vehicle.imageName,
                                    onViewAll:
                                        onViewAllVehicles
                                )
                            }
                        }
                        .frame(height: 180)
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                        
                        
                        
                        
                        HStack (spacing: 8){
                            UpcomingView()
                            
                            
                            ActiveWarranty()
                            
                        } .padding(.top, 5)
                            .padding(.horizontal, 16)
                        
                        TotalSpentView()
                        
                        
                        
                        
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                        
                        
                        
                        
                        //navigation link
                        HStack {
                            
                            Text("Upcoming Tasks")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                                .bold()
                            Spacer()
                            
                            
                            
                            NavigationLink("See All") {
                                TaskDashboard()
                            }
                            
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(Color(red: 0.02, green: 0.32, blue: 0.56))
                            .bold()
                            .padding()
                            .underline()
                            
                            //.offset(x: 145)
                            
                            
                            
                        }
                        .padding(.horizontal, 16)
                        
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
        .onAppear {
            vehicles = VehicleStorage.load()
        }
        
        
        
        
        
      
        
    }
}

#Preview {
    HomePage()
        .environmentObject(TaskStore())
}
