import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/tracks.dart';
import './models/player.dart';
import './services/search_tracks_service.dart';
import './commands/base_command.dart' as Commands;
import './views/helpers/theme_a.dart';
import 'views/screens/home_screen.dart';
import 'views/authentication/login_screen.dart';
import 'views/authentication/create_account_screen.dart';

void main() {
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
        Provider(create: (_) => SearchTracksService()),
      ],
      child: Builder(
        builder: (context) {
          Commands.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Quasar Music Player',
            theme: theme,
            home: LoginScreen(),
            // home: HomeScreen(),
            routes: {
              HomeScreen.routeName: (ctx) => HomeScreen(),
              CreateAccount.routeName: (ctx) => CreateAccount(),
            },
          );
        },
      ),
    );
  }
}
