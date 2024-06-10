import 'package:ecommerce_final_project/components/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Login Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Please login with registered account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email or Phone Number',
                    prefixIcon: Icon(Icons.email_outlined),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    enabledBorder: InputBorder.none, // Menghilangkan border outline saat enabled
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    enabledBorder: InputBorder.none, // Menghilangkan border outline saat enabled
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return BottomNavigation();
                        },
                      ),
                    );
                  },
                  child: Text('Sign In'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    'Or using other method',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/images/google.png', height: 24),
                  label: Text('Sign In with Google'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('assets/images/facebook.png', height: 24),
                  label: Text('Sign In with Facebook'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
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
