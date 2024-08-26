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
      RecipesView()
        .tabItem {
          Label("Recipes", systemImage: "frying.pan")
        }

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
        
////START UNCOMMENT
//// TASK: Delete Categories
//        do {
//            try context.delete(model: Category.self)
//        } catch {
//            print("Failed to delete all Categories.")
//        }
//        
////// TASK: Delete Recipes
//        do {
//            try context.delete(model: Recipe.self)
//        } catch {
//            print("Failed to delete all Recipes.")
//        }
//
// ////TASK: Delete ingredients
//        do {
//            try context.delete(model: Ingredient.self)
//        } catch {
//            print("Failed to delete all Ingredients.")
//        }
//////TASK: Delete RecipeIngredients
//        do {
//            try context.delete(model: RecipeIngredient.self)
//            try context.save()
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
//        
//        context.insert(Category(name:"Italian"))
//        context.insert(Category(name:"Middle Eastern"))
//        
//        do {
//            try context.save()
//        } catch {
//            print("Failed to save Ingredients & Categories.")
//        }
//
//        
//        let italianCategory = categories.first( where: { $0.name == "Italian" } )
//        let middleEasternCategory = categories.first( where: { $0.name == "Middle Eastern" } )
//  
//        let margherita = Recipe(
//          name: "Classic Margherita Pizza",
//          summary: "A simple yet delicious pizza with tomato, mozzarella, basil, and olive oil.",
//          category: italianCategory,
//          serving: 4,
//          time: 50,
//          ingredients: [],
//          instructions: "Preheat oven, roll out dough, apply sauce, add cheese and basil, bake for 20 minutes.",
//          imageData: UIImage(named: "margherita")?.pngData()
//        )
//        
//        context.insert(margherita)
//        let ingredientPizzadough = ingredients.first(where: {$0.name == "Pizza Dough"})
//        let ingredientTomatoSauce = ingredients.first(where: {$0.name == "Tomato Sauce"})
//        let ingredientMozzarellaCheese = ingredients.first(where: {$0.name == "Mozzarella Cheese"})
//        let ingredientFreshBasilLeaves = ingredients.first(where: {$0.name == "Fresh Basil Leaves"})
//        let ingredientExtraVirginOliveOil = ingredients.first(where: {$0.name == "Extra Virgin Olive Oil"})
//        let ingredientSalt = ingredients.first(where: {$0.name == "Salt"})
//
//        margherita.ingredients = [
//            RecipeIngredient(recipe: margherita, ingredient: ingredientPizzadough!, quantity: "1 ball"),
//            RecipeIngredient(recipe: margherita, ingredient: ingredientTomatoSauce!, quantity: "1/2 cup"),
//            RecipeIngredient(recipe: margherita, ingredient: ingredientMozzarellaCheese!, quantity: "1 cup, shredded"),
//            RecipeIngredient(recipe: margherita, ingredient: ingredientFreshBasilLeaves!, quantity: "A handful"),
//            RecipeIngredient(recipe: margherita, ingredient: ingredientExtraVirginOliveOil!, quantity: "2 tablespoons"),
//            RecipeIngredient(recipe: margherita, ingredient: ingredientSalt!, quantity: "Pinch"),
//          ]
//        
//        let spaghettiCarbonara = Recipe(
//            name: "Spaghetti Carbonara",
//            summary: "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
//            category: italianCategory,
//            serving: 4,
//            time: 30,
//            ingredients: [],
//            instructions: "Cook spaghetti. Fry pancetta until crisp. Whisk eggs and Parmesan, add to pasta with pancetta, and season with black pepper.",
//            imageData: UIImage(named: "spaghettiCarbonara")?.pngData()
//        )
//        
//        context.insert(spaghettiCarbonara)
//        
//        let ingredientspaghetti = ingredients.first(where: {$0.name == "Spaghetti"})
//        let ingredienteggs = ingredients.first(where: {$0.name == "Eggs"})
//        let ingredientparmesanCheese = ingredients.first(where: {$0.name == "Parmesan Cheese"})
//        let ingredientpancetta = ingredients.first(where: {$0.name == "Pancetta"})
//        let ingredientblackPepper = ingredients.first(where: {$0.name == "Black Pepper"})
//        
//        spaghettiCarbonara.ingredients = [
//            RecipeIngredient(recipe: spaghettiCarbonara, ingredient: ingredientspaghetti!, quantity: "400g"),
//            RecipeIngredient(recipe: spaghettiCarbonara,ingredient: ingredienteggs!, quantity: "4"),
//            RecipeIngredient(recipe: spaghettiCarbonara,ingredient: ingredientparmesanCheese!, quantity: "1 cup, grated"),
//            RecipeIngredient(recipe: spaghettiCarbonara,ingredient: ingredientpancetta!, quantity: "200g, diced"),
//            RecipeIngredient(recipe: spaghettiCarbonara,ingredient: ingredientblackPepper!, quantity: "To taste"),
//        ]
//
//        do {
//            try context.save()
//        } catch {
//            print("Failed to save Carbonara recipe.")
//        }
          
//
////// END UNCOMMENT
        
    }
  }
}
