import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../helpers//size_config.dart';
import '../widgets/elevated_gradient_button_widget.dart';
import '../widgets/background_one_widget.dart';
import '../helpers//decorated_app_bar.dart';

class CreateAccount extends StatefulWidget {
  static const routeName = '/create-account';
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
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
    if (!regExp.hasMatch(password!)) return 'Please enter a valid password. ';

    return null;
  }

  void submit() {
    final isValidForm = _formKey.currentState!.validate();

    if (isValidForm) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus(); //Close soft keyboard

      ///TODO: call command to create account
    }
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig _sizeConfig = SizeConfig(context);
    return SafeArea(
      child: Scaffold(
        appBar: DecoratedAppBar.appBar(
          context,
          'Create Account',
        ),
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
                inverted: true,
              ),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                          TextFormField(
                            key: ValueKey('password2'),
                            obscureText: true,
                            validator: validatePassword,
                            onSaved: (value) {
                              _userPassword = value;
                            },
                            decoration: InputDecoration(
                              //labelText: 'Password',
                              hintText: 'Password again:',
                            ),
                          ),
                          SizedBox(
                            height: _sizeConfig.safeBlockVertical * 4.0,
                          ),
                          ElevatedGradientButtonWidget(
                            text: 'Create Account',
                            onPressed: () {},
                            iconData: Icons.account_circle_rounded,
                          ),
                        ],
                      ),
                    ),
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
