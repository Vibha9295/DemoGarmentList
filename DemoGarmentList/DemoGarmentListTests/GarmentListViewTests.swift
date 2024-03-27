//
//  DemoGarmentListTests.swift
//  DemoGarmentListTests
//
//  Created by Mac on 21/03/24.
//

import XCTest
import SwiftUI
@testable import DemoGarmentList

class GarmentListViewTests: XCTestCase {
    
    // MARK: - Mock ViewModel
    class MockViewModel: GarmentViewModel {
        override func loadGarments() {
            // Simulate loading some mock garments for testing
            garments = [
                Garment(name: "Shirt", creationDate: Date()),
                Garment(name: "Pants", creationDate: Date()),
                Garment(name: "Socks", creationDate: Date())
            ]
        }
    }
    // MARK: - Tests

    func testGarmentListViewDisplaysGarments() {
        // Given
        let viewModel = MockViewModel()
        let isAddingGarment = Binding<Bool>(get: { false }, set: { _ in })
        
        // When
        let view = GarmentListView(viewModel: viewModel, isAddingGarment: isAddingGarment)
        
        // Then
        XCTAssertNotNil(view.body)
    }
    
    func testSortingByAlphabetical() {
        // Given
        let viewModel = MockViewModel()
        let isAddingGarment = Binding<Bool>(get: { false }, set: { _ in })
        let view = GarmentListView(viewModel: viewModel, isAddingGarment: isAddingGarment)
        
        // When
        viewModel.sortOption = .alphabetical
        
        // Then
        viewModel.sortGarments() // Simulate sorting
    }
    
    func testNavigatingToAddGarmentView() {
        // Given
        let viewModel = MockViewModel()
        var isAddingGarment = false
        let isAddingGarmentBinding = Binding<Bool>(get: { isAddingGarment }, set: { newValue in
            isAddingGarment = newValue
        })
        
        let view = GarmentListView(viewModel: viewModel, isAddingGarment: isAddingGarmentBinding)
        
        // When
        view.tapAddButton() // Simulate tapping the "plus" button
        
        // Then
        XCTAssertTrue(isAddingGarment)
    }
}
