import 'package:app_pi/ThemeNotifier.dart';
import 'package:app_pi/page/home_page.dart';
import 'package:app_pi/sceens/favorite_recipe_screen.dart';
import 'package:app_pi/sceens/new_recipe_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/color.dart';
import '../data/bottom_menu.dart';
import '../sceens/account_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PageController pageController = PageController();
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      home: Scaffold(
        body: PageView.builder(
          itemCount: child.length,
          controller: pageController,
          onPageChanged: (value) => setState(() => selectIndex = value),
          itemBuilder: (itemBuilder, index) {
            return Container(
              child: child[index],
            );
          },
        ),
        // Elemnt(),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: SizedBox(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; bottomMenu.length > i; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        pageController.jumpToPage(i);
                        selectIndex = i;
                      });
                    },
                    child: Image.asset(
                      bottomMenu[i].imagePath,
                      color: selectIndex == i ? green : grey.withOpacity(0.5),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> child = [
  const HomePage(),
  const FavoriteRecipesScreen(),
  const NewRecipeScreen(),
  // Container(
  //   child: Text("Texte centré - Page 3", textAlign: TextAlign.center),
  //   color: white,
  //   alignment: Alignment.center,
  // ),
  Container(
    child: Text("Texte centré - Page 4", textAlign: TextAlign.center),
    color: white,
    alignment: Alignment.center,
  ),
  const AccountScreen()
  // Container(
  //   child: Text("Texte centré - Page 5", textAlign: TextAlign.center),
  //   color: white,
  //   alignment: Alignment.center,
  // ),
];
