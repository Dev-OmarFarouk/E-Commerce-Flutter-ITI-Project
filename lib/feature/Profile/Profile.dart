import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/network/services/auth_services.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  
  @override
  Widget build(BuildContext context) {

    final email = FirebaseAuth.instance.currentUser?.email ?? '';
    final name = email.contains('@') ? email.split('@')[0] : email;
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            CircleAvatar(
              radius: 52,
              backgroundColor: Color(0xff6055D8),
              child: Text(
                initial,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const SizedBox(height: 22),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(
                        size: 30,
                        Icons.person,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(
                        size: 30,
                        Icons.settings,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      title: Text(
                        "Setting",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(
                        size: 30,
                        Icons.email,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      title: Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F7F7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(
                        size: 30,
                        Icons.share,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      title: Text(
                        "Share App",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF8F7F7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: Icon(
                        size: 30,
                        Icons.help,
                        color: Colors.black.withOpacity(0.75),
                      ),
                      title: Text(
                        "Help",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Sign out
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                onTap: () {
                  logout(context);
                },
                child: const Text(
                  "Sign Out",
                  style: TextStyle(
                    color: Color(0xffF55F1F),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}