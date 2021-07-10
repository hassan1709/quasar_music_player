import 'package:flutter/material.dart';
import '../helpers//size_config.dart';
import '../widgets/elevated_gradient_button_widget.dart';
import '../widgets/background_one_widget.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail;
  var _userPassword;

  void submit() {
    final isValidForm = _formKey.currentState!.validate();

    if (isValidForm) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus(); //Close soft keyboard

      ///TODO: call command to log in
    }
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizeConfig = SizeConfig(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              BackgroundOneWidget(
                featureColors: [
                  // Color.fromRGBO(17, 141, 163, 1.0),
                  // Color.fromRGBO(84, 184, 194, 1.0),
                  Colors.lightBlue.shade700,
                  Colors.lightBlue.shade800,
                  Colors.lightBlue.shade900
                ],
                containerColors: [
                  // Color.fromRGBO(232, 237, 249, 1.0),
                  // Color.fromRGBO(232, 237, 249, 1.0),
                  Colors.lightBlue.shade900,
                  Colors.lightBlue.shade800,
                  Colors.lightBlue.shade700,
                ],
                inverted: false,
              ),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            key: ValueKey('email'),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            enableSuggestions: false,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _userEmail = value;
                            },
                            decoration: InputDecoration(
                              //labelText: 'Email',
                              hintText: 'Email:',
                            ),
                          ),
                          SizedBox(
                            height: _sizeConfig.safeBlockVertical * 2.0,
                          ),
                          TextFormField(
                            key: ValueKey('password'),
                            obscureText: true,
                            onSaved: (value) {
                              _userPassword = value;
                            },
                            decoration: InputDecoration(
                              //labelText: 'Password',
                              hintText: 'Password:',
                            ),
                          ),
                          SizedBox(
                            height: _sizeConfig.safeBlockVertical * 4.0,
                          ),
                          ElevatedGradientButtonWidget(
                            text: 'Login',
                            onPressed: () {},
                            iconData: Icons.login_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                width: _sizeConfig.safeAreaHorizontal,
                top: _sizeConfig.safeAreaVertical -
                    _sizeConfig.safeAreaVertical * 0.125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.password_rounded),
                      label: Text('Forgot Password?'),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, CreateAccount.routeName);
                      },
                      icon: Icon(Icons.account_circle_rounded),
                      label: Text('Create Account'),
                      //child: Text('Create Account'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
