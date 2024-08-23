import Foundation
import SwiftData

/**
 * This file contains temporary models that should be replaced when adding SwiftData.
 * It is essential to remove this file before the final project submission.
 */

struct MockCategory: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var recipes: [MockRecipe]
    
    init(id: UUID = UUID(), name: String = "", recipes: [MockRecipe] = []) {
        self.id = id
        self.name = name
        self.recipes = recipes
    }
}

//@Model
//final class Category {
//    let id: UUID
//    var name: String
//    var recipes: [Recipe]
//    
////    init(name: String = "", recipes: [Recipe] = [] ) {
////        self.id = UUID()
////        self.name = name
////        self.recipes = recipes
////    }
//    
//    init(id: UUID = UUID(), name: String = "", recipes: [Recipe] = []) {
//        self.id = id
//        self.name = name
//        self.recipes = recipes
//    }
//}

struct MockIngredient: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    
    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
    }
}

//@Model
//final class Ingredient {
//    let id: UUID
//    var name: String
//    
//    init(name: String = ""){
//        self.id = UUID()
//        self.name = name
//    }
//    
//    init(id: UUID = UUID(), name: String = "") {
//        self.id = id
//        self.name = name
//    }
//}

struct MockRecipeIngredient: Identifiable, Hashable, Codable {
    let id: UUID
    var ingredient: MockIngredient
    var quantity: String
    
    init(id: UUID = UUID(), ingredient: MockIngredient = MockIngredient(), quantity: String = "") {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }
}

//@Model
//final class RecipeIngredient {
//    let id: UUID
//    var ingredient: Ingredient
//    var quantity: String
//    
//    init(id: UUID = UUID(), ingredient: Ingredient = Ingredient(), quantity: String = "") {
//        self.id = id
//        self.ingredient = ingredient
//        self.quantity = quantity
//    }
//}

struct MockRecipe: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var summary: String
    var category: MockCategory?
    var serving: Int
    var time: Int
    var ingredients: [MockRecipeIngredient]
    var instructions: String
    var imageData: Data?
    
    init(
        id: UUID = UUID(),
        name: String = "",
        summary: String = "",
        category: MockCategory? = nil,
        serving: Int = 1,
        time: Int = 5,
        ingredients: [MockRecipeIngredient] = [],
        instructions: String = "",
        imageData: Data? = nil
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.category = category
        self.serving = serving
        self.time = time
        self.ingredients = ingredients
        self.instructions = instructions
        self.imageData = imageData
    }
}

//@Model
//final class Recipe {
//    let id: UUID
//    var name: String
//    var summary: String
//    var category: Category?
//    var serving: Int
//    var time: Int
//    var ingredients: [RecipeIngredient]
//    var instructions: String
//    var imageData: Data?
//    
//    init(
//        id: UUID = UUID(),
//        name: String = "",
//        summary: String = "",
//        category: Category? = nil,
//        serving: Int = 1,
//        time: Int = 5,
//        ingredients: [RecipeIngredient] = [],
//        instructions: String = "",
//        imageData: Data? = nil
//    ) {
//        self.id = id
//        self.name = name
//        self.summary = summary
//        self.category = category
//        self.serving = serving
//        self.time = time
//        self.ingredients = ingredients
//        self.instructions = instructions
//        self.imageData = imageData
//    }
//}
