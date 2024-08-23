import SwiftUI
import SwiftData

/// The main view that appears when the app is launched.
struct ContentView: View {
//  @Environment(\.storage) private var storage
    @Environment(\.modelContext) private var context

  var body: some View {
    TabView {
//      RecipesView()
//        .tabItem {
//          Label("Recipes", systemImage: "frying.pan")
//        }
//
//      CategoriesView()
//        .tabItem {
//          Label("Categories", systemImage: "tag")
//        }

      IngredientsView()
        .tabItem {
          Label("Ingredients", systemImage: "carrot")
        }
    }
//    .onAppear {
//      storage.load()
//    }
    .task{
//        do {
//            try context.delete(model: Ingredient.self)
//        } catch {
//            print("Failed to delete all Ingredients.")
//        }
//        
//        // TASK: Insert ingredients, once
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
        
    }
  }
}
