import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/signup/signup.dart';
import 'package:flutter_project/services/auth_service.dart';
import 'package:flutter_project/shared/colors.dart';
import 'package:flutter_project/shared/contants.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = false;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      // resizeToAvoidBottomInset: true,
      bottomNavigationBar: _signup(context),
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("Sign in"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              _emailAddress(),
              const SizedBox(
                height: 20,
              ),
              _password(),
              const SizedBox(
                height: 50,
              ),
              _signin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailAddress() {
    return Column(
      children: [
        TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            decoration: decorationTextfield.copyWith(
                hintText: "Enter Your Email : ",
                suffixIcon: const Icon(Icons.email))),
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            obscureText: isVisable ? false : true,
            decoration: decorationTextfield.copyWith(
                hintText: "Enter Your Password : ",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisable = !isVisable;
                      });
                    },
                    icon: isVisable
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)))),
      ],
    );
  }

  Widget _signin(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
        isLoading = true;
      });
        await AuthService().signin(
            email: _emailController.text,
            password: _passwordController.text,
            context: context);
            setState(() {
          isLoading = false;
        });
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text(
              "Sign In",
              style: TextStyle(fontSize: 19),
            ),
    );
  }

  Widget _signup(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account?",
                      style: TextStyle(fontSize: 18)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Signup()),
                        );
                      },
                      child: const Text('sign up',
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline))),
                ],
              ),
    );
  }
}
