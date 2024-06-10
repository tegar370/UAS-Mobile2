import 'package:flutter/material.dart';

import '../util/ucolor.dart';
import 'register2_view.dart';

class Register1View extends StatelessWidget {
  Register1View({super.key});

  final firstNC = TextEditingController();
  final lastNC = TextEditingController();
  final phoneC = TextEditingController();
  final addressC = TextEditingController();
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
                  "Complete Profil",
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
                  controller: firstNC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    labelText: "First Name",
                    hintText: "Enter your first name",
                    suffixIcon: const Icon(Icons.person_outline),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: lastNC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    labelText: "Last Name",
                    hintText: "Enter your last name",
                    suffixIcon: const Icon(Icons.person_outline),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: phoneC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    labelText: "Phone Number",
                    hintText: "Enter your phone number",
                    suffixIcon: const Icon(Icons.phone_android_outlined),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: addressC,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    labelText: "Address",
                    hintText: "Enter your address",
                    suffixIcon: const Icon(Icons.location_on_outlined),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Register2View(
                          firstName: firstNC.text,
                          lastName: lastNC.text,
                          phone: phoneC.text,
                          address: addressC.text,
                        );
                      }));
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
