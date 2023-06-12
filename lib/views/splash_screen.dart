import 'package:firebase_auth/firebase_auth.dart';
// import 'package:whole_choice_customer/consts/consts.dart';
// import 'package:whole_choice_customer/views/home-screens/home.dart';
// import 'package:whole_choice_customer/widget_common/applogo_widget.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../auth_screen/login_screen.dart';
import '../main.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Creating a Function For Changing Screen
  void initState() {
    super.initState();
    checkAuthStatus();
  }

  void checkAuthStatus() async {
    Future.delayed(const Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // User is already authenticated, navigate to MyHomePage
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (Route<dynamic> route) => false,
        );
      } else {
        return Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MyHomePage();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          const Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 300,
              )),
          // Using Velocity_x
          // 20.heightBox,
          // applogoWidget(),
          // 10.heightBox,
          // appname.text.fontFamily(bold).size(22).white.make(),
          // 5.heightBox,
          // appversion.text.white.make(),
          const Spacer(),
          // credits.text.white.fontFamily(semibold).make(), 30.heightBox
          // Our App Splash Screen is Completed
        ],
      ),
    );
  }
}
