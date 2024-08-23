import SwiftUI
import SwiftData

/// The main view that appears when the app is launched.
struct ContentView: View {
//  @Environment(\.storage) private var storage
    @Environment(\.modelContext) private var context
    @Query private var ingredients: [Ingredient]
    @Query private var categories: [Category]

  var body: some View {
    TabView {
//      RecipesView()
//        .tabItem {
//          Label("Recipes", systemImage: "frying.pan")
//        }
//
      CategoriesView()
        .tabItem {
          Label("Categories", systemImage: "tag")
        }

      IngredientsView()
        .tabItem {
          Label("Ingredients", systemImage: "carrot")
        }
    }
//    .onAppear {
//      storage.load()
//    }
    .task{
        
// TASK: Insert ingredients
//        do {
//            try context.delete(model: Ingredient.self)
//        } catch {
//            print("Failed to delete all Ingredients.")
//        }
//        

//        context.insert(Ingredient(name:"Pizza Dough"))
//        context.insert(Ingredient(name:"Tomato Sauce"))
//        context.insert(Ingredient(name:"Mozzarella Cheese"))
//        context.insert(Ingredient(name:"Fresh Basil Leaves"))
//        context.insert(Ingredient(name:"Extra Virgin Olive Oil"))
//        context.insert(Ingredient(name:"Salt"))
//        context.insert(Ingredient(name:"Chickpeas"))
//        context.insert(Ingredient(name:"Tahini"))
//        context.insert(Ingredient(name:"Lemon Juice"))
//        context.insert(Ingredient(name:"Garlic"))
//        context.insert(Ingredient(name:"Cumin"))
//        context.insert(Ingredient(name:"Water"))
//        context.insert(Ingredient(name:"Paprika"))
//        context.insert(Ingredient(name:"Parsley"))
//        context.insert(Ingredient(name:"Spaghetti"))
//        context.insert(Ingredient(name:"Eggs"))
//        context.insert(Ingredient(name:"Parmesan Cheese"))
//        context.insert(Ingredient(name:"Pancetta"))
//        context.insert(Ingredient(name:"Black Pepper"))
//        context.insert(Ingredient(name:"Dried Chickpea"))
//        context.insert(Ingredient(name:"Onions"))
//        context.insert(Ingredient(name:"Cilantro"))
//        context.insert(Ingredient(name:"Coriander"))
//        context.insert(Ingredient(name:"Baking Powder"))
//        context.insert(Ingredient(name:"Chicken Thighs"))
//        context.insert(Ingredient(name:"Yogurt"))
//        context.insert(Ingredient(name:"Cardamom"))
//        context.insert(Ingredient(name:"Cinnamon"))
//        context.insert(Ingredient(name:"Turmeric"))
        
// TASK: Insert Categories
//        do {
//            try context.delete(model: Category.self)
//        } catch {
//            print("Failed to delete all Categories.")
//        }
        
//        context.insert(Category(name:"Italian"))
//        context.insert(Category(name:"Middle Eastern"))
        
// TASK: Insert Some recipes with Categories
        
//        do {
//            try context.delete(model: Recipe.self)
//        } catch {
//            print("Failed to delete all Recipes.")
//        }
//        
//        let italianCategory = categories.first( where: { $0.name == "Italian" } )
//        let middleEasternCategory = categories.first( where: { $0.name == "Middle Eastern" } )
//        
//        let ingredientPizzadough = ingredients.first(where: {$0.name == "Pizza Dough"})
//        let ingredientTomatoSauce = ingredients.first(where: {$0.name == "Tomato Sauce"})
//        let ingredientMozzarellaCheese = ingredients.first(where: {$0.name == "Mozzarella Cheese"})
//        let ingredientFreshBasilLeaves = ingredients.first(where: {$0.name == "Fresh Basil Leaves"})
//        let ingredientExtraVirginOliveOil = ingredients.first(where: {$0.name == "Extra Virgin Olive Oil"})
//        let ingredientSalt = ingredients.first(where: {$0.name == "Salt"})
//        
//        let margherita = Recipe(
//          name: "Classic Margherita Pizza",
//          summary: "A simple yet delicious pizza with tomato, mozzarella, basil, and olive oil.",
//          category: italianCategory,
//          serving: 4,
//          time: 50,
//          ingredients: [
//            RecipeIngredient(ingredient: ingredientPizzadough!, quantity: "1 ball"),
//            RecipeIngredient(ingredient: ingredientTomatoSauce!, quantity: "1/2 cup"),
//            RecipeIngredient(ingredient: ingredientMozzarellaCheese!, quantity: "1 cup, shredded"),
//            RecipeIngredient(ingredient: ingredientFreshBasilLeaves!, quantity: "A handful"),
//            RecipeIngredient(ingredient: ingredientExtraVirginOliveOil!, quantity: "2 tablespoons"),
//            RecipeIngredient(ingredient: ingredientSalt!, quantity: "Pinch"),
//          ],
//          instructions: "Preheat oven, roll out dough, apply sauce, add cheese and basil, bake for 20 minutes.",
//          imageData: UIImage(named: "margherita")?.pngData()
//        )
//        
//        context.insert(margherita)
        
    }
  }
}
