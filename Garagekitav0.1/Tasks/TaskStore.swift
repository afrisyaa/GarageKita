//
//  TaskStore.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 10/08/2026.
//

import SwiftUI
import Combine

class TaskStore: ObservableObject {
    
    @Published var tasks: [TaskItem] = [
        TaskItem(
            serviceType: "Engine Oil Service",
            vehicleName: VehicleStorage.vehicleName(at: 1),
            daysLeft: 5,
            dueDate: "15 Aug 2026",
            mileage: "80,000 KM",
            iconName: "tire",
            status: "Pending"
        ),
        
        
        TaskItem(
            serviceType: "Insurance Renewal",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: 15,
            dueDate: "20 Sept 2026",
            mileage: "120,000 KM",
            iconName: "star.fill",
            status: "Completed"
        ),
        
        TaskItem(
            serviceType: "Engine Oil Service",
            vehicleName: VehicleStorage.vehicleName(at: 1),
            daysLeft: 5,
            dueDate: "15 Aug 2026",
            mileage: "80,000 KM",
            iconName: "drop.fill",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Tyre Service",
            vehicleName: VehicleStorage.vehicleName(at: 1),
            daysLeft: 10,
            dueDate: "20 Aug 2026",
            mileage: "80,000 KM",
            iconName: "circle.circle.fill",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Brake Inspection",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: 7,
            dueDate: "17 Aug 2026",
            mileage: "120,000 KM",
            iconName: "exclamationmark.circle.fill",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Roadtax Renewal",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: 30,
            dueDate: "09 Sep 2026",
            mileage: "120,000 KM",
            iconName: "doc.text.fill",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Insurance Renewal",
            vehicleName: VehicleStorage.vehicleName(at: 3),
            daysLeft: 45,
            dueDate: "24 Sep 2026",
            mileage: "95,000 KM",
            iconName: "shield.fill",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Battery Check",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: 3,
            dueDate: "13 Aug 2026",
            mileage: "60,000 KM",
            iconName: "battery.100",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Air Filter Replacement",
            vehicleName: VehicleStorage.vehicleName(at: 1),
            daysLeft: 14,
            dueDate: "24 Aug 2026",
            mileage: "80,000 KM",
            iconName: "wind",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Coolant Service",
            vehicleName: VehicleStorage.vehicleName(at: 3),
            daysLeft: 18,
            dueDate: "28 Aug 2026",
            mileage: "105,000 KM",
            iconName: "thermometer.medium",
            status: "Pending"
        ),
        
        TaskItem(
            serviceType: "Engine Oil Service",
            vehicleName: VehicleStorage.vehicleName(at: 2),
            daysLeft: 2,
            dueDate: "12 Aug 2026",
            mileage: "40,000 KM",
            iconName: "drop.fill",
            status: "InProgress"
        ),
        
        TaskItem(
            serviceType: "Tyre Replacement",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: 6,
            dueDate: "16 Aug 2026",
            mileage: "120,000 KM",
            iconName: "circle.circle.fill",
            status: "InProgress"
        ),
        
        TaskItem(
            serviceType: "Brake Pad Replacement",
            vehicleName: VehicleStorage.vehicleName(at: 3),
            daysLeft: 4,
            dueDate: "14 Aug 2026",
            mileage: "95,000 KM",
            iconName: "wrench.and.screwdriver.fill",
            status: "InProgress"
        ),
        
        TaskItem(
            serviceType: "Battery Replacement",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: 1,
            dueDate: "11 Aug 2026",
            mileage: "60,000 KM",
            iconName: "battery.25",
            status: "InProgress"
        ),
        
        TaskItem(
            serviceType: "Engine Oil Service",
            vehicleName: VehicleStorage.vehicleName(at: 3),
            daysLeft: 0,
            dueDate: "05 Aug 2026",
            mileage: "105,000 KM",
            iconName: "drop.fill",
            status: "Completed"
        ),
        
        TaskItem(
            serviceType: "Roadtax Renewal",
            vehicleName: VehicleStorage.vehicleName(at: 1),
            daysLeft: 0,
            dueDate: "01 Aug 2026",
            mileage: "80,000 KM",
            iconName: "doc.text.fill",
            status: "Completed"
        ),
        
        TaskItem(
            serviceType: "Insurance Renewal",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: 0,
            dueDate: "30 Jul 2026",
            mileage: "120,000 KM",
            iconName: "shield.fill",
            status: "Completed"
        ),
        
        TaskItem(
            serviceType: "Tyre Inspection",
            vehicleName: VehicleStorage.vehicleName(at: 2),
            daysLeft: 0,
            dueDate: "02 Aug 2026",
            mileage: "40,000 KM",
            iconName: "checkmark.circle.fill",
            status: "Completed"
        ),
        
        TaskItem(
            serviceType: "Engine Oil Service",
            vehicleName: VehicleStorage.vehicleName(at: 0),
            daysLeft: -3,
            dueDate: "06 Aug 2026",
            mileage: "60,000 KM",
            iconName: "drop.fill",
            status: "Overdue"
        ),
        
        TaskItem(
            serviceType: "Roadtax Renewal",
            vehicleName: VehicleStorage.vehicleName(at: 3),
            daysLeft: -7,
            dueDate: "02 Aug 2026",
            mileage: "95,000 KM",
            iconName: "doc.text.fill",
            status: "Overdue"
        ),
        
        TaskItem(
            serviceType: "Insurance Renewal",
            vehicleName: VehicleStorage.vehicleName(at: 3),
            daysLeft: -10,
            dueDate: "30 Jul 2026",
            mileage: "105,000 KM",
            iconName: "shield.fill",
            status: "Overdue"
        ),
        
        TaskItem(
            serviceType: "Brake Inspection",
            vehicleName: VehicleStorage.vehicleName(at: 1),
            daysLeft: -2,
            dueDate: "07 Aug 2026",
            mileage: "80,000 KM",
            iconName: "exclamationmark.triangle.fill",
            status: "Overdue"
        ),
        
    ]
    
    
    
}
