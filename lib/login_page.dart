import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_screen.dart';
import 'paitent_dashboard.dart'; // Import the Patient Dashboard

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _role; // "Doctor" or "Patient"

  void _login() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter both username and password")),
      );
      return;
    }

    if (_role == "Doctor") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else if (_role == "Patient") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PatientDashboardPage(
            username: _usernameController.text,
            email: 'patient@example.com', // You can add an actual email if needed
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a role")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true, // Hide password input
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: "Doctor",
                  groupValue: _role,
                  onChanged: (value) {
                    setState(() => _role = value.toString());
                  },
                ),
                Text("Doctor"),
                Radio(
                  value: "Patient",
                  groupValue: _role,
                  onChanged: (value) {
                    setState(() => _role = value.toString());
                  },
                ),
                Text("Patient"),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
