import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '../widgets/drowe.dart';
import '../widgets/poup_menu_button.dart';
import '../widgets/recipe_widget.dart';
import 'search_recipe_screen.dart';
class MainRecipeScreen extends StatelessWidget {
  const MainRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeClass>(
      builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
        appBar: AppBar(
          title: const Text('My Recipes'),
          actions: [
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchRecipeScreen(recipes: myProvider.allRecipes),
              )),
              child: const Icon(Icons.search),
            ),
            const MyPopupMenuButton(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() async {
            await Navigator.pushNamed(context, "/new_recipe");
          }),
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(
          backgroundColor: myProvider.isDark ? Colors.blue[208] : null,
          child: const DrawerList(),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0, // Adjust this aspect ratio for equal width and height
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

// class MainRecipeScreen extends StatelessWidget {
//   const MainRecipeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RecipeClass>(
//       builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
//         appBar: AppBar(
//           title: const Text('My Recipes'),
//           actions: [
//             InkWell(
//               onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) =>
//                     SearchRecipeScreen(recipes: myProvider.allRecipes),
//               )),
//               child: const Icon(Icons.search),
//             ),
//             const MyPopupMenuButton(),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (() async {
//             await Navigator.pushNamed(context, "/new_recipe");
//           }),
//           child: const Icon(Icons.add),
//         ),
//         drawer: Drawer(
//           backgroundColor: myProvider.isDark ? Colors.blue[208] : null,
//           child:const DrawerList(),
//         ),
//         body: ListView.builder(
//           itemCount: myProvider.allRecipes.length,
//           itemBuilder: (context, index) {
//             return RecipeWidget(myProvider.allRecipes[index]);
//           },
//         ),
//       ),
//     );
//   }
// }
