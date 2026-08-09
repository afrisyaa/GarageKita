//
//  File.swift
//  Garagekitav0.1
//
//  Created by STDC_25 on 09/08/2026.
//

import Foundation

struct TaskItem: Identifiable {
    
    let id = UUID()
    let serviceType: String
    let vehicleName: String
    let daysLeft: Int
    let dueDate: String
    let mileage: String
    let iconName: String
    var status: String
    
    
}

