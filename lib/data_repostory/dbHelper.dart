import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../models/recipe_model.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName = 'recipes';
  final String nameColumn = 'name';
  final String idColumn = 'id';
  final String isFavoriteColumn = 'isFavorite';
  final String ingredientsColumn = 'ingredients';
  final String instructionsColumn = 'instructions';
  final String preperationTimeColumn = 'preperationTime';
  final String imageColumn = 'image';

  // Initialize the database
  initDatabase() async {
    database = await connectToDatabase();
  }

  // Connect to the database
  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/recipes.db';
    return openDatabase(
      path,
      version: 1, // Increment version when schema changes
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $nameColumn TEXT NOT NULL,
            $preperationTimeColumn INTEGER NOT NULL,
            $isFavoriteColumn INTEGER,
            $ingredientsColumn TEXT,
            $instructionsColumn TEXT,
            $imageColumn TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute('''
          CREATE TABLE $tableName (
            $idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
            $nameColumn TEXT NOT NULL,
            $preperationTimeColumn INTEGER NOT NULL,
            $isFavoriteColumn INTEGER,
            $ingredientsColumn TEXT,
            $instructionsColumn TEXT,
            $imageColumn TEXT
          )
        ''');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  // Retrieve all recipes from the database
  Future<List<RecipeModel>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => RecipeModel.fromMap(e)).toList();
  }

  // Insert a recipe into the database
  insertNewRecipe(RecipeModel recipeModel) async {
    database.insert(tableName, recipeModel.toMap());
  }

  // Delete a recipe from the database
  deleteRecipe(RecipeModel recipeModel) async {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [recipeModel.id]);
  }

  deleteRecipes() {
    database.delete(tableName);
  }

  // Update a recipe in the database
  updateRecipe(RecipeModel recipeModel) async {
    await database.update(
      tableName,
      {
        nameColumn: recipeModel.name,
        isFavoriteColumn: recipeModel.isFavorite ? 1 : 0,
        preperationTimeColumn: recipeModel.preperationTime,
        imageColumn: recipeModel.image!.path,
        ingredientsColumn: recipeModel.ingredients,
        instructionsColumn: recipeModel.instructions,
      },
      where: '$idColumn = ?',
      whereArgs: [recipeModel.id],
    );
  }

  //to add favorite
  updateIsFavorite(RecipeModel recipeModel) {
    database.update(
        tableName, {isFavoriteColumn: !recipeModel.isFavorite ? 1 : 0},
        where: '$idColumn=?', whereArgs: [recipeModel.id]);
  }
}
