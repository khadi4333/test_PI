import 'package:app_pi/data_repostory/dbHelper.dart';
import 'package:app_pi/localwString.dart';
import 'package:app_pi/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeNotifier.dart';
import 'providers/recipe_provider.dart';
import 'sceens/favorite_recipe_screen.dart';
import 'sceens/main_recipe_screen.dart';
import 'sceens/new_recipe_screens.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
        ChangeNotifierProvider<RecipeClass>(
          create: (context) => RecipeClass(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const InitApp(),
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<RecipeClass>(context).isDark
          ? ThemeData.dark()
          : ThemeData(
              // primarySwatch: Colors.red,
              // dialogBackgroundColor: Colors.blue[200],
              // primaryColor: Colors.blue[200],
            ),
      title: 'Recipes',
      home: SafeArea(child: SplashScreen()),
      routes: {
        '/favorite': (context) => const FavoriteRecipesScreen(),
        '/new_recipe': (context) => const NewRecipeScreen(),
        '/main_recipe': (context) => const MainRecipeScreen(),
      },
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DbHelper.dbHelper.initDatabase();
//   runApp(
//     ChangeNotifierProvider<ThemeNotifier>(
//       create: (_) => ThemeNotifier(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
//         useMaterial3: true,
//       ),
//       MultiProvider(
//       providers: [ChangeNotifierProvider<RecipeClass>(create: (context) => RecipeClass()
//       )],
//       child: const InitApp(),
//     );
//     );
//   }
// }

// class InitApp extends StatelessWidget {
//   const InitApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: Provider.of<RecipeClass>(context).isDark
//           ? ThemeData.dark()
//           : ThemeData(
//               primarySwatch: Colors.blue,
//               // scaffoldBackgroundColor: Colors.blue[200],
//               dialogBackgroundColor: Colors.blue[200],
//               primaryColor: Colors.blue[200],
//             ),
//       title: 'recipes',
//       home:
//           // SplashScreen(),
//           const SafeArea(child: SplashPage()),
//       routes: {
//         '/favorite': (context) => const FavoriteRecipesScreen(),
//         '/new_recipe': (context) => const NewRecipeScreen(),
//         '/main_recipe': (context) => const MainRecipeScreen(),
//       },
//     );
//   }
// }
