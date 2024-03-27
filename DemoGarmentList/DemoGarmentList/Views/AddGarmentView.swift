// AddGarmentView.swift

import SwiftUI

struct AddGarmentView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: GarmentViewModel
    @Binding var isPresented: Bool
    @State var garmentName: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Divider to separate navigation bar and content
                Divider()
                
                // MARK: - Garment Name Label and Text Field
                VStack(alignment: .leading, spacing: 10) {
                    Text("Garment name:")
                        .font(.headline)
                        .padding(.leading, 10)
                    TextField(Constants.Placeholders.enterName, text: $garmentName)
                        .padding(.horizontal, 10)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.top, 15)
                
                Spacer()
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {
                    saveButtonAction()
                }) {
                    Text("Save")
                }
            )
            .padding(.horizontal, 10)
            .alert(isPresented: $showAlert) {
                // Alert for displaying error messages
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // MARK: - Private Methods
    
    internal func saveButtonAction() {
        viewModel.addGarment(name: garmentName) { message in
            // Set alert message
            alertMessage = message
            // Show the alert
            showAlert = true
        }
        
        if !showAlert {
            isPresented = false
        }
    }
}
