import 'package:flutter/material.dart';
import 'package:geopulse/Backend/authentication.dart';
import 'package:geopulse/Frontend/Components/my_button.dart';
import 'package:geopulse/Frontend/Components/my_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class MySignIn extends StatefulWidget {
  const MySignIn({super.key});

  @override
  State<MySignIn> createState() => _MySignInState();
}

class _MySignInState extends State<MySignIn> {
  
  bool isPasswordtype = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),

                Text(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),

                // Email Textfield
                MyTextfield(
                  icon: const Icon(Icons.person),
                  controller: emailController,
                  hintText: "Enter Your Email",
                  labelText:"Email",
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),
                // Password Textfield
                MyTextfield(
                  icon: const Icon(Icons.lock),
                  controller: passwordController,
                  hintText: 'Enter Your Password',
                  labelText: "Password",
                  obscureText: isPasswordtype,
                  suffix: togglePassword(),
                ),

                const SizedBox(
                  height: 20,
                ),

                // button
                MyButton(
                  text: 'Sign In',
                  ontap: () async {

                    await login(emailController.text, passwordController.text, context);
                  },
                ),

                const SizedBox(
                  height: 10,
                ),

                // Forget Password
                SizedBox(
                  width: 300,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password ?',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        iconSize: 20,
        color: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () {
          setState(() {
            isPasswordtype = !isPasswordtype;
          });
        },
        icon: isPasswordtype
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off));
  }
}
