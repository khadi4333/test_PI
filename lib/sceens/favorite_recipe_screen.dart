import 'package:flutter/material.dart';
import '../providers/recipe_provider.dart';
import 'package:provider/provider.dart';
// import '../widgets/drowe.dart';
// import '../widgets/poup_menu_button.dart';
import '../widgets/recipe_widget.dart';
import 'search_recipe_screen.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  const FavoriteRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeClass>(
      builder: (BuildContext context, myProvider, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Recipes'),
                const SizedBox(height: 4),
                Text(
                  'Favorite Recipes:',
                  style: TextStyle(
                    fontSize: 16,
                    color: !myProvider.isDark
                        ? const Color.fromARGB(255, 244, 143, 177)
                        : null,
                  ),
                ),
              ],
            ),
            actions: [
              // To search in the favorite list
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchRecipeScreen(
                      recipes: myProvider.favoriteRecipes,
                    ),
                  ));
                },
                child: const Icon(Icons.search),
              ),

              // const MyPopupMenuButton(),
            ],
          ),
          // drawer: Drawer(
          //   child: DrawerList(),
          // ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio:
                  1.0, // Adjust this aspect ratio for equal width and height
            ),
            itemCount: myProvider.favoriteRecipes.length,
            itemBuilder: (context, index) {
              return RecipeWidget(myProvider.favoriteRecipes[index]);
            },
          ),
        );
      },
    );
  }
}
