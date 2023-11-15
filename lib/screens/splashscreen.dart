import 'package:doctocms/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   checkUserLoggedIn();
  // }

  // Future<void> checkUserLoggedIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? userToken =
  //       prefs.getString('userToken'); // Replace with your actual key
  //   final String? clinicId = prefs.getString('clinicId');
  //   final String? userId = prefs.getString('userId');
  //   final String? username = prefs.getString('username');

  //   // Delay for a few seconds for the splash screen effect
  //   await Future.delayed(const Duration(seconds: 3));
  //   const String token =
  //       "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
  //   if (userToken == token) {
  //     print(userToken);
  //     print(clinicId);
  //     print(userId);
  //     print(username);

  //     // User is logged in, navigate to the homepage
  //     // ignore: use_build_context_synchronously
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               Homepage(clinicId: 1.toString(), userId: 1.toString())),
  //     );
  //   } else {
  //     // User is not logged in, navigate to the login page
  //     // ignore: use_build_context_synchronously
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
  //   }
  // }
@override
  void initState() {
    super.initState();

    // Delay for a few seconds for the splash screen effect
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to the login screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        // You can add other widgets on top of the background image if needed.
      ),
    );
  }
}
