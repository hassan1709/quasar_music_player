import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helpers//size_config.dart';
import '../helpers/elevated_gradient_button_widget.dart';
import '../helpers/background_one_widget.dart';
import '../helpers/message.dart';
import '../../commands/authentication_commands.dart';
import '../../models/user_model.dart';
import '../authentication/authentication_screen.dart';

class SignUpConfirmationScreen extends StatefulWidget {
  static const routeName = '/confirmation-screen';
  @override
  _SignUpConfirmationState createState() => _SignUpConfirmationState();
}

class _SignUpConfirmationState extends State<SignUpConfirmationScreen> {
  bool _isLoading = false;
  TextEditingController _textController = TextEditingController();

  void submit() async {
    try {
      setState(() {
        _isLoading = true;
      });

      bool success = await context.read<AuthenticationCommands>().verifyEmail(
          context.read<UserModel>().email, _textController.text.trim());

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
                  Colors.lightBlue.shade900
                ],
                containerColors: [
                  Colors.lightBlue.shade900,
                  Colors.lightBlue.shade800,
                  Colors.lightBlue.shade700,
                ],
                inverted: false,
              ),
              if (_isLoading) Center(child: CircularProgressIndicator()),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: _textController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Confirmation Code:',
                          ),
                        ),
                        SizedBox(
                          height: _sizeConfig.safeBlockVertical * 4.0,
                        ),
                        ElevatedGradientButtonWidget(
                          text: 'Confirm',
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
              Positioned(
                width: _sizeConfig.safeAreaHorizontal,
                top: _sizeConfig.safeAreaVertical -
                    _sizeConfig.safeAreaVertical * 0.125,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AuthenticationScreen.routeName);
                      },
                      icon: Icon(Icons.login_rounded),
                      label: Text('Login'),
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
