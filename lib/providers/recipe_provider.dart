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
  List<RecipeModel> filteredRecipes = [];
  List<RecipeModel> Acheter = [];
  getRecipes() async {
    allRecipes = await DbHelper.dbHelper.getAllRecipes();
    favoriteRecipes = allRecipes.where((e) => e.isFavorite).toList();
    notifyListeners();
  }

  void filterRecipesByCategory(String category) {
    filteredRecipes = allRecipes.where((e) => e.name == category).toList();
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
//corriger le code de achat pour que si on click sur le boutton ajouter cett methode permet d'ajouter dans une autre page qu'on va le preciser
  AcheterProduit(RecipeModel recipeModel) {
    Acheter.add(recipeModel);
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
