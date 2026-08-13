import SwiftUI
import UniformTypeIdentifiers

struct WarrantyPage: View {
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Maintenance Information
    
    let vehicleName: String
    let serviceName: String
    let store: String
    let serviceDate: Date
    let notes: String
    var onFinished: (() -> Void)? = nil
    
    // MARK: - Warranty Information
    
    @State private var warrantyName = ""
    @State private var item = ""
    
    @State private var startDate = Date()
    
    @State private var endDate =
        Calendar.current.date(
            byAdding: .month,
            value: 1,
            to: Date()
        ) ?? Date()
    
    // MARK: - File
    
    @State private var showFileImporter = false
    @State private var selectedFileName = ""
    
    // MARK: - Alert
    
    @State private var showSavedAlert = false
    
    // MARK: - Colors
    
    private let darkBlue = Color(
        red: 0.02,
        green: 0.31,
        blue: 0.53
    )
    
    private let orange = Color(
        red: 1.0,
        green: 0.65,
        blue: 0.05
    )
    
    
    var body: some View {
        
        ZStack {
            
            Color(
                red: 0.93,
                green: 0.93,
                blue: 0.93
            )
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                // MARK: Top Bar
                
                Color.white
                    .frame(height: 1)
                
                HStack {
                    
                    Button {
                        dismiss()
                    } label: {
                        
                        Image(
                            systemName: "chevron.left"
                        )
                        .font(
                            .system(
                                size: 25,
                                weight: .medium
                            )
                        )
                        .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("Add Warranty")
                        .font(
                            .system(
                                size: 20,
                                weight: .bold
                            )
                        )
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(
                        systemName: "chevron.left"
                    )
                    .font(.system(size: 25))
                    .foregroundColor(.clear)
                }
                .padding(.horizontal, 20)
                .frame(height: 65)
                .background(orange)
                
                
                // MARK: Content
                
                GeometryReader { geometry in
                    
                    let formWidth =
                        min(300, geometry.size.width - 100)
                    
                    ScrollView(
                        showsIndicators: false
                    ) {
                        
                        VStack(spacing: 12) {
                        
                        // MARK: Warranty Detail
                        
                        VStack(
                            alignment: .leading,
                            spacing: 12
                        ) {
                            
                            Text("Warranty detail:")
                                .font(
                                    .system(
                                        size: 18,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(darkBlue)
                            
                            
                            // MARK: Warranty Name
                            
                            WarrantyInput(
                                title: "Warranty Name:",
                                placeholder:
                                    "Example: Oil Filter Warranty",
                                text: $warrantyName
                            )
                            
                            
                            // MARK: Item
                            
                            WarrantyInput(
                                title: "Item:",
                                placeholder:
                                    "Example: Engine Oil Services",
                                text: $item
                            )
                            
                            
                            // MARK: Warranty Period
                            
                            VStack(
                                alignment: .leading,
                                spacing: 5
                            ) {
                                
                                Text("Warranty Period:")
                                    .font(
                                        .system(
                                            size: 13,
                                            weight: .bold
                                        )
                                    )
                                    .foregroundColor(darkBlue)
                                
                                
                                HStack(spacing: 4) {
                                    
                                    WarrantyDateBox(
                                        title: "Start Date",
                                        date: $startDate
                                    )
                                    .frame(maxWidth: .infinity)
                                    
                                    Text("to")
                                        .font(
                                            .system(
                                                size: 13,
                                                weight: .bold
                                            )
                                        )
                                        .foregroundColor(darkBlue)
                                    
                                    WarrantyDateBox(
                                        title: "End Date",
                                        date: $endDate
                                    )
                                    .frame(maxWidth: .infinity)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            
                            
                            // MARK: Warranty Document
                            
                            VStack(
                                alignment: .leading,
                                spacing: 5
                            ) {
                                
                                Text("Warranty Document:")
                                    .font(
                                        .system(
                                            size: 13,
                                            weight: .bold
                                        )
                                    )
                                    .foregroundColor(darkBlue)
                                
                                
                                Button {
                                    
                                    showFileImporter = true
                                    
                                } label: {
                                    
                                    VStack(spacing: 10) {
                                        
                                        Image(
                                            systemName:
                                                selectedFileName.isEmpty
                                                ? "icloud.and.arrow.up"
                                                : "doc.fill"
                                        )
                                        .font(
                                            .system(
                                                size: 38
                                            )
                                        )
                                        .foregroundColor(
                                            Color.gray.opacity(0.55)
                                        )
                                        
                                        
                                        Text(
                                            selectedFileName.isEmpty
                                            ? "Upload File"
                                            : selectedFileName
                                        )
                                        .font(
                                            .system(
                                                size: 16,
                                                weight: .semibold
                                            )
                                        )
                                        .foregroundColor(
                                            Color.blue.opacity(0.30)
                                        )
                                        .lineLimit(1)
                                        .padding(
                                            .horizontal,
                                            15
                                        )
                                    }
                                    .frame(
                                        maxWidth: .infinity
                                    )
                                    .frame(height: 120)
                                    .background(Color.white)
                                    .clipShape(
                                        RoundedRectangle(
                                            cornerRadius: 15
                                        )
                                    )
                                    .overlay(
                                        RoundedRectangle(
                                            cornerRadius: 15
                                        )
                                        .stroke(
                                            Color.gray.opacity(0.25),
                                            lineWidth: 1
                                        )
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .frame(width: formWidth)
                        
                        
                        // MARK: Save Warranty
                        
                        Button {
                            
                            saveWarranty()
                            
                        } label: {
                            
                            Text("Save Warranty")
                                .font(
                                    .system(
                                        size: 17,
                                        weight: .bold
                                    )
                                )
                                .foregroundColor(.white)
                                .frame(
                                    maxWidth: .infinity
                                )
                                .frame(height: 50)
                                .background(
                                    orange.opacity(0.8)
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 13
                                    )
                                )
                        }
                        .frame(width: 240)
                        .padding(.bottom, 20)
                        }
                        .frame(
                            maxWidth: .infinity
                        )
                        .frame(
                            minHeight: geometry.size.height * 0.100,
                            alignment: .center
                        )
                        .padding(.horizontal, 50)
                        .padding(.top, 24)
                        .padding(.bottom, 24)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        
        // MARK: File Picker
        
        .fileImporter(
            isPresented: $showFileImporter,
            allowedContentTypes: [.item],
            allowsMultipleSelection: false
        ) { result in
            
            switch result {
                
            case .success(let urls):
                
                if let url = urls.first {
                    selectedFileName =
                        url.lastPathComponent
                }
                
            case .failure(let error):
                
                print(
                    "File selection error: \(error.localizedDescription)"
                )
            }
        }
        
        
        // MARK: Save Alert
        
        .alert(
            "Warranty Saved",
            isPresented: $showSavedAlert
        ) {
            
            Button("OK") {
                if let onFinished {
                    onFinished()
                } else {
                    dismiss()
                }
            }
            
        } message: {
            
            Text(
                "Your warranty information has been added successfully."
            )
        }
    }
    
    
    // MARK: - Save Warranty
    
    private func saveWarranty() {
        
        print("========== WARRANTY ==========")
        
        print(
            "Vehicle: \(vehicleName)"
        )
        
        print(
            "Service: \(serviceName)"
        )
        
        print(
            "Store: \(store)"
        )
        
        print(
            "Service Date: \(serviceDate)"
        )
        
        print(
            "Notes: \(notes)"
        )
        
        print(
            "Warranty Name: \(warrantyName)"
        )
        
        print(
            "Item: \(item)"
        )
        
        print(
            "Start Date: \(startDate)"
        )
        
        print(
            "End Date: \(endDate)"
        )
        
        print(
            "Document: \(selectedFileName)"
        )
        
        print("==============================")
        
        // No database.
        
        showSavedAlert = true
    }
}


// MARK: - Warranty Input

struct WarrantyInput: View {
    
    let title: String
    let placeholder: String
    
    @Binding var text: String
    
    private let darkBlue = Color(
        red: 0.02,
        green: 0.31,
        blue: 0.53
    )
    
    
    var body: some View {
        
        VStack(
            alignment: .leading,
            spacing: 5
        ) {
            
            Text(title)
                .font(
                    .system(
                        size: 13,
                        weight: .bold
                    )
                )
                .foregroundColor(darkBlue)
            
            
            TextField(
                placeholder,
                text: $text
            )
            .font(
                .system(size: 14)
            )
            .foregroundColor(darkBlue)
            .padding(
                .horizontal,
                15
            )
            .frame(height: 40)
            .background(Color.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: 12
                )
                .stroke(
                    Color.gray.opacity(0.25),
                    lineWidth: 1
                )
            )
        }
        .frame(maxWidth: .infinity)
    }
}


// MARK: - Warranty Date Box

struct WarrantyDateBox: View {
    
    let title: String
    
    @Binding var date: Date
    
    private let darkBlue = Color(
        red: 0.02,
        green: 0.31,
        blue: 0.53
    )
    
    
    var body: some View {
        
        ZStack {
            
            HStack(spacing: 4) {
                
                Image(
                    systemName: "calendar"
                )
                .font(
                    .system(size: 12)
                )
                .foregroundColor(
                    darkBlue.opacity(0.6)
                )
                
                Text(
                    formattedDate(date)
                )
                .font(
                    .system(size: 12)
                )
                .foregroundColor(darkBlue)
                .lineLimit(1)
                .minimumScaleFactor(0.85)
            }
            
            DatePicker(
                "",
                selection: $date,
                displayedComponents: .date
            )
            .labelsHidden()
            .tint(darkBlue)
            .opacity(0.02)
        }
        .padding(
            .horizontal,
            10
        )
        .frame(
            maxWidth: .infinity
        )
        .frame(height: 40)
        .background(Color.white)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 12
            )
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 12
            )
            .stroke(
                Color.gray.opacity(0.2),
                lineWidth: 1
            )
        )
    }
    
    
    private func formattedDate(
        _ date: Date
    ) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat =
            "dd MMM yyyy"
        
        return formatter.string(
            from: date
        )
    }
}


// MARK: - Preview

#Preview {
    
    NavigationStack {
        
        WarrantyPage(
            vehicleName: "Myvi VEB 1234",
            serviceName: "Change Brake Pad",
            store: "Bengkel Berjaya",
            serviceDate: Date(),
            notes: ""
        )
    }
}
