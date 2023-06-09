import 'package:being/providers/discomforts_provider.dart';
import 'package:being/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider(create: (context) => DiscomfortsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodySmall: TextStyle(color: Colors.white, letterSpacing: 0.2),
            bodyMedium: TextStyle(color: Colors.white, letterSpacing: 0.2),
            bodyLarge: TextStyle(color: Colors.white, letterSpacing: 0.2),
          ),
        ),
        home: Dashboard(),
      ),
    );
  }
}
