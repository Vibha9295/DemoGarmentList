// GarmentViewModel.swift

import Foundation

class GarmentViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var sortOption: SortOption = .alphabetical
    @Published var garments: [Garment] = []
    
    // MARK: - Enumerations

    enum SortOption {
        case alphabetical
        case creationDate
    }
    
    // MARK: - Initialization

    init() {
        loadGarments()
    }
    
    // MARK: - Methods

    // Function to sort garments based on selected option
    func sortGarments() {
        switch sortOption {
        case .alphabetical:
            garments.sort { $0.name < $1.name }
        case .creationDate:
            garments.sort { $0.creationDate < $1.creationDate }
        }
    }

    func addGarment(name: String, showAlert: @escaping (String) -> Void) {
        // Trim whitespace from the name
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Check if the name is empty after trimming
        guard !trimmedName.isEmpty else {
            // Handle empty name error
            showAlert(Constants.AlertMessages.emptyName)
            return
        }
        
        // Check if the name already exists
        guard !garments.contains(where: { $0.name == trimmedName }) else {
            // Handle duplicate name error
            showAlert(Constants.AlertMessages.duplicateName)
            return
        }
        
        // If validation passes, create and add the new garment
        let newGarment = Garment(name: trimmedName, creationDate: Date())
        garments.append(newGarment)
        
        saveGarments()
        sortGarments()
    }

    // Function to load garments from UserDefaults
    func loadGarments() {
        if let data = UserDefaults.standard.data(forKey: Constants.UserDefaultsKeys.garments),
           let decodedGarments = try? JSONDecoder().decode([Garment].self, from: data) {
            garments = decodedGarments
        }
    }
    
    // Function to save garments to UserDefaults
    private func saveGarments() {
        if let encodedData = try? JSONEncoder().encode(garments) {
            UserDefaults.standard.set(encodedData, forKey: Constants.UserDefaultsKeys.garments)
        }
    }
}
