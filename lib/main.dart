import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './models/user_model.dart';
import './models/tracks.dart';
import './models/player.dart';
import './services/search_tracks_service.dart';
import './commands/base_command.dart' as Commands;
import './commands/authentication_commands.dart';
import './views/helpers/theme_a.dart';
import 'views/screens/home_screen.dart';
import 'views/authentication/authentication_screen.dart';
import '../views/authentication/authentication_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        Provider(create: (_) => UserModel()),
        Provider(create: (_) => SearchTracksService()),
        Provider(create: (_) => AuthenticationCommands(FirebaseAuth.instance)),
        /*StreamProvider(
          create: (context) =>
              context.read<AuthenticationCommands>().authStateChanges,
          initialData: context.read<AuthenticationCommands>().currentUser,
        ),*/
      ],
      child: Builder(
        builder: (context) {
          Commands.init(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Music Player',
            theme: theme,
            home: AuthenticationWrapper(),
            routes: {
              HomeScreen.routeName: (ctx) => HomeScreen(),
              AuthenticationScreen.routeName: (ctx) => AuthenticationScreen(),
            },
          );
        },
      ),
    );
  }
}
