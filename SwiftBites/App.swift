import SwiftUI
import SwiftData

@main
struct SwiftBitesApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.storage, Storage())
        .modelContainer(for: [Ingredient.self, Recipe.self, RecipeIngredient.self, Category.self])
    }
  }
}
