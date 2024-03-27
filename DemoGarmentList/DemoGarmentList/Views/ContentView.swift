//
//  ContentView.swift

import SwiftUI

// MARK: - Body

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    // MARK: - PreviewProvider

    static var previews: some View {
        ContentView()
    }
}
