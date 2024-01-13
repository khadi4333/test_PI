import 'dart:io';
import 'package:app_pi/ThemeNotifier.dart';
import 'package:app_pi/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/recipe_provider.dart';
import '../widgets/bottom_nav.dart';
import 'main_recipe_screen.dart';
// import 'main_recipe_screen.dart';

class NewRecipeScreen extends StatefulWidget {
  const NewRecipeScreen({Key? key});

  @override
  State<NewRecipeScreen> createState() => _NewRecipeScreenState();
}

class _NewRecipeScreenState extends State<NewRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    Provider.of<RecipeClass>(context, listen: false).image = File(image.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Ajouter Nouveau Produit",
                    style: TextStyle(fontSize: 30),
                  )),
              SizedBox(
                height: 20,
              ),
              Consumer<RecipeClass>(
                builder: (context, provider, child) => SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: provider.nameController,
                            decoration: InputDecoration(
                              labelText: 'Recipe Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a recipe name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: provider.preparationTimeController,
                            decoration: InputDecoration(
                              labelText: 'Preparation Time (mins)',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter preparation time';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          // Add more input fields or UI elements as needed
                          Row(
                            children: [
                              PopupMenuButton(
                                color: !provider.isDark ? Colors.blue : null,
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () =>
                                        pickImage(context, ImageSource.camera),
                                    child: Row(children: [
                                      const Icon(Icons.camera_alt_outlined),
                                      SizedBox(width: 10),
                                      Text("Take a picture"),
                                    ]),
                                  ),
                                  PopupMenuItem(
                                    onTap: () =>
                                        pickImage(context, ImageSource.gallery),
                                    child: Row(children: [
                                      const Icon(Icons.image_outlined),
                                      SizedBox(width: 10),
                                      Text("Select a picture"),
                                    ]),
                                  )
                                ],
                              ),
                              const Text(
                                "Add a Picture",
                                style: TextStyle(fontSize: 20),
                              ),
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
                          const SizedBox(height: 30),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              height: 100,
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller: provider.ingredientsController,
                                decoration: InputDecoration(
                                  labelText: 'Ingredients',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter ingredients';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              height: 100,
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller: provider.instructionsController,
                                decoration: InputDecoration(
                                  labelText: 'Instructions',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter instructions';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          ElevatedButton(
                            onPressed: () {
                              // Check if the form is valid
                              if (_formKey.currentState?.validate() ?? false) {
                                // Check if an image is selected
                                if (provider.image == null) {
                                  // If no image is selected, show an error message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Please add a photo before saving the recipe.'),
                                    ),
                                  );
                                } else {
                                  // If an image is selected, proceed to save the recipe
                                  provider.insertNewRecipe();
                                  provider.nameController.clear();
                                  provider.preparationTimeController.clear();
                                  provider.instructionsController.clear();
                                  provider.ingredientsController.clear();
                                  provider.image = null;
                                  print(
                                      "Recipe inserted. Trying to navigate back.");
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BottomNavBar(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Center(
                              child: Text("Save Recipe"),
                            ),
                          ),

                          // ElevatedButton(
                          //   onPressed: () {
                          //     if (_formKey.currentState?.validate() ?? false) {
                          //       provider.insertNewRecipe();
                          //       provider.nameController.clear();
                          //       provider.preparationTimeController.clear();
                          //       provider.instructionsController.clear();
                          //       provider.ingredientsController.clear();
                          //       provider.image = null;
                          //       print("Recipe inserted. Trying to navigate back.");
                          //       Navigator.pushReplacement(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => MainRecipeScreen()));

                          //       // Navigator.of(context).pop();
                          //     }
                          //   },
                          //   child: Center(
                          //     child: Text("Save Recipe"),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import '../../providers/recipe_provider.dart';

// class NewRecipeScreen extends StatefulWidget {
//   const NewRecipeScreen({super.key});

//   @override
//   State<NewRecipeScreen> createState() => _NewRecipeScreenState();
// }

// class _NewRecipeScreenState extends State<NewRecipeScreen> {
//   Future pickImage(BuildContext context, ImageSource source) async {
//     final image = await ImagePicker().pickImage(source: source);
//     if (image == null) return;

//     // ignore: deprecated_member_use
//     Provider.of<RecipeClass>(context, listen: false).image = File(image.path);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add New Recipe'),
//       ),
//       body: Consumer<RecipeClass>(
//         builder: (context, provider, child) => SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(5), // Adjust padding as needed
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: provider.nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Recipe Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextField(
//                   keyboardType: TextInputType.number,
//                   controller: provider.preparationTimeController,
//                   decoration: InputDecoration(
//                     labelText: 'preparationTime (mins)',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // Add more input fields or UI elements as needed
//                 Row(
//                   children: [
//                     PopupMenuButton(
//                         color: !Provider.of<RecipeClass>(context).isDark
//                             ? Colors.blue
//                             : null,
//                         itemBuilder: ((context) => [
//                               PopupMenuItem(
//                                 onTap: (() =>
//                                     pickImage(context, ImageSource.camera)),
//                                 child: Row(children: [
//                                   const Icon(Icons.camera_alt_outlined),
//                                   SizedBox(width: 10),
//                                   Text("Take a pikture"),
//                                 ]),
//                               ),
//                               PopupMenuItem(
//                                 onTap: (() =>
//                                     pickImage(context, ImageSource.gallery)),
//                                 child: Row(children: [
//                                   const Icon(Icons.image_outlined),
//                                   SizedBox(width: 10),
//                                   Text("select a pikture"),
//                                 ]),
//                               )
//                             ])),
//                     const Text(
//                       "Add a Picture",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),

//                 Visibility(
//                   visible: provider.image != null,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           provider.image = null;
//                           setState(() {});
//                         },
//                         child: Icon(
//                           Icons.cancel_outlined,
//                           color: Colors.red,
//                         ),
//                       ),
//                       provider.image != null
//                           ? Image.file(
//                               provider.image!,
//                               width: 100,
//                               height: 100,
//                             )
//                           : Container(),
//                     ],
//                   ),
//                 ),

//                 SizedBox(height: 30),

//                 SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: SizedBox(
//                     height: 100,
//                     child: TextField(
//                       expands: true,
//                       maxLines: null,
//                       controller: provider.ingredientsController,
//                       decoration: InputDecoration(
//                         labelText: 'ingredients',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),

//                 // SizedBox(height: 30),

//                 SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: SizedBox(
//                     height: 100,
//                     child: TextField(
//                       expands: true,
//                       maxLines: null,
//                       controller: provider.instructionsController,
//                       decoration: InputDecoration(
//                         labelText: 'instructions',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),

//                 SizedBox(height: 30),
//                 ElevatedButton(
//                   onPressed: () {
//                     provider.insertNewRecipe();
//                     provider.nameController.clear();
//                     provider.preparationTimeController.clear();
//                     provider.instructionsController.clear();
//                     provider.ingredientsController.clear();
//                     provider.image = null;
//                     Navigator.of(context).pop();
//                   },
//                   child: Center(
//                     child: Text("Save Recipe"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
