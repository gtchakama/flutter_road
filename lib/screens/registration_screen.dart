import 'package:flutter/material.dart';
import 'package:flutter_road/utils/authentication_array.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your username',
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _username = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email address',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email address.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _email = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter a password with at least 6 characters',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 6) {
                    return 'Please enter a password with at least 6 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _password = value!;
                  });
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AuthenticationArray.addUser(_username, _email, _password);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Registration successful'),
                            content: const Text(
                                'Your account has been created. You can now log in.'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.popUntil(
                                      context, ModalRoute.withName('/'));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
