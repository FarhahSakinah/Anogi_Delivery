import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/restaurant.dart';
import 'services/auth_gate.dart';
import 'themes/theme_provider.dart';
import 'pages/home_page.dart';        
import 'pages/login_page.dart';     

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anogi Delivery',
      theme: Provider.of<ThemeProvider>(context).themeData,


      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => LoginPage(onTap: () {
          Navigator.pushNamed(context, '/register');
        }),
      },

      home: const AuthGate(),
    );
  }
}
