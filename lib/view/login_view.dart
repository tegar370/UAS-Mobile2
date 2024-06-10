// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tokoto/service/user_service.dart';
import 'package:tokoto/util/token.dart';
import 'package:tokoto/widgets/loading_dialog.dart';

import '../util/ucolor.dart';
import 'bottom_nav.dart';
import 'register1_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailC = TextEditingController();

  final passwordC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password\nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                TextFormField(
                  controller: emailC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    labelText: "Email",
                    hintText: "Enter your email",
                    suffixIcon: const Icon(Icons.email_outlined),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: passwordC,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: const Icon(Icons.lock),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (_) {}),
                    const Text("Remember me"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        showDialog(
                          context: context,
                          builder: (context) => const LoadingDialog(),
                        );

                        final userS = UserService();
                        await userS
                            .login(
                          emailC.text,
                          passwordC.text,
                        )
                            .then((value) {
                          token = value;
                          print(token);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BottomNav(),
                            ),
                            (route) => false,
                          );
                        });
                      } catch (e) {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Login Gagal"),
                            content: Text(e.toString()),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: UColor.primary,
                    shape: const StadiumBorder(),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width - 100, 60),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Register1View();
                        }));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: UColor.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
