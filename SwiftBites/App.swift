import SwiftUI
import SwiftData

@main
struct SwiftBitesApp: App {
    
    let swiftBitesModelContainer = SwiftBitesContainer()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(swiftBitesModelContainer.container)
    }
}
