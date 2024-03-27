# SwiftUI Garment Management App

This SwiftUI application manages a list of garments, allowing users to add new garments, view existing ones, and sort them.

## Garment Model

The `Garment` struct represents a garment item in the application. It has the following properties:

- `id`: A unique identifier for the garment.
- `name`: The name of the garment.
- `creationDate`: The date and time when the garment was created.

## GarmentViewModel

The `GarmentViewModel` class manages the data for the application. It provides functionality for adding, loading, and sorting garments. It interacts with the persistent storage to save and retrieve garment data.

### Functions:

- `addGarment(name:)`: Adds a new garment with the given name to the list of garments.
- `loadGarments()`: Loads the list of garments from persistent storage.
- `saveGarments()`: Saves the list of garments to persistent storage.
- `sortAlphabetically()`: Sorts the list of garments alphabetically by name.
- `sortByCreationDate()`: Sorts the list of garments by creation date.

## GarmentListView

The `GarmentListView` struct is a SwiftUI view that displays the list of garments. It allows users to view existing garments, sort them, and add new garments.

### Features:

- Displays a list of garments with their names.
- Provides buttons to sort garments alphabetically or by creation date.
- Allows users to add new garments by tapping the "+" button.

## AddGarmentView

The `AddGarmentView` struct is a SwiftUI view that allows users to add new garments to the list.

### Features:

- Contains a text field for entering the name of the new garment.
- Provides a "Save" button to add the new garment to the list.

## XCTest

Unit tests are included in the project to ensure the correctness of the application's logic. Tests cover functionality such as adding garments, sorting them, and managing the view model.

## Architecture

The application follows the MVVM (Model-View-ViewModel) architecture pattern:

- **Model**: `Garment` struct represents the data model.
- **View**: SwiftUI views (`GarmentListView` and `AddGarmentView`) define the UI.
- **ViewModel**: `GarmentViewModel` class manages the application logic and data flow between the model and views.

