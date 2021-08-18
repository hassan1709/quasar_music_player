import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../commands/authentication_commands.dart';
import '../screens/home_screen.dart';
import 'authentication_screen.dart';
import 'splash_screen.dart';
import 'sign_up_confirmation_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<AuthenticationCommands>().authStateChanges,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting)
            return SplashScreen();
          if (userSnapshot.hasData) {
            if (context.read<AuthenticationCommands>().authenticationIsVerified)
              return HomeScreen();
            else
              return SignUpConfirmationScreen();
          }

          return AuthenticationScreen();
        });
  }
}
