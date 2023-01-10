
import 'package:firebasesample/pages/signup_page.dart';
import 'package:firebasesample/service/auth_service.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void doSignIn() async {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    await AuthService.signInUser(email, password).then((value) => {
      if (value != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage())),
      }
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "email",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: doSignIn,
                  child: const Text("Sign In"),
                ),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
                  child: const Text("Sign Up"),
                ),
              ],
            ),
            (isLoading) ?
            const Center(
              child: CircularProgressIndicator(),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
