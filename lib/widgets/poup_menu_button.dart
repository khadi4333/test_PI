import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../models/recipe_model.dart';
import '../providers/recipe_provider.dart';
class MyPopupMenuButton extends StatefulWidget {
  const MyPopupMenuButton({Key? key}) : super(key: key);

  @override
  State<MyPopupMenuButton> createState() => _MyPopupMenuButtonState();
}

class _MyPopupMenuButtonState extends State<MyPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeClass>(
      builder: (BuildContext context, myProvider,Widget? child) => 
     PopupMenuButton(
      color: !myProvider.isDark ? Colors.blue[100] : null,
      
      
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: const Text('Open menu'),
          ),
          const PopupMenuItem(
            child: Text('About'),
          ),
          PopupMenuItem(
            onTap: () => exit(0),
            child: Column(
              children: [
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.exit_to_app_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Exit'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
