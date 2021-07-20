import 'package:flutter/material.dart';
import 'package:quasar_music_player/views/screens/home_screen.dart';
import '../helpers//size_config.dart';
import '../helpers/elevated_gradient_button_widget.dart';
import '../helpers/background_one_widget.dart';
import '../helpers/message.dart';
import '../../commands/authentication_commands.dart';
import 'authentication_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isAuthenticating = false;
  var _userEmail;
  var _userPassword;

  void submit() async {
    final isValidForm = _formKey.currentState!.validate();
    bool success = false;

    if (isValidForm) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus(); //Close soft keyboard

      try {
        setState(() {
          _isAuthenticating = true;
        });

        // success =
        //     await AuthenticationCommands().signIn(_userEmail, _userPassword);

        setState(() {
          _isAuthenticating = false;
        });

        if (success)
          Navigator.pushNamed(context, HomeScreen.routeName);
        else
          Message.showErrorSnackBar(context,
              'Something went wrong. Create an account if you don\'t have one.');
      } catch (e) {
        setState(() {
          _isAuthenticating = false;
        });

        Message.showErrorSnackBar(context, e.toString());
      }
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
                  Colors.lightBlue.shade700,
                  Colors.lightBlue.shade800,
                  Colors.lightBlue.shade900
                ],
                containerColors: [
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
                        children: <Widget>[
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
                            onPressed: () {
                              submit();
                            },
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
                        Navigator.pushNamed(
                            context, AuthenticationScreen.routeName);
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
