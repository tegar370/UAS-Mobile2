import 'package:flutter/material.dart';
import 'package:tokoto/service/user_service.dart';

import '../util/ucolor.dart';
import 'bottom_nav.dart';

class Register2View extends StatelessWidget {
  Register2View({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
  });

  final String firstName;
  final String lastName;
  final String phone;
  final String address;

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
                  "Register Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Complete your details or continue\nwith social media",
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
                const SizedBox(height: 40),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    labelText: "Confirm Password",
                    hintText: "Re-Enter your password",
                    suffixIcon: const Icon(Icons.lock),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please re-enter your password";
                    }
                    if (value != passwordC.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        final userS = UserService();
                        await userS
                            .register(
                          firstName,
                          lastName,
                          emailC.text,
                          passwordC.text,
                          phone,
                          address,
                        )
                            .then(
                          (value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNav()),
                                (route) => false);
                          },
                        );
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Register Gagal"),
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
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "By continuing your confirm that you agree\nwith our Team and Condition",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
