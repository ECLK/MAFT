import 'package:flutter/material.dart';
import 'package:tabulation/view_models/login_viewmodel.dart';

class LoginForm extends StatefulWidget {
  final LoginViewModel viewModel;

  LoginForm(this.viewModel);

  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void onUsernameChange() {
    widget.viewModel.validateUsername(_usernameController.text);
  }

  void onPasswordChange() {
    widget.viewModel.validatePassword(_passwordController.text);
  }

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(onUsernameChange);
    _passwordController.addListener(onPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: new Text(
              "Please login to continue",
              style: new TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          TextFormField(
            decoration: new InputDecoration(
              border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      new BorderSide(color: Color.fromRGBO(72, 121, 209, 1))),
              hintText: 'Username',
              labelText: 'Username',
              prefixIcon: const Icon(
                Icons.person,
                color: Color.fromRGBO(72, 121, 209, 1),
              ),
              prefixText: ' ',
              suffixText: ' ',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter username';
              }
              return null;
            },
            autofocus: true,
            controller: _usernameController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
            child: new TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        new BorderSide(color: Color.fromRGBO(72, 121, 209, 1))),
                labelText: 'Password',
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Color.fromRGBO(72, 121, 209, 1),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
              autofocus: true,
              controller: _passwordController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 0.0, left: 0.0),
            child: new SizedBox(
              width: double.infinity,
              height: 60.0,
              child: new RaisedButton(
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                color: Color.fromRGBO(72, 121, 209, 1),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  widget.viewModel.login(
                      widget.viewModel.username, widget.viewModel.password);
                  if (!_formKey.currentState.validate()) {
                  } else {}
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
