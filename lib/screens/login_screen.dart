import 'package:chat_app2/auth/auth_services.dart';
import 'package:chat_app2/components/button.dart';
import 'package:chat_app2/components/textfiled.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  //email controller and password

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //top to go to the register screen
  final void Function()? onTape;

  LoginScreen({
    super.key,
    required this.onTape,
  });

  void login(BuildContext context) async {
    // auth service
    final authservice = AuthService();

    // try login
    try {
      authservice.signInWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
      );
    }

    // cathc errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // bool isTextClicked = false;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // login
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            // welcome message
            const SizedBox(height: 50),
            Text(
              'Welcome back, you\'ve been missed!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            //email textfield
            const SizedBox(height: 25),
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),

            // pw textfield
            const SizedBox(height: 10),
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),

            // login button
            const SizedBox(height: 25),

            MyButton(
              text: ' Longin',
              onTap: () => login(context),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTape,
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),

            //register now
          ],
        ),
      ),
    );
  }
}
