import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Effectuez ici des opérations d'initialisation si nécessaire, comme le chargement de données, l'initialisation de services, etc.
    // Vous pouvez ajouter une durée de temporisation pour simuler un écran de démarrage
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 240, 135),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/car.png', // Assurez-vous d'ajuster le chemin de votre image
              width: 200, // Ajustez la taille de l'image selon vos besoins
            ),
            SizedBox(height: 20),
            Text(
              'Votre Application d\'Annonces de Voitures',
              style: TextStyle(
                color: Colors
                    .white, // Utilisez Colors.white pour la couleur du texte
                fontSize: 18,
                fontFamily: 'BlackOpsOne',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const SizedBox(height: 25),
//           const Text(
//             'Let\'s plant with us',
//             style: TextStyle(
//               fontSize: 22.0,
//               letterSpacing: 1.8,
//               fontWeight: FontWeight.w900,
//             ),
//           ),
//           const SizedBox(height: 5),
//           const Text(
//             'Bring nature home',
//             style: TextStyle(
//               color: grey,
//               fontSize: 16,
//               letterSpacing: 1.8,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(
//             height: 450,
//             width: 450,
//             child: Image.asset('assets/images/Asset1.png'),
//           ),
//           const SizedBox(height: 25),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (builder) => const BottomNavBar()));
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 80.0,
//                 vertical: 12.0,
//               ),
//               decoration: BoxDecoration(
//                 color: green,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: const Text(
//                 'Sign In',
//                 style: TextStyle(
//                   color: white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Create an account',
//               style: TextStyle(
//                 color: black.withOpacity(0.7),
//                 fontSize: 16,
//                 letterSpacing: 1,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Forgot Password?',
//               style: TextStyle(
//                 color: black.withOpacity(0.4),
//                 letterSpacing: 1,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
