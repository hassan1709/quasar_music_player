import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import '../helpers/message.dart';
import '../helpers//size_config.dart';
import '../helpers/elevated_gradient_button_widget.dart';
import '../helpers/background_one_widget.dart';
import '../helpers//decorated_app_bar.dart';
import '../../commands/authentication_commands.dart';
import 'sign_up_confirmation_screen.dart';
import '../screens/home_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  static const routeName = '/create-account';
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoginMode = true;
  bool _isLoading = false;
  var _userEmail;
  var _userPassword;
  var _userName;

  String? validateName(String? name) {
    if (name == '') return 'Please enter your full name';
    return null;
  }

  String? validateEmail(String? email) {
    if (!EmailValidator.validate(email!))
      return 'Please enter a valid email address.';
    return null;
  }

  String? validatePassword(String? password) {
    //     r'^
    //   (?=.*[A-Z])       // should contain at least one upper case
    //   (?=.*[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])      // should contain at least one digit
    //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    //   .{8,}             // Must be at least 8 characters in length
    // $
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(password!)) {
      Message.showErrorSnackBar(context,
          'Password needs to be at least 8 characters long, 1 upper case, 1 lower case, 1 digit and 1 special character');
      return 'Please enter a valid password.  ';
    }

    return null;
  }

  void signUp() async {
    final isValidForm = _formKey.currentState!.validate();
    bool success = false;

    if (isValidForm) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus(); //Close soft keyboard

      try {
        setState(() {
          _isLoading = true;
        });
        print('_userName: $_userName');
        print('_userEmail: $_userEmail');
        print('_userPassword: $_userPassword');

        success = await AuthenticationCommands()
            .signUp(_userName, _userEmail, _userPassword);

        setState(() {
          _isLoading = false;
        });

        if (success) {
          Navigator.of(context)
              .pushReplacementNamed(SignUpConfirmationScreen.routeName);
        } else
          Message.showErrorSnackBar(context, 'Something went wrong.');
      } catch (e) {
        setState(() {
          _isLoading = false;
        });

        Message.showErrorSnackBar(context, e.toString());
      }
    }
  }

  void signIn() async {
    _formKey.currentState!.save();
    FocusScope.of(context).unfocus(); //Close soft keyboard

    try {
      setState(() {
        _isLoading = true;
      });
      print('_userEmail: $_userEmail');
      print('_userPassword: $_userPassword');

      await AuthenticationCommands().signIn(_userEmail, _userPassword);

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      Message.showErrorSnackBar(context, e.toString());
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
                  Colors.lightBlue.shade900,
                ],
                containerColors: [
                  Colors.lightBlue.shade900,
                  Colors.lightBlue.shade800,
                  Colors.lightBlue.shade700,
                ],
                inverted: false,
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
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
                          if (!_isLoginMode)
                            TextFormField(
                              key: ValueKey('name'),
                              autocorrect: false,
                              textCapitalization: TextCapitalization.words,
                              enableSuggestions: true,
                              keyboardType: TextInputType.name,
                              validator: validateName,
                              onSaved: (value) {
                                _userName = value;
                              },
                              decoration: InputDecoration(
                                //labelText: 'Email',
                                hintText: 'Full name:',
                              ),
                            ),
                          if (!_isLoginMode)
                            SizedBox(
                              height: _sizeConfig.safeBlockVertical * 2.0,
                            ),
                          TextFormField(
                            key: ValueKey('email'),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            enableSuggestions: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
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
                            validator: validatePassword,
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
                            onPressed: () {
                              _isLoginMode ? signIn() : signUp();
                            },
                            text: _isLoginMode ? 'Login' : 'Create Account',
                            iconData: _isLoginMode
                                ? Icons.login_rounded
                                : Icons.account_circle_rounded,
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
                      icon: Icon(
                        _isLoginMode
                            ? Icons.password_rounded
                            : Icons.redo_rounded,
                      ),
                      label: Text(
                        _isLoginMode ? 'Forgot Password?' : 'Resend Code',
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          _isLoginMode = !_isLoginMode;
                        });
                      },
                      icon: Icon(
                        _isLoginMode
                            ? Icons.account_circle_rounded
                            : Icons.login_rounded,
                      ),
                      label: Text(
                        _isLoginMode ? 'Create Account' : 'Login',
                      ),
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
