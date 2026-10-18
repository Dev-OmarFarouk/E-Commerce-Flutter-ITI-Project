import 'package:flutter/material.dart';
import 'package:graduation_project/feature/NavBar/NavBar.dart';
import 'package:graduation_project/feature/SignUp/SignUp.dart';

import '../../core/network/services/auth_services.dart';
import '../../core/resources/CheckBox.dart';
import '../../core/resources/PasswordTextField.dart';

class Login extends StatelessWidget {
  const Login ({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    final authService = AuthService();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Form(
          child: Builder(
            builder: (formContext) {
              return Padding(
                padding: const EdgeInsets.all(31.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Center(
                            child:
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Email"),
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
                                  const SizedBox(height: 25),
                                  const Text("Password"),
                                  const SizedBox(height: 7),
                                  PasswordTextField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    validator: authService.validatePassword, hintText: "Enter your password",
                                  ),
                                  Row(
                                    children: [
                                      CheckBox(),
                                      Text(
                                        "Remember me",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 13),
                                  SizedBox(
                                    height: 60,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (!Form.of(formContext).validate()) {
                                          return;
                                        }
                                        try {
                                          await authService.login(
                                            email: email,
                                            password: password,
                                          );
                                          if (!formContext.mounted) return;
                                          Navigator.of(formContext).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (_) => Navbar(),
                                            ),
                                          );
                                        } on AuthException catch (e) {
                                          ScaffoldMessenger.of(formContext)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(e.message),
                                            ),
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff6055D8),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don’t have an account? ",
                                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(formContext).push(
                                            MaterialPageRoute(
                                              builder: (_) =>
                                              const Signup(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Sign up",
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                  
                  
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
