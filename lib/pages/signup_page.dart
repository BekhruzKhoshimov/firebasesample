
import 'package:firebasesample/pages/home_page.dart';
import 'package:firebasesample/pages/signin_page.dart';
import 'package:firebasesample/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  bool isLoading = false;

  void doSignUp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String cPassword = cPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) return;

    if (password != cPassword) return;

    setState((){
      isLoading = true;
    });

    await AuthService.signUpUser(email, password).then((value) => {
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
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20,),
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
                TextField(
                  controller: cPasswordController,
                  decoration: const InputDecoration(
                    hintText: "Confirm password",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: doSignUp,
                  child: const Text("Sign Up"),
                ),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
                  },
                  child: const Text("Sign In"),
                ),
              ],
            ),
            (isLoading) ?
            const Center(child: CircularProgressIndicator()) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
