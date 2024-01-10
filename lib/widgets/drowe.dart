import 'package:flutter/material.dart';
import '../providers/recipe_provider.dart';
import 'package:provider/provider.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeClass>(
      builder: (BuildContext context, myProvider, Widget? child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: !myProvider.isDark ? Colors.blue[100] : null,
            // Use theme color instead
            child: const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/cookiechoco.jpg'),
                radius: 50,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(
              Icons.home,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushNamed(context, "/main_recipe");
            },
          ),
          ListTile(
            title: Text('Favorite Recipes'),
            leading:  Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.pushNamed(context, "/favorite");
            },
          ),

          Divider(
            thickness: 1,
          ),
          ListTile(
            title: const Text('Shopping'),
            leading: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pushNamed(context, "/shopping");
            },
          ),
          Divider(
            thickness: 1,
          ),

          Provider.of<RecipeClass>(context).isDark
              ? ListTile(
                  title: const Text('Light Mode'),
                  leading: const Icon(
                    Icons.light_mode_outlined,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Provider.of<RecipeClass>(context, listen: false)
                        .changeIsDark();
                    Navigator.pop(context);
                  },
                )
              : ListTile(
                  title: const Text('Dark Mode'),
                  leading: const Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Provider.of<RecipeClass>(context, listen: false)
                        .changeIsDark();
                    Navigator.pop(context);
                  },
                ),

          // Add more ListTile items as needed
        ],
      ),
    );
  }
}
