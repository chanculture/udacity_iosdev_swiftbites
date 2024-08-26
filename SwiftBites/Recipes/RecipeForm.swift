import SwiftUI
import PhotosUI
import Foundation
import SwiftData

struct RecipeForm: View {
    enum Mode: Hashable {
        case add
        case edit(Recipe)
    }
    
    var mode: Mode
    
    init(mode: Mode) {
        self.mode = mode
        switch mode {
        case .add:
            title = "Add Recipe"
            _name = .init(initialValue: "")
            _summary = .init(initialValue: "")
            _serving = .init(initialValue: 1)
            _time = .init(initialValue: 5)
            _instructions = .init(initialValue: "")
            _ingredients = .init(initialValue: [])
        case .edit(let recipe):
            title = "Edit \(recipe.name)"
            _name = .init(initialValue: recipe.name)
            _summary = .init(initialValue: recipe.summary)
            _serving = .init(initialValue: recipe.serving)
            _time = .init(initialValue: recipe.time)
            _instructions = .init(initialValue: recipe.instructions)
            _ingredients = .init(initialValue: recipe.ingredients)
            _category = .init(initialValue: recipe.category)
            _imageData = .init(initialValue: recipe.imageData)
            
        }
    }
    
    private let title: String
    @State private var name: String
    @State private var summary: String
    @State private var serving: Int
    @State private var time: Int
    @State private var instructions: String
    @State private var category: Category?
    @State private var ingredients: [RecipeIngredient]
    @State private var imageItem: PhotosPickerItem?
    @State private var imageData: Data?
    @State private var isIngredientsPickerPresented =  false
    @State private var error: Error?
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Query private var categories: [Category]
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { geometry in
            Form {
                imageSection(width: geometry.size.width)
                nameSection
                summarySection
                categorySection
                servingAndTimeSection
                ingredientsSection
                instructionsSection
                deleteButton
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .alert(error: $error)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save", action: save)
                    .disabled(name.isEmpty || instructions.isEmpty)
            }
        }
        .onChange(of: imageItem) { _, _ in
            Task {
                self.imageData = try? await imageItem?.loadTransferable(type: Data.self)
            }
        }
        .sheet(isPresented: $isIngredientsPickerPresented, content: ingredientPicker)
    }
    
    // MARK: - Views
    
    private func ingredientPicker() -> some View {
        IngredientsView { selectedIngredient in
            switch mode {
            case .add:
                let recipeIngredient = RecipeIngredient(ingredient: selectedIngredient,
                                                        quantity: "")
                context.insert(recipeIngredient)
                ingredients.append(recipeIngredient)
            case .edit(let recipe):
                let recipeIngredient = RecipeIngredient(recipe: recipe,
                                                        ingredient: selectedIngredient,
                                                        quantity: "")
                context.insert(recipeIngredient)
                ingredients.append(recipeIngredient)
                
            }
        }
    }
    
    @ViewBuilder
    private func imageSection(width: CGFloat) -> some View {
        Section {
            imagePicker(width: width)
            removeImage
        }
    }
    
    @ViewBuilder
    private func imagePicker(width: CGFloat) -> some View {
        PhotosPicker(selection: $imageItem, matching: .images) {
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                    .frame(maxWidth: .infinity, minHeight: 200, idealHeight: 200, maxHeight: 200, alignment: .center)
            } else {
                Label("Select Image", systemImage: "photo")
            }
        }
    }
    
    @ViewBuilder
    private var removeImage: some View {
        if imageData != nil {
            Button(
                role: .destructive,
                action: {
                    imageData = nil
                },
                label: {
                    Text("Remove Image")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            )
        }
    }
    
    @ViewBuilder
    private var nameSection: some View {
        Section("Name") {
            TextField("Margherita Pizza", text: $name)
        }
    }
    
    @ViewBuilder
    private var summarySection: some View {
        Section("Summary") {
            TextField(
                "Delicious blend of fresh basil, mozzarella, and tomato on a crispy crust.",
                text: $summary,
                axis: .vertical
            )
            .lineLimit(3...5)
        }
    }
    
    @ViewBuilder
    
    private var categorySection: some View {
        Section {
            Picker("Category", selection: $category) {
                Text("None").tag(Category())
                ForEach(categories) { category in
                    Text(category.name).tag(category as Category?)
                }
            }
        }
    }
    
    @ViewBuilder
    private var servingAndTimeSection: some View {
        Section {
            Stepper("Servings: \(serving)p", value: $serving, in: 1...100)
            Stepper("Time: \(time)m", value: $time, in: 5...300, step: 5)
        }
        .monospacedDigit()
    }
    
    @ViewBuilder
    private var ingredientsSection: some View {
        Section("Ingredients") {
            if ingredients.isEmpty {
                ContentUnavailableView(
                    label: {
                        Label("No Ingredients", systemImage: "list.clipboard")
                    },
                    description: {
                        Text("Recipe ingredients will appear here.")
                    },
                    actions: {
                        Button("Add Ingredient") {
                            isIngredientsPickerPresented = true
                        }
                    }
                )
            } else {
                ForEach(ingredients) { ingredient in
                    HStack(alignment: .center) {

                        Text(ingredient.ingredientName)
                            .bold()
                            .layoutPriority(2)
                        Spacer()
                        TextField("Quantity", text: .init(
                            get: {
                                ingredient.quantity
                            },
                            set: { quantity in
                                if let index = ingredients.firstIndex(where: { $0.id == ingredient.id }) {
                                    ingredients[index].quantity = quantity
                                }
                            }
                        ))
                        .layoutPriority(1)
                    }
                    .swipeActions {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            deleteIngredient(ingredient: ingredient)
                          context.delete(ingredient)
                        }
                    }
                }

                
                Button("Add Ingredient") {
                    isIngredientsPickerPresented = true
                }
            }
        }
    }
    
    @ViewBuilder
    private var instructionsSection: some View {
        Section("Instructions") {
            TextField(
        """
        1. Preheat the oven to 475°F (245°C).
        2. Roll out the dough on a floured surface.
        3. ...
        """,
        text: $instructions,
        axis: .vertical
            )
            .lineLimit(8...12)
        }
    }
    
    @ViewBuilder
    private var deleteButton: some View {
        if case .edit(let recipe) = mode {
            Button(
                role: .destructive,
                action: {
                    delete(recipe: recipe)
                },
                label: {
                    Text("Delete Recipe")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            )
        }
    }
    
    // MARK: - Data
    
    func delete(recipe: Recipe) {
        guard case .edit(let recipe) = mode else {
            fatalError("Delete unavailable in add mode")
        }
        do {
            context.delete(recipe)
            try context.save()
        } catch {
            self.error = error
        }

        dismiss()
    }
    
    
    private func deleteIngredient(ingredient: RecipeIngredient) {
        do {
            if let index = ingredients.firstIndex(of: ingredient) {
                ingredients.remove(at: index)
            }
            context.delete(ingredient)
            try context.save()
        } catch {
            self.error = error
        }
    }
    
    func save() {
        category = categories.first(where: { $0 == category })
        
        do {
            switch mode {
            case .add:
                
                let recipe = Recipe(name: name,
                                    summary: summary,
                                    category: category,
                                    serving: serving,
                                    time: time,
                                    ingredients: [],
                                    instructions: instructions,
                                    imageData: imageData)
                context.insert(recipe)
                
                for ingredient in ingredients {
                    ingredient.recipe = recipe
                }
                
                // Manually add recipe to the category's recipe list
                if (category != nil) {
                    category?.recipes.append(recipe)
                }
                
                try context.save()
                
            case .edit(let recipe):
                // Manually remove recipe from old category, if old category existed.
                if let previousCategory = recipe.category {
                    previousCategory.recipes.removeAll { $0 == recipe }
                }
                
                recipe.name = name
                recipe.summary = summary
                recipe.category = category
                recipe.serving = serving
                recipe.time = time
                recipe.ingredients = ingredients
                recipe.instructions = instructions
                recipe.imageData = imageData
                
                // Manually add recipe to the (new) category's recipe list
                if (category != nil) {
                    category?.recipes.append(recipe)
                }
                try context.save()
            }
            dismiss()
        } catch {
            self.error = error
        }
    }
}
