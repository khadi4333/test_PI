import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import '../widgets/recipe_widget.dart';

class SearchRecipeScreen extends StatefulWidget {
  final List<RecipeModel> recipes;
    List<RecipeModel> filteredRecipes = [];
  SearchRecipeScreen({super.key,required this.recipes}){filteredRecipes=recipes;}

  @override
  State<SearchRecipeScreen> createState() => _SearchRecipeScreenState();
}

class _SearchRecipeScreenState extends State<SearchRecipeScreen> {
  // List<RecipeModel> filteredRecipes = [];

  void filterRecipes(String value) {
    // Add your logic for filtering recipes based on the search value
    setState(() {
      widget.filteredRecipes = widget.recipes
          .where((recipes) =>
              recipes.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      // // Your filtered list of recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => filterRecipes(value),
          decoration: const InputDecoration(
            icon: Icon(Icons.search, color: Colors.white),
            hintText: "Search Recipe..",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
      body: Container(
        child: widget.filteredRecipes.isNotEmpty
            ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0, // Adjust this aspect ratio for equal width and height
          ),
                itemCount: widget.filteredRecipes.length,
                itemBuilder: (context, index) {
                  return RecipeWidget(widget.filteredRecipes[index]);
                },
              )
            :
        const Center(
          child: Text('Recipes not found...'),
        ),
      ),
    );
  }
}
