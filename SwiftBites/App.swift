import SwiftUI
import SwiftData

@main
struct SwiftBitesApp: App {
  var body: some Scene {
      WindowGroup {
          ContentView()
      }
//      .modelContainer(for: [Ingredient.self, Recipe.self, RecipeIngredient.self, Category.self])
      .modelContainer(SwiftBitesContainer.create())
  }
}
