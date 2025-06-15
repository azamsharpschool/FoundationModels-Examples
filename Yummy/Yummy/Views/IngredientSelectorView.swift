import SwiftUI

struct IngredientSelectorView: View {
    let ingredients: [Ingredient] = [
        .init(name: "Tomato"),
        .init(name: "Chicken"),
        .init(name: "Garlic"),
        .init(name: "Spinach"),
        .init(name: "Rice"),
        .init(name: "Cheese"),
        .init(name: "Beef"),
        .init(name: "Onion"),
        .init(name: "Broccoli")
    ]
    
    @Binding var selectedIngredients: Set<Ingredient>

    var body: some View {
        NavigationView {
            VStack {
                List(ingredients) { ingredient in
                    HStack {
                        Text(ingredient.name)
                        Spacer()
                        if selectedIngredients.contains(ingredient) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleSelection(of: ingredient)
                    }
                }
                
                Text("Selected: \(selectedIngredients.map { $0.name }.joined(separator: ", "))")
                    .font(.footnote)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .navigationTitle("Select Ingredients")
        }
    }

    private func toggleSelection(of ingredient: Ingredient) {
        if selectedIngredients.contains(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
    }
}
