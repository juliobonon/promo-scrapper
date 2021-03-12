import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class Login extends StatefulWidget {
  Login({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _LoginState createState() => _LoginState();
}

enum FormType { login, register }

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

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
        if (_formType == FormType.login) {
          User userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Signed in: ' + userId.uid);
        } else {
          User userId = await widget.auth
              .createUserWithEmailandPassword(_email, _password);
          print('Registered user: ' + userId.uid);
        }
        widget.onSignedIn();
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildInputs() + buildButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    if (_formType == FormType.login) {
      return [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Email",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
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
      ];
    } else {
      return [
        TextFormField(
          decoration: InputDecoration(
            hintText: "Email",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          onSaved: (email) => _email = email,
          validator: (email) =>
              email.isEmpty ? 'Usuário não pode ser vazio.' : null,
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Digite seu e-mail novamente",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          onSaved: (repeatEmail) => _email = repeatEmail,
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
        SizedBox(height: 10),
        TextFormField(
            decoration: InputDecoration(
              hintText: "Digite sua senha novamente",
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            onSaved: (value) => _password = value,
            validator: (value) =>
                value.isEmpty ? 'Senha não pode ser vazio.' : null),
      ];
    }
  }

  List<Widget> buildButtons() {
    if (_formType == FormType.login) {
      return [
        ElevatedButton(
          child: Text("Login"),
          onPressed: validateAndSubmit,
        ),
        ElevatedButton(
          child: Text("Crie uma conta!"),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        ElevatedButton(
          child: Text("Register"),
          onPressed: validateAndSubmit,
        ),
        ElevatedButton(
          child: Text("Already have an Account?"),
          onPressed: moveToLogin,
        ),
      ];
    }
  }
}
