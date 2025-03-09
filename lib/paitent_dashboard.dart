import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/patient_history_page.dart';
import 'package:flutter_application_1/patient_profile_page.dart';

class PatientDashboardPage extends StatelessWidget {
  final String username;
  final String email;

  // Assume these are passed when the patient logs in
  const PatientDashboardPage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Dashboard'),
      ),
      // Add the navigation drawer to the app
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    username,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Navigate to Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientProfilePage(
                      username: username,
                      email: email,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Health History'),
              onTap: () {
                // Navigate to Patient History Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientHistoryPage(village: {}),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Implement Logout functionality (navigate to Login page)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name: $username',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Patient History Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientHistoryPage(village: {}),
                  ),
                );
              },
              child: Text('View Health History'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Profile Page (for editing patient details)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientProfilePage(
                      username: username,
                      email: email,
                    ),
                  ),
                );
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 20),
            // SOS Button
            ElevatedButton(
              onPressed: () {
                // SOS Button functionality (you can trigger a notification or alert here)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("SOS Alert Sent!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('SOS - Emergency Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
