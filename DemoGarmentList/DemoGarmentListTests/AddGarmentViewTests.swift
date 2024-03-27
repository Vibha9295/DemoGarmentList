//
//  AddGarmentViewTests.swift
//  DemoGarmentListTests
//
//  Created by Mac on 21/03/24.
//

import XCTest
@testable import DemoGarmentList
import SwiftUI

class AddGarmentViewTests: XCTestCase {
    
    // MARK: - Tests
    func testAddGarmentViewUI() {
        let viewModel = GarmentViewModel()
        let isPresented = Binding<Bool>.constant(false)
        
        let addGarmentView = AddGarmentView(viewModel: viewModel, isPresented: isPresented)
        
        XCTAssertNotNil(addGarmentView)
    }
    
    func testSaveButtonAction() {
           // Given
           let viewModel = GarmentViewModel()
           let isPresented = Binding<Bool>.constant(false)
           let addGarmentView = AddGarmentView(viewModel: viewModel, isPresented: isPresented)
           addGarmentView.garmentName = "Test Garment"
           
           // When
           addGarmentView.saveButtonAction()
           
           // Then
           XCTAssertEqual(viewModel.garments.count, 1)
           XCTAssertEqual(viewModel.garments.first?.name, "Test Garment")
       }
       
       func testSaveButtonActionWithEmptyName() {
           // Given
           let viewModel = GarmentViewModel()
           let isPresented = Binding<Bool>.constant(false)
           let addGarmentView = AddGarmentView(viewModel: viewModel, isPresented: isPresented)
           addGarmentView.garmentName = ""
           
           // When
           addGarmentView.saveButtonAction()
           
           // Then
           XCTAssertFalse(isPresented.wrappedValue)
       }
       
   }

