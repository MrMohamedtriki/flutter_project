// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_project/screens/register.dart';
import 'package:flutter_project/shared/colors.dart';
import 'package:flutter_project/shared/contants.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  // signIn() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //   } on FirebaseAuthException catch (e) {
  //     showSnackBar(context, "ERROR :  ${e.code} ");
  //   }

  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;

    // final googleSignInProvider = Provider.of<GoogleSignInProvider>(context);
    return Scaffold(
        backgroundColor: mobileBackgroundColor,
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: const Text("Sign in"),
        ),
        body: Center(
            child: Padding(
          padding:widthScreen>600? EdgeInsets.symmetric(horizontal:widthScreen/4.0):const EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 64,
              ),
              TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextfield.copyWith(
                      hintText: "Enter Your Email : ",
                      suffixIcon: const Icon(Icons.email))),
              const SizedBox(
                height: 33,
              ),
              TextField(
                  controller: passwordController,
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
              const SizedBox(
                height: 33,
              ),
              ElevatedButton(
                onPressed: () async {
                  // await signIn();
                  // if (!mounted) return;
                  // // showSnackBar(context, "Done ... ");
                },
                style: ButtonStyle(
                  // backgroundColor: WidgetStateProperty.all(bTNgreen),
                  padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "Sign in",
                        style: TextStyle(fontSize: 19),
                      ),
              ),
              const SizedBox(
                height: 9,
              ),
              // TextButton(
              //   onPressed: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(
              //     //       builder: (context) => const ForgotPassword()),
              //     // );
              //   },
              //   child: const Text("Forgot password?",
              //       style: TextStyle(
              //           fontSize: 18, decoration: TextDecoration.underline)),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account?",
                      style: TextStyle(fontSize: 18)),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        );
                      },
                      child: const Text('sign up',
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline))),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              // SizedBox(
              //   width: 299,
              //   child: Row(
              //     children: const [
              //       Expanded(
              //           child: Divider(
              //         thickness: 0.6,
              //       )),
              //       Text(
              //         "OR",
              //         style: TextStyle(),
              //       ),
              //       Expanded(
              //           child: Divider(
              //         thickness: 0.6,
              //       )),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.symmetric(vertical: 27),
              //   child: GestureDetector(
              //     onTap: () {
              //       // googleSignInProvider.googlelogin();
              //     },
              //     child: Container(
              //       padding: const EdgeInsets.all(13),
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(
              //               // color: Colors.purple,
              //               color: const Color.fromARGB(255, 200, 67, 79),
              //               width: 1)),
              //       child: SvgPicture.asset(
              //         "assets/icons/google.svg",
              //         color: const Color.fromARGB(255, 200, 67, 79),
              //         height: 27,
              //       ),
              //     ),
              //   ),
              // ),
            ]),
          ),
        )));
  }
  
}
