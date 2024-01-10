import 'package:app_pi/data_repostory/dbHelper.dart';
import 'package:app_pi/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/recipe_provider.dart';
import 'sceens/favorite_recipe_screen.dart';
import 'sceens/main_recipe_screen.dart';
import 'sceens/new_recipe_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<RecipeClass>(create: (context) => RecipeClass()
      )],
      child: const InitApp(),
    );
  }
}


class InitApp extends StatelessWidget {
  const InitApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<RecipeClass>(context).isDark
          ? ThemeData.dark()
          : ThemeData(
              primarySwatch: Colors.blue,
              // scaffoldBackgroundColor: Colors.blue[200],
              dialogBackgroundColor: Colors.blue[200],
              primaryColor: Colors.blue[200],
            ),
      title: 'recipes',
      home:
      // SplashScreen(),
      const SafeArea(child: SplashPage()),
      routes: {
        '/favorite': (context) => const FavoriteRecipesScreen(),
        '/new_recipe': (context) => const NewRecipeScreen(),
        '/main_recipe': (context) => const MainRecipeScreen(),
      },
    );
  }
}
