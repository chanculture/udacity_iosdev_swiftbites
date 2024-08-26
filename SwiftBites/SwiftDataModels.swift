//
//  SwiftDataModels.swift
//  SwiftBites
//
//  Created by Christopher Chan on 8/20/24.
//

import Foundation
import SwiftData

@Model
final class Category: Identifiable, Hashable {
    let id = UUID()
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .nullify, inverse: \Recipe.category)
    var recipes: [Recipe] = []
    
    init(id: UUID = UUID(), name: String = "", recipes: [Recipe] = []) {
        self.id = id
        self.name = name
        self.recipes = recipes
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
}

@Model
final class Ingredient: Identifiable, Hashable {
    let id = UUID()
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .nullify)
    var recipeIngredients: [RecipeIngredient] = []

    init(name: String = ""){
        self.id = UUID()
        self.name = name
        recipeIngredients = []
    }

    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
        recipeIngredients = []
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.id == rhs.id
    }
}

@Model
final class RecipeIngredient: Identifiable, Hashable {
    @Attribute(.unique) let id = UUID()
    
    @Relationship(deleteRule: .nullify, inverse: \Ingredient.recipeIngredients)
    var ingredient: Ingredient?
    
    @Relationship(deleteRule: .nullify, inverse: \Recipe.ingredients)
    var recipe: Recipe?
    
    var quantity: String
    var ingredientName: String = ""
    
    init(
        recipe: Recipe,
        ingredient: Ingredient,
        quantity: String = ""
    ) {
        self.id = UUID()
        self.recipe = recipe
        self.ingredient = ingredient
        self.quantity = quantity
        self.ingredientName = ingredient.name
    }
    
//    init(
//        id: UUID = UUID(),
//        ingredient: Ingredient = Ingredient(),
//        quantity: String = ""
//    ) {
//        self.id = id
//        self.ingredient = ingredient
//        self.quantity = quantity
//        self.ingredientName = ingredient.name
//    }
    
//    init(id: UUID = UUID(), ingredient: Ingredient = Ingredient(), quantity: String = "") {
//        self.id = id
//        self.ingredient = ingredient
//        self.quantity = quantity
//    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: RecipeIngredient, rhs: RecipeIngredient) -> Bool {
        lhs.id == rhs.id
    }
    
}

@Model
final class Recipe: Identifiable, Hashable {
    let id: UUID
    @Attribute(.unique) var name: String
    var summary: String
    
    var category: Category?
    var serving: Int
    var time: Int
    
    @Relationship(deleteRule: .cascade)
    var ingredients: [RecipeIngredient]
    var instructions: String
    var imageData: Data?
    
    init(
        id: UUID = UUID(),
        name: String = "",
        summary: String = "",
        category: Category? = nil,
        serving: Int = 1,
        time: Int = 5,
        ingredients: [RecipeIngredient] = [],
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.id == rhs.id
    }
}
