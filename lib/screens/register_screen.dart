import 'package:ecommerce_final_project/auth/firebase_auth_services.dart';
import 'package:ecommerce_final_project/screens/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// import '../components/bottom_navigation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Start learning with create your account',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Username',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        hintText: 'Create your username',
                        prefixIcon: Icon(Icons.person_2_outlined),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Email or Phone Number',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        hintText: 'Enter your email or phone number',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: InputBorder.none),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8),
                  const PasswordField(),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      _signUp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 7, 154),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: _signUp,
                      child: const Text(
                        'Create Account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Center(
                    child: Text(
                      'Or using other method',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/G.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) {
                      //       return BottomNavigation();
                      //     },
                      //   ),
                      // );
                    },
                    // icon: const Icon(Icons.login, color: Colors.blue),
                    icon: Image.asset('assets/images/facebook.png', height: 24),
                    label: Text('Sign In with Facebook'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.grey),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully create");
      Navigator.pushNamed(context, '/home');
    } else {
      print("Some error happend");
    }
  }

//   Future<void> _loginWithFacebook() async {
//     try {
//       final LoginResult result = await FacebookAuth.instance.login();
//       if (result.status == LoginStatus.success) {
//         final AccessToken accessToken = result.accessToken!;
//         print('Access Token: ${accessToken.token}');
//         // Fetch user data
//         final userData = await FacebookAuth.instance.getUserData();
//         print('User Data: $userData');
//       } else {
//         print('Login failed: ${result.message}');
//       }
//     } catch (e) {
//       print('Error during login: $e');
//     }
//   }
}

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordController,
      obscureText: _obscureText,
      decoration: InputDecoration(
          hintText: 'Create your password',
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_outlined : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: InputBorder.none),
    );
  }
}
