import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/tracks.dart';
import './models/player.dart';
import './models/user.dart';
import './services/search_tracks_service.dart';
import './services/authentication_services.dart';
import './commands/base_command.dart' as Commands;
import 'commands/authentication_commands.dart';
import './views/helpers/theme_a.dart';
import 'views/screens/home_screen.dart';
import 'views/authentication/authentication_screen.dart';
import 'views/authentication/sign_up_confirmation_screen.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Tracks()),
        ChangeNotifierProvider(create: (_) => Player()),
        ChangeNotifierProvider(create: (_) => User()),
        Provider(create: (_) => SearchTracksService()),
        Provider(create: (_) => AuthenticationServices()),
      ],
      child: Builder(
        builder: (context) {
          Commands.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Music Player',
            theme: theme,
            home: Provider.of<User>(context, listen: true).isAuthenticated
                ? HomeScreen()
                : AuthenticationScreen(),
            // home: HomeScreen(),
            routes: {
              HomeScreen.routeName: (ctx) => HomeScreen(),
              AuthenticationScreen.routeName: (ctx) => AuthenticationScreen(),
              SignUpConfirmationScreen.routeName: (ctx) =>
                  SignUpConfirmationScreen(),
            },
          );
        },
      ),
    );
  }
}
