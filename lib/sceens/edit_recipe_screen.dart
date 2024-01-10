import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/recipe_model.dart';
import '../providers/recipe_provider.dart';

class EditRecipeScreen extends StatefulWidget {
  final RecipeModel recipeModel;

  const EditRecipeScreen({super.key, required this.recipeModel});

  @override
  State<EditRecipeScreen> createState() => _EditRecipeScreenState();
}

// _EditRecipeScreenState class
class _EditRecipeScreenState extends State<EditRecipeScreen> {
  Future pickImage(BuildContext context, ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    Provider.of<RecipeClass>(context, listen: false).image = File(image.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Recipe'),
      ),
      body: Consumer<RecipeClass>(
        builder: (context, provider, child) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                TextField(
                  controller: provider.nameController,
                  decoration: InputDecoration(
                    label: const Text('Recipe Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: provider.preparationTimeController,
                  decoration: InputDecoration(
                    label: const Text('Preparation Time (minutes)'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    PopupMenuButton(
                      color: !provider.isDark ? Colors.blue[100] : null,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () => pickImage(context, ImageSource.camera),
                          child: Row(
                            children: const [
                              Icon(Icons.camera_alt_outlined),
                              Text('Take a Photo'),
                            ],
                          ),
                        ),

                        PopupMenuItem(
                          onTap: (() =>
                              pickImage(context, ImageSource.gallery)),
                          child: Row(children: [
                            const Icon(Icons.image_outlined),
                            SizedBox(width: 10),
                            Text("select a pikture"),
                          ]),
                        ),

                        // Add more menu items as needed
                      ],
                    ),
                    Text("Add a Picture"),
                  ],
                ),
                Visibility(
                  visible: provider.image != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          provider.image = null;
                          setState(() {});
                        },
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.red,
                        ),
                      ),
                      provider.image != null
                          ? Image.file(
                              provider.image!,
                              width: 100,
                              height: 100,
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: 150,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      controller: provider.ingredientsController,
                      decoration: InputDecoration(
                        labelText: 'ingredients',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: 150,
                    child: TextField(
                      expands: true,
                      maxLines: null,
                      controller: provider.instructionsController,
                      decoration: InputDecoration(
                        labelText: 'instructions',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      // Update the RecipeModel with the data from the UI
                      widget.recipeModel.name = provider.nameController.text;
                      widget.recipeModel.preperationTime = int.parse(
                        provider.preparationTimeController.text.isNotEmpty
                            ? provider.preparationTimeController.text
                            : '0',
                      );
                      widget.recipeModel.image = provider.image;
                      widget.recipeModel.ingredients =
                          provider.ingredientsController.text;
                      widget.recipeModel.instructions =
                          provider.instructionsController.text;

                      // Update the recipe in the database
                      try {
                        provider.updateRecipe(widget.recipeModel);
                      } catch (e) {
                        print('Error updating recipe: $e');
                      }

                      // Clear the controllers and reset UI state
                      provider.nameController.clear();
                      provider.preparationTimeController.clear();
                      provider.instructionsController.clear();
                      provider.ingredientsController.clear();
                      provider.image = null;

                      // Navigate back to the previous screen
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text("save changes"),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
