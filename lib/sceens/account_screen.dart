import 'package:app_pi/core/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ionicons/ionicons.dart';

import 'package:provider/provider.dart';
import 'package:get/get.dart';
import '../ThemeNotifier.dart';
import '../widgets/setting_item.dart';
import '../widgets/setting_switch.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

// bool _iconBool = false;
// IconData _iconLight = Icons.wb_sunny;
// IconData _iconDark = Icons.nights_stay;

// ThemeData _lightTheme = ThemeData(
//   primarySwatch: Colors.amber,
//   brightness: Brightness.light,
// );

// ThemeData _darkTheme = ThemeData(
//   primarySwatch: Colors.blue,
//   brightness: Brightness.dark,
// );

class _AccountScreenState extends State<AccountScreen> {
  String currentLanguage =
      "English"; // Initialisez-le avec la langue par défaut

  final List locale = [
    {'name': 'English', 'locale': Locale('en', 'An')},
    {'name': 'Arab', 'locale': Locale('en', 'Ar')},
    {'name': 'Français ', 'locale': Locale('en', 'Fr')},
  ];

  UpdateLang(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  builddialog(BuildContext context, String currentLanguage) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            backgroundColor: white,
            title: Text("choisi un language"),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            print(locale[index]['name']);
                            UpdateLang(locale[index]['locale']);
                            setState(() {
                              currentLanguage = locale[index]['name'];
                              // Mettez à jour la langue actuelle ici
                            });
                          },
                          child: Text(locale[index]['name'])),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      home: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Ionicons.chevron_back_outline),
        //   ),
        //   leadingWidth: 80,
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // const Text(
                //   "Account",
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // const SizedBox(height: 20),
// SizedBox(
//   width: double.infinity,
//   child: Row(
//     children: [
//       Image.asset("assets/avatar.png", width: 70, height: 70),
//       const SizedBox(width: 20),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "uytuy",
//             // widget.user.usrName, // Displaying user name
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//              "uytuy",
//             // widget.user.email, // Displaying user email
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.grey,
//             ),
//           )
//         ],
//       ),
//       const Spacer(),
//       ForwardButton(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => UserData(user: widget.user),
//             ),
//           );
//         },
//       )
//     ],
//   ),
// ),

                const SizedBox(height: 40),
                // const Text(
                //   "Settings",
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Language",
                  icon: Ionicons.earth,
                  bgColor: Colors.orange.shade100,
                  iconColor: Colors.orange,
                  value: currentLanguage,
                  onTap: () {
                    builddialog(context, currentLanguage);
                  },
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Notifications",
                  icon: Ionicons.notifications,
                  bgColor: Colors.blue.shade100,
                  iconColor: Colors.blue,
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                SettingSwitch(
                  title: "Dark Mode",
                  icon: Ionicons.moon,
                  bgColor: Colors.purple.shade100,
                  iconColor: Colors.purple,
                  value: context.watch<ThemeNotifier>().isDarkMode,
                  onTap: (value) {
                    context.read<ThemeNotifier>().toggleTheme();
                  },
                ),
                const SizedBox(height: 20),
                SettingItem(
                  title: "Help",
                  icon: Ionicons.nuclear,
                  bgColor: Colors.red.shade100,
                  iconColor: Colors.red,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const hany(),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _setTheme() {
  //   SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle.light.copyWith(
  //       statusBarColor: _iconBool ? Colors.black : Colors.white,
  //       statusBarIconBrightness: _iconBool ? Brightness.light : Brightness.dark,
  //       statusBarBrightness: _iconBool ? Brightness.light : Brightness.dark,
  //     ),
  //   );
  // }
}
