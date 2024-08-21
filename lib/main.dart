import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/Resources/auth_methods.dart';
import 'package:zoom_clone/Screens/home_screen.dart';
import 'package:zoom_clone/Screens/login_screen.dart';
import 'package:zoom_clone/Utils/colors.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom_Clone',
      theme: ThemeData.dark().copyWith(
       scaffoldBackgroundColor:  backgroundColor,
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home' : (context) => HomeScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasData){
            return HomeScreen();
          }

          return LoginScreen();

        },
      ),
    );
  }
}

