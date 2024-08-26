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
    @MainActor
    static func create() -> ModelContainer {
        let schema = Schema([Category.self, Ingredient.self, RecipeIngredient.self, Recipe.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: configuration)
        return container
    }

}
