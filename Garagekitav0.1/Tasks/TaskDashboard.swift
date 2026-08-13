//
//  TaskDashboard.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 08/08/2026.
//

import SwiftUI



struct TaskDashboard: View {
    
    
    @Environment(\.dismiss) private var dismiss
    
    //navbar atas
    @State private var selectedStatus = "Pending"
    

    
    
    //state untuk tambah button add task
    @State private var showAddTask = false
    
    
    @EnvironmentObject var taskStore: TaskStore
    
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            Color.white
                .frame(height: 1)
            
            // Bar kuning atas
            ZStack {
                Color(red: 1.0, green: 0.67, blue: 0.0)
                
                Text("Tasks")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .bold()
                
                //button back kiri
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.leading, 20)
                    }
                    Spacer()

                //button add task
                    Button {
                        showAddTask =  true
                    } label: {
                        Image(systemName: "plus")
                        
                    }
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.trailing, 20)

                }
                
                //addtasknavigation
                
            
            //hide button back
            .navigationBarBackButtonHidden(true)
                
                
                
            }
            .frame(height: 65)
            Spacer()
            
        
            VStack {
                //status bar
                TaskStatusBar(selectedStatus: $selectedStatus)
                
                
                
                List {
                    ForEach($taskStore.tasks) { $task in
                        if task.status == selectedStatus {
                            TaskChecklistView(
                                serviceType: task.serviceType,
                                vehicleName: task.vehicleName,
                                daysLeft: task.daysLeft,
                                dueDate: task.dueDate,
                                mileage: task.mileage,
                                iconName: task.iconName,
                                status: task.status
                            )
                            {newsStatus in task.status = newsStatus
                            }
                        }
                    }
                }
                .listStyle(.plain)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGray6))
            
        }
        //slide dari atas ke bawah
        /*
        .sheet(isPresented: $showAddTask) {
                AddTaskView {
                    newTask in tasks.append(newTask)
                }
            }
        */
        
        
        //ke page add task
        .fullScreenCover(isPresented: $showAddTask) {
            AddTaskView {
                newTask in taskStore.tasks.append(newTask)
            }
        }
        
    }
   
}

#Preview {
    TaskDashboard()
        .environmentObject(TaskStore())
}
