// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_task1/viewmodel/food_menu_viewmodel.dart';
// import 'ui/screens/food_menu_screen.dart';
//
//
// void main() {
//   runApp(
//     // Using MultiProvider in case we want to add other providers in the future
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => FoodMenuViewModel()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Food Menu',
//       home: const FoodMenuScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'viewmodel/food_menu_viewmodel.dart';
import 'ui/screens/food_menu_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodMenuViewModel()),
      ],
      child: MaterialApp(
        title: 'Food Menu App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const FoodMenuScreen(),
      ),
    );
  }
}

