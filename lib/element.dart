import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../widgets/drowe.dart';
import '../widgets/poup_menu_button.dart';
import '../widgets/recipe_widget.dart';
import 'sceens/search_recipe_screen.dart';

class Elemnt extends StatelessWidget {
  const Elemnt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeClass>(
      builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio:
                1.0, // Adjust this aspect ratio for equal width and height
          ),
          itemCount: myProvider.allRecipes.length,
          itemBuilder: (context, index) {
            return RecipeWidget(myProvider.allRecipes[index]);
          },
        ),
      ),
    );
  }
}
