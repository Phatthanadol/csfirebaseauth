import 'package:auth_buttons/auth_buttons.dart';
import 'package:csfirebaseauth/services/auth_service.dart';
import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp( );
//   runApp(const MyApp());
// }

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _LoginFormKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _LoginFormKey,
        child: Column(
          children: [
            login(),
            registerbutton(),
            googlebutton(),
            googleSignOutButton(),
          ],
        ),
      )),
    );
  }

  Widget login() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please, Check your username!";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: password,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please, Check your password!";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
        ],
      ),
    );
  }

  Widget registerbutton() {
    return ElevatedButton(
      onPressed: () {
        registerUser(email.text, password.text);
      },
      child: Text('Register'),
    );
  }

  Widget googlebutton() {
    return Container(
      padding: EdgeInsets.all(25),
      child: GoogleAuthButton(
        onPressed: () {
          signInWithGoogle();
        },
        darkMode: false,
      ),
    );
  }

  Widget googleSignOutButton() {
    return SizedBox(
      width: 270,
      child: ElevatedButton(
        onPressed: () {
          googleSignOut();
        },
        child: Text('Google Sign Out'),
      ),
    );
  }
}
