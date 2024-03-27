//
//  DemoGarmentListApp.swift

import SwiftUI

@main
struct DemoGarmentListApp: App {
    
    // MARK: - Properties

    @StateObject var viewModel = GarmentViewModel()
    @State private var isAddingGarment = false
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            GarmentListView(viewModel: viewModel, isAddingGarment: $isAddingGarment)
                .sheet(isPresented: $isAddingGarment) {
                    AddGarmentView(viewModel: viewModel, isPresented: $isAddingGarment)
                }
        }
    }
}
