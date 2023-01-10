
import 'package:firebasesample/pages/home_page.dart';
import 'package:firebasesample/pages/signin_page.dart';
import 'package:firebasesample/pages/signup_page.dart';
import 'package:firebasesample/service/auth_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    startPage();
    super.initState();
  }

  void startPage() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLogged = AuthService.isLoggedIn();
    if (isLogged) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(),
            Text("Firebase Sample", style: TextStyle(fontSize: 24),),
            Text("All right reserved"),
          ],
        ),
      ),
    );
  }
}
