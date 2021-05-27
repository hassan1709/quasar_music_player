import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_screen.dart';

import './models/tracks.dart';
import './models/player.dart';
import './services/search_tracks_service.dart';
import './commands/base_command.dart' as Commands;

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
            title: 'Music Player',
            theme: ThemeData(
              primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
              accentColor: Color.fromRGBO(64, 75, 96, .9),
              highlightColor: Colors.deepOrange,
              primaryTextTheme: TextTheme(
                headline1: TextStyle(
                  color: Colors.deepOrange,
                ),
                headline2: TextStyle(
                  color: Colors.deepOrange,
                ),
                headline3: TextStyle(
                  color: Colors.white60,
                ),
                headline4: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 12.0,
                ),
              ),
            ),
            home: HomeScreen(),
            routes: {},
          );
        },
      ),
    );
  }
}
