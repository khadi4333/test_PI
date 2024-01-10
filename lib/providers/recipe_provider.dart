import 'dart:io';

import 'package:flutter/material.dart';
import '../data_repostory/dbHelper.dart';
import '../models/recipe_model.dart';

class RecipeClass extends ChangeNotifier {
  RecipeClass() {
    getRecipes();
  }

  bool isDark = false;
  changeIsDark() {
    isDark = !isDark;
    notifyListeners();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController preparationTimeController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  File? image;

  // List to store recipes
  List<RecipeModel> allRecipes = [];
  List<RecipeModel> favoriteRecipes = [];
  getRecipes() async {
    allRecipes = await DbHelper.dbHelper.getAllRecipes();
    favoriteRecipes = allRecipes.where((e) => e.isFavorite).toList();
    notifyListeners();
  }

  insertNewRecipe() async {
    RecipeModel recipeModel = RecipeModel(
        name: nameController.text,
        isFavorite: false,
        image: image,
        ingredients: ingredientsController.text,
        instructions: instructionsController.text,
        preperationTime: int.parse(preparationTimeController.text.isNotEmpty
            ? preparationTimeController.text
            : '0'));

    // print("Recipe Name: ${recipeModel.name}");
    // print("Preparation Time: ${recipeModel.preperationTime}");
    await DbHelper.dbHelper.insertNewRecipe(recipeModel);
    getRecipes();
  }

  // Update an existing recipe in the database
  updateRecipe(RecipeModel recipeModel) async {
    await DbHelper.dbHelper.updateRecipe(recipeModel);

    getRecipes();
    notifyListeners();
  }

  updateIsFavorite(RecipeModel recipeModel) {
    DbHelper.dbHelper.updateIsFavorite(recipeModel);
    getRecipes();
    notifyListeners();
  }

  // Delete a recipe from the database
  void deleteRecipe(RecipeModel recipeModel) async {
    await DbHelper.dbHelper.deleteRecipe(recipeModel);
    getRecipes();
    notifyListeners();
  }
}
