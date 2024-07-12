import 'package:chat_app2/auth/auth_services.dart';
import 'package:chat_app2/components/button.dart';
import 'package:chat_app2/components/textfiled.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  //top to go to the Login screen
  final void Function()? onTape;

  RegisterScreen({
    super.key,
    required this.onTape,
  });

  //register method
  void register(BuildContext context) {
    final auth = AuthService();

    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        auth.createAccountWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Password don\'t match!'),
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
              'Les\'s create an account',
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

            // confirm pw textfield
            const SizedBox(height: 10),
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmpasswordController,
            ),

            // login button
            const SizedBox(height: 25),

            MyButton(
              text: ' Register',
              onTap: () {
                register(context);
              },
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Allready have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTape,
                  child: Text(
                    ' Login now',
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
