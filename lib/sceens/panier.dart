import 'package:app_pi/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../widgets/recipe_widget.dart';

class AcheterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final recipeProvider = Provider.of<RecipeModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Recettes Acheter'),
        ),
        body: 
        
           Consumer<RecipeClass>(
                builder: (BuildContext context, myProvider, Widget? child) {
                  return GridView.builder(
                    gridDelegate:
                     SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: myProvider.Acheter.length,
                    itemBuilder: (context, index) {
                      return RecipeWidget(myProvider.Acheter[index]);
                    },
                  );
                },
              ),
        );
  }
}
