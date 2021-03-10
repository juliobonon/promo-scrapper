import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PromoScrapper",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 45),
              ),
              Text(
                "Products on sale aggregator",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Usuário",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                onSaved: (value) => _email = value,
                validator: (value) =>
                    value.isEmpty ? 'Usuário não pode ser vazio.' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Senha",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                  onSaved: (value) => _password = value,
                  validator: (value) =>
                      value.isEmpty ? 'Senha não pode ser vazio.' : null),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                child: Text("Login"),
                onPressed: validateAndSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
