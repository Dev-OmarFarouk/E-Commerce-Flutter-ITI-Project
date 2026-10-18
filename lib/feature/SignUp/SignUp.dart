import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/network/services/auth_services.dart';
import '../../core/resources/PasswordTextField.dart';
import '../Login/Login.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';
    String confirmPassword = '';

    final authService = AuthService();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Form(
          child: Builder(
            builder: (formContext) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(31.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFF6055D8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 16),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Get Winter Discount",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),

                                Text(
                                  "20% Off",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                Text(
                                  "For Children",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),

                            Image.asset(
                              "assets/images/littleGirl.png",
                              height: 150,
                            ),
                            SizedBox(width: 16)
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Email Address",
                        style: TextStyle(
                          color: Color(0xff1E1B17),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        validator: authService.validateEmail,
                        decoration: InputDecoration(
                          hintText: "Enter you Email",
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6B7280),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6055D8),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6B7280),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6055D8),
                            ),
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0xff1E1B17),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),
                      PasswordTextField(
                        onChanged: (value) {
                          password = value;
                        },
                        validator: authService.validatePassword,
                        hintText: '*********',
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Confirm Password",
                        style: TextStyle(
                          color: Color(0xff1E1B17),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        obscureText: true,
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm password is required';
                          }
                          if (value != password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "*********",
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6B7280),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6055D8),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6B7280),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xff6055D8),
                            ),
                          ),
                          errorStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () async {
                          final isValid = Form.of(formContext).validate();
                          if (!isValid) {
                            return;
                          }
                          try {
                            await authService.signup(
                              email: email,
                              password: password,
                            );
                            await authService.logout();
                            if (!formContext.mounted) return;
                            Navigator.of(formContext).pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => const Login(),
                              ),
                            );
                          } on AuthException catch (e) {
                            ScaffoldMessenger.of(formContext).showSnackBar(
                              SnackBar(
                                content: Text(e.message),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff6055D8),
                          fixedSize: const Size.fromHeight(60),
                          side: const BorderSide(
                            color: Color(0xff6055D8),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.black.withOpacity(0.5)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(formContext).push(
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff000000),
                                ),


                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}