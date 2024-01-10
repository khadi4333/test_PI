// // import 'package:flutter/material.dart';
// // // import 'package:fluttercookie/bottom_bar.dart';
// // // import 'package:fluttercookie/cookie_page.dart';

// // import 'bottom.dart';
// // import 'cookie_page.dart';

// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 3, vsync: this);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // appBar: AppBar(
// //       //   backgroundColor: Colors.white,
// //       //   elevation: 0.0,
// //       //   centerTitle: true,
// //       //   leading: IconButton(
// //       //     icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
// //       //     onPressed: () {},
// //       //   ),
// //       //   title: Text('Pickup',
// //       //       style: TextStyle(
// //       //           fontFamily: 'Varela',
// //       //           fontSize: 20.0,
// //       //           color: Color(0xFF545D68))),
// //       //   actions: <Widget>[
// //       //     IconButton(
// //       //       icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
// //       //       onPressed: () {},
// //       //     ),
// //       //   ],
// //       // ),
// //       body: ListView(
// //         padding: EdgeInsets.only(left: 20.0),
// //         children: [
// //           // SizedBox(height: 15.0),
// //           // Text('Categories',
// //           //     style: TextStyle(
// //           //         fontFamily: 'Varela',
// //           //         fontSize: 42.0,
// //           //         fontWeight: FontWeight.bold)),
// //           // SizedBox(height: 15.0),
// //           // TabBar(
// //           //     controller: _tabController,
// //           //     indicatorColor: Colors.transparent,
// //           //     labelColor: Color(0xFFC88D67),
// //           //     isScrollable: true,
// //           //     labelPadding: EdgeInsets.only(right: 45.0),
// //           //     unselectedLabelColor: Color(0xFFCDCDCD),
// //           //     tabs: [
// //           //       Tab(
// //           //         child: Text('Cookies',
// //           //             style: TextStyle(
// //           //               fontFamily: 'Varela',
// //           //               fontSize: 21.0,
// //           //             )),
// //           //       ),
// //           //       Tab(
// //           //         child: Text('Cookie cake',
// //           //             style: TextStyle(
// //           //               fontFamily: 'Varela',
// //           //               fontSize: 21.0,
// //           //             )),
// //           //       ),
// //           //       Tab(
// //           //         child: Text('Ice cream',
// //           //             style: TextStyle(
// //           //               fontFamily: 'Varela',
// //           //               fontSize: 21.0,
// //           //             )),
// //           //       )
// //           //     ]),
// //           Container(
// //               height: MediaQuery.of(context).size.height - 50.0,
// //               width: double.infinity,
// //               child: TabBarView(controller: _tabController, children: [
// //                 CookiePage(),
// //                 // CookiePage(),
// //                 // CookiePage(),
// //                 // CookiePage(),
// //               ])
// //               )
// //         ],
// //       ),
// //       // floatingActionButton: FloatingActionButton(
// //       //   onPressed: () {},
// //       //   backgroundColor: Color(0xFFF17532),
// //       //   child: Icon(Icons.fastfood),
// //       // ),
// //       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //       // bottomNavigationBar: BottomBar(),
// //     );
// //   }
// // }

// import 'package:app_pi/sceens/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../data_repostory/dbHelper.dart';
// import '../providers/recipe_provider.dart';
// import '../sceens/favorite_recipe_screen.dart';
// import '../sceens/main_recipe_screen.dart';
// import '../sceens/new_recipe_screens.dart';
// // import 'data_repostory/dbHelper.dart';
// // import 'providers/recipe_provider.dart';
// // import 'sceens/favorite_recipe_screen.dart';
// // import 'sceens/main_recipe_screen.dart';
// // import 'sceens/new_recipe_screens.dart';
// // import 'sceens/splash_screen.dart';

// // Corrected the import path

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DbHelper.dbHelper.initDatabase();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<RecipeClass>(create: (context) => RecipeClass())
//       ],
//       child: const InitApp(),
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
//               // primarySwatch: Colors.blue,
//               // scaffoldBackgroundColor: Colors.blue[200],
//               // dialogBackgroundColor: Colors.blue[200],
//               // primaryColor: Colors.blue[200],
//               ),
//       title: 'recipes',
//       home: const SplashScreen(),
//       routes: {
//         '/favorite': (context) => const FavoriteRecipesScreen(),
//         '/new_recipe': (context) => const NewRecipeScreen(),
//         '/main_recipe': (context) => const MainRecipeScreen(),
//       },
//     );
//   }
// }
