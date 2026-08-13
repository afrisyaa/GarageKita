//
//  VehicleItem.swift
//  Garagekitav0.1
//
//  Created by STDC_26 on 11/08/2026.
//

import Foundation

struct VehicleItem: Identifiable, Codable {
    var id: UUID = UUID()
    let imageName: String
    let name: String
    let plateNumber: String
    let mileage: String
    let fuelType: String
    let owner: String
    let engineNumber: String
    let transmission: String
    
    var displayName: String {
        "\(name) \(plateNumber)"
    }
    
    static let defaultVehicles = [
        VehicleItem(
            imageName: "Kelisa",
            name: "Perodua Kelisa",
            plateNumber: "VEB 1234",
            mileage: "120,000 km",
            fuelType: "Petrol",
            owner: "Farisya",
            engineNumber: "MXWA 12345",
            transmission: "Auto"
        ),
        VehicleItem(
            imageName: "Myvi",
            name: "Perodua Myvi",
            plateNumber: "VVA 1234",
            mileage: "72,000 km",
            fuelType: "Petrol",
            owner: "Norshahid",
            engineNumber: "3SZ 98765",
            transmission: "Auto"
        ),
        VehicleItem(
            imageName: "Rxz",
            name: "Yamaha RXZ",
            plateNumber: "NBJ 1234",
            mileage: "20,000 km",
            fuelType: "Petrol",
            owner: "Ariena",
            engineNumber: "5PV 54321",
            transmission: "Auto"
        ),
        VehicleItem(
            imageName: "X50",
            name: "Proton X50",
            plateNumber: "VVA 1234",
            mileage: "5,000 km",
            fuelType: "Petrol",
            owner: "Irfan Khasim",
            engineNumber: "JL477Q 11223",
            transmission: "Auto"
        )
    ]
}

struct VehicleStorage {
    
    private static let key =
        "garageKitaVehicles"
    
    static func save(
        _ vehicles: [VehicleItem]
    ) {
        
        do {
            let data =
                try JSONEncoder().encode(vehicles)
            
            UserDefaults.standard.set(
                data,
                forKey: key
            )
            
        } catch {
            print("Failed to save vehicles: \(error)")
        }
    }
    
    static func load()
        -> [VehicleItem] {
        
        guard let data =
                UserDefaults.standard.data(
                    forKey: key
                )
        else {
            return VehicleItem.defaultVehicles
        }
        
        do {
            let vehicles =
                try JSONDecoder().decode(
                    [VehicleItem].self,
                    from: data
                )
            
            return vehicles.isEmpty
                ? VehicleItem.defaultVehicles
                : vehicles
            
        } catch {
            print("Failed to load vehicles: \(error)")
            return VehicleItem.defaultVehicles
        }
    }
    
    static func vehicleNames()
        -> [String] {
        
        load().map {
            $0.displayName
        }
    }
    
    static func vehicleName(
        at index: Int
    ) -> String {
        
        let names =
            vehicleNames()
        
        guard names.indices.contains(index) else {
            return names.first ?? "No Vehicle"
        }
        
        return names[index]
    }
}
