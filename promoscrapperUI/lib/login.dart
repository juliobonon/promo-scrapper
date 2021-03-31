import 'package:flutter/material.dart';
import 'services/auth.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum FormType { login, register }

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _repeatEmail = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();

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
      if (_formType == FormType.login) {
        String status = await context
            .read<Auth>()
            .signInWithEmailAndPassword(_email.text, _password.text);
        print('Status: ' + status);
      } else {
        String status = await context
            .read<Auth>()
            .createUserWithEmailandPassword(_email.text, _password.text);
        print('Status: ' + status);
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
      body: Center(
        child: SingleChildScrollView(
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
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildInputs() + buildButtons(),
                ),
              ],
            ),
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
          controller: _email,
          validator: (value) =>
              value.isEmpty ? 'Usuário não pode ser vazio.' : null,
        ),
        SizedBox(height: 10),
        TextFormField(
            decoration: InputDecoration(
              hintText: "Senha",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            controller: _password,
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
          controller: _email,
          validator: (value) {
            if (value.isEmpty) {
              return ('Email não pode ser vazio.');
            } else if (value != _repeatEmail.text) {
              return ('Emails não são iguais');
            }
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Digite seu e-mail novamente",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          controller: _repeatEmail,
          validator: (value) {
            if (value.isEmpty) {
              return ('Email não pode ser vazio.');
            } else if (value != _email.text) {
              return ('Emails não são iguais');
            }
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Senha",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          controller: _password,
          validator: (value) {
            if (value.isEmpty) {
              return ('Senha não pode ser vazio');
            } else if (value != _repeatPassword.text) {
              return ('Senhas não são iguais');
            }
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            hintText: "Digite sua senha novamente",
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          ),
          controller: _repeatPassword,
          validator: (value) {
            if (value.isEmpty) {
              return ('Senha não pode ser vazio');
            } else if (value != _password.text) {
              return ('Senhas não são iguais');
            }
          },
        ),
      ];
    }
  }

  List<Widget> buildButtons() {
    if (_formType == FormType.login) {
      return [
        SizedBox(height: 10),
        PromoButton(text: 'Login', function: validateAndSubmit),
        SizedBox(height: 10),
        PromoButton(text: 'Create an account', function: moveToRegister),
      ];
    } else {
      return [
        SizedBox(height: 10),
        PromoButton(text: 'Register', function: validateAndSubmit),
        SizedBox(height: 10),
        PromoButton(text: 'Already have an account?', function: moveToLogin),
      ];
    }
  }
}

class PromoButton extends StatelessWidget {
  PromoButton({@required this.text, this.function});

  final text;
  final function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        onPressed: function,
      ),
    );
  }
}
