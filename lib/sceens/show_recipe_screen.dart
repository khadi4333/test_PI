import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recipe_provider.dart';
import '/models/recipe_model.dart';
import 'edit_recipe_screen.dart';

// class ShowRecipeScreen extends StatelessWidget {
//   final RecipeModel recipeModel;

//   ShowRecipeScreen({Key? key, required this.recipeModel}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RecipeClass>(
//       builder: (context, provider, child) => Scaffold(
//         appBar: AppBar(
//           actions: [
//             const SizedBox(width: 20),

//           ],
//         ),
//         body: ListView(
//           children: [
//             SizedBox(height: 25.0),
//             Padding(
//               padding: EdgeInsets.only(left: 20.0),
//               child: Text(
//                 'Annonce',
//                 style: TextStyle(
//                   fontFamily: 'Varela',
//                   fontSize: 42.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFF17532),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15.0),
//             Container(
//               margin: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 // color: !Provider.of<RecipeClass>(context).isDark
//                 //     ? Colors.blue
//                 //     : null,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               height: 170,
//               child: recipeModel.image == null
//                   ? const Center(
//                       child: CircleAvatar(
//                         radius: 40,
//                         backgroundImage: AssetImage('assets/cookiechoco.jpg'),
//                       ),
//                     )
//                   : Image.file(
//                       recipeModel.image!,
//                     ),
//             ),
            
//             SizedBox(height: 20.0),
//             Center(
//               child: Text(
//                 recipeModel.name,
//                 style: TextStyle(
//                   fontFamily: 'Varela',
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFF17532),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Center(
//               child: Text(
//                 recipeModel.ingredients,
//                 style: TextStyle(
//                   color: Color(0xFF575E67),
//                   fontFamily: 'Varela',
//                   fontSize: 24.0,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 50.0,
//                 child: Text(
//                   recipeModel.instructions,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: 'Varela',
//                     fontSize: 16.0,
//                     color: Color(0xFFB4B8B9),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 140.0),
//             Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 50.0,
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25.0),
//                   color: Color(0xFFF17532),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Add to cart',
//                     style: TextStyle(
//                       fontFamily: 'Varela',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class ShowRecipeScreen extends StatelessWidget {
  final RecipeModel recipeModel;

  ShowRecipeScreen({Key? key, required this.recipeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeClass>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                provider.nameController.text = recipeModel.name;
                provider.preparationTimeController.text =
                    recipeModel.preperationTime.toString();
                provider.ingredientsController.text = recipeModel.ingredients;
                provider.instructionsController.text = recipeModel.instructions;
                provider.image = recipeModel.image;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          EditRecipeScreen(recipeModel: recipeModel))),
                );
              },
              child: const Icon(Icons.edit),
            ),
            const SizedBox(width: 20),
            // Add more actions or buttons as needed

            InkWell(
              onTap: () {
                provider.deleteRecipe(recipeModel);
                Navigator.pop(context);
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Annonce',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                // color: !Provider.of<RecipeClass>(context).isDark
                //     ? Colors.blue
                //     : null,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 170,
              child: recipeModel.image == null
                  ? const Center(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/cookiechoco.jpg'),
                      ),
                    )
                  : Image.file(
                      recipeModel.image!,
                    ),
            ),
            // Hero(
            //   tag: recipeModel.image!.path,
            //   child: Image.asset(
            //     recipeModel.image!.path,
            //     height: 150.0,
            //     width: MediaQuery.of(context).size.width,
            //     fit: BoxFit.cover, // Use BoxFit.cover for better results
            //   ),
            // ),
            SizedBox(height: 20.0),
            Center(
              child: Text(
                recipeModel.name,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                recipeModel.ingredients,
                style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(
                  recipeModel.instructions,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color(0xFFB4B8B9),
                  ),
                ),
              ),
            ),
            SizedBox(height: 140.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xFFF17532),
                ),
                child: Center(
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}












// import 'package:flutter/material.dart';
// import '/models/recipe_model.dart';
// // import 'package:provider/provider.dart';
// // import '../../providers/recipe_provider.dart';
// // import 'edit_recipe_screen.dart';

// // import 'package: /material.dart';

// class ShowRecipeScreen extends StatelessWidget {
//   // final assetPath, cookieprice, cookiename;
//   final RecipeModel recipeModel;
//   ShowRecipeScreen({super.key, required this.recipeModel});

//   // ShowRecipeScreen({this.assetPath, this.cookieprice, this.cookiename});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.white,
//       //   elevation: 0.0,
//       //   centerTitle: true,
//       //   leading: IconButton(
//       //     icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
//       //     onPressed: () {
//       //       Navigator.of(context).pop();
//       //     },
//       //   ),
//       //   title: Text('Pickup',
//       //       style: TextStyle(
//       //           fontFamily: 'Varela',
//       //           fontSize: 20.0,
//       //           color: Color(0xFF545D68))),
//       //   actions: <Widget>[
//       //     IconButton(
//       //       icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
//       //       onPressed: () {},
//       //     ),
//       //   ],
//       // ),

//       body: ListView(children: [
//         SizedBox(height: 15.0),
//         Padding(
//           padding: EdgeInsets.only(left: 20.0),
//           child: Text('Anonce',
//               style: TextStyle(
//                   fontFamily: 'Varela',
//                   fontSize: 42.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFF17532))),
//         ),
//         SizedBox(height: 15.0),
//         Hero(
//             tag: recipeModel.image!.path,
//             child: Image.asset(recipeModel.image!.path,
//                 height: 150.0, width: 100.0, fit: BoxFit.contain)
//         ),
//         SizedBox(height: 20.0),
//         Center(
//           child: Text(recipeModel.name,
//               style: TextStyle(
//                   fontFamily: 'Varela',
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFF17532))),
//         ),
//         SizedBox(height: 10.0),
//         Center(
//           child: Text(recipeModel.name,
//               style: TextStyle(
//                   color: Color(0xFF575E67),
//                   fontFamily: 'Varela',
//                   fontSize: 24.0)),
//         ),
//         SizedBox(height: 20.0),
//         Center(
//           child: Container(
//             width: MediaQuery.of(context).size.width - 50.0,
//             child: Text(recipeModel.instructions,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontFamily: 'Varela',
//                     fontSize: 16.0,
//                     color: Color(0xFFB4B8B9))),
//           ),
//         ),
//         SizedBox(height: 20.0),
//         Center(
//             child: Container(
//                 width: MediaQuery.of(context).size.width - 50.0,
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25.0),
//                     color: Color(0xFFF17532)),
//                 child: Center(
//                     child: Text(
//                   'Add to cart',
//                   style: TextStyle(
//                       fontFamily: 'Varela',
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ))))
//       ]),

//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {},
//       //   backgroundColor: Color(0xFFF17532),
//       //   child: Icon(Icons.fastfood),
//       // ),
//       // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       // bottomNavigationBar: BottomBar(),
//     );
//   }
// }


// class ShowRecipeScreen extends StatelessWidget {
//   final RecipeModel recipeModel;

//   ShowRecipeScreen({super.key, required this.recipeModel});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RecipeClass>(
//       builder: (context, provider, child) => Scaffold(
//         appBar: AppBar(
//           actions: [
//             InkWell(
//               onTap: () {
//                 provider.nameController.text = recipeModel.name;
//                 provider.preparationTimeController.text =
//                     recipeModel.preperationTime.toString();
//                 provider.ingredientsController.text = recipeModel.ingredients;
//                 provider.instructionsController.text = recipeModel.instructions;
//                 provider.image = recipeModel.image;
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: ((context) =>
//                           EditRecipeScreen(recipeModel: recipeModel))),
//                 );
//               },
//               child: const Icon(Icons.edit),
//             ),
//             const SizedBox(width: 20),
//             // Add more actions or buttons as needed

//             InkWell(
//               onTap: () {
//                 provider.deleteRecipe(recipeModel);
//                 Navigator.pop(context);
//               },
//               child: const Icon(Icons.delete),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   // color: !Provider.of<RecipeClass>(context).isDark
//                   //     ? Colors.blue
//                   //     : null,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 height: 170,
//                 child: recipeModel.image == null
//                     ? const Center(
//                         child: CircleAvatar(
//                           radius: 40,
//                           backgroundImage: AssetImage('assets/cookiechoco.jpg'),
//                         ),
//                       )
//                     : Image.file(
//                         recipeModel.image!,
//                       ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     recipeModel.name,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: !Provider.of<RecipeClass>(context).isDark
//                         ? Colors.blue
//                         : null,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   children: [
//                     Text("Preparation Time"),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text('${recipeModel.preperationTime} mins')
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: !Provider.of<RecipeClass>(context).isDark
//                         ? Colors.blue
//                         : null,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     Text("Ingredients"),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(recipeModel.ingredients)
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: !Provider.of<RecipeClass>(context).isDark
//                         ? Colors.blue
//                         : null,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     Text("instructions"),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(recipeModel.instructions)
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
