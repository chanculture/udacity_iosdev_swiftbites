//
//  SwiftBitesContainer.swift
//  SwiftBites
//
//  Created by Christopher Chan on 8/26/24.
//

import Foundation
import SwiftData
import SwiftUI

class SwiftBitesContainer {
    
    let container: ModelContainer
    
    init() {
        let schema = Schema([Category.self, Ingredient.self, RecipeIngredient.self, Recipe.self])
        let configuration = ModelConfiguration()
        do {
            self.container = try ModelContainer(for: schema, configurations: configuration)
        } catch {
            fatalError("Failed to initialize model container with error: \(error)")
        }
    }
}
