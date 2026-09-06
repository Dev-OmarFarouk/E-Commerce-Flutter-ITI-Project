import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            SizedBox(height: 40),
            CircleAvatar(
          radius: 42,
          backgroundColor: Color(0xff6055D8),
          child: Text(
            "i",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          SizedBox(height: 12),
          Center(
            child: Text(
              "name",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
            SizedBox(height: 42),

            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
              tileColor: Color(0xffF5F5F5),
              leading: Icon(Icons.person, color: Colors.black.withOpacity(0.75)),
              title: Text("Profile", style: TextStyle(color: Colors.black.withOpacity(0.85), fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff000000)),
            ),
            SizedBox(height: 16),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
              tileColor: Color(0xffF5F5F5),
              leading: Icon(Icons.settings, color: Colors.black.withOpacity(0.75)),
              title: Text("Setting", style: TextStyle(color: Colors.black.withOpacity(0.85), fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff000000)),
            ),
            SizedBox(height: 16),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
              tileColor: Color(0xffF5F5F5),
              leading: Icon(Icons.email, color: Colors.black.withOpacity(0.75)),
              title: Text("Contact", style: TextStyle(color: Colors.black.withOpacity(0.85), fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff000000)),
            ),
            SizedBox(height: 16),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
              tileColor: Color(0xffF8F7F7),
              leading: Icon(Icons.share, color: Colors.black.withOpacity(0.75)),
              title: Text("Share App", style: TextStyle(color: Colors.black.withOpacity(0.85), fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff000000)),
            ),
            SizedBox(height: 16),
            ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
              tileColor: Color(0xffF8F7F7),
              leading: Icon(Icons.help, color: Colors.black.withOpacity(0.75)),
              title: Text("Help", style: TextStyle(color: Colors.black.withOpacity(0.85), fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xff000000)),
            ),
            SizedBox(height: 240),
            Center(
                child: GestureDetector(
                  onTap: () {

                  },
                    child: Text("Sign Out", style: TextStyle(color: Color(0xffF55F1F), fontWeight: FontWeight.w600, fontSize: 16)))
            )

          ],
        ),
      ),
    );
  }
}
