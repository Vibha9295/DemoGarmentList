// GarmentListView.swift

import SwiftUI

struct GarmentListView: View {
    
    // MARK: - Properties
    @ObservedObject var viewModel: GarmentViewModel
    @Binding var isAddingGarment: Bool
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                // Picker for sorting options
                Picker(selection: $viewModel.sortOption, label: Text("Sort")) {
                    Text("Alphabetical").tag(GarmentViewModel.SortOption.alphabetical)
                        .font(.custom("Lato", size: 18))
                    Text("Creation Date").tag(GarmentViewModel.SortOption.creationDate)
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: viewModel.sortOption) { _ in
                    viewModel.sortGarments()
                }
                .padding()
                
                // List of garments
                List {
                    ForEach(viewModel.garments) { garment in
                        Text(garment.name)
                    }
                }
            }
            .navigationBarItems(
                            leading: Spacer(),
                            trailing:
                                Button(action: {
                                    isAddingGarment.toggle()
                                }) {
                                    Image(systemName: "plus").accessibilityIdentifier("plus")
                                }
                        )
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                Text("List")
                                    .font(.headline)
                            }
                        }
        }
    }
}
// MARK: - Methods
extension GarmentListView {
    func tapAddButton() {
        // Call the action associated with tapping the "plus" button
        isAddingGarment.toggle()
    }
}
