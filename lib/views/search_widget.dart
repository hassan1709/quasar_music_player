import 'package:flutter/material.dart';
import '../commands/search_tracks_commands.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final textFieldController = TextEditingController();
  bool isLoading = false;

  void performSearch(String artistName) async {
    setState(() {
      isLoading = true;
    });

    await SearchTracksCommands().run(artistName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).accentColor,
        ),
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.green[50],
            Colors.blue[50],
            Colors.red[50],
            Colors.purple[50],
          ],
        ),
      ),
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Search by artist',
                contentPadding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
              ),
            ),
          ),
          isLoading
              ? CircularProgressIndicator()
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    performSearch(textFieldController.text);
                  },
                ),
        ],
      ),
    );
  }
}