import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/Bot/botMain.dart';
import 'package:myapp/Bot/classes/guildMembersList.dart';
import 'package:myapp/Guild%20Details/GuildMainMenuBar.dart';
import 'package:myapp/Guild%20Details/GuildMembersList.dart';

class GuildMain extends StatefulWidget {
  final String token;
  final String guildID;
  GuildMain({Key key, @required this.token, this.guildID}) : super(key: key);
  @override
  _GuildMainState createState() => _GuildMainState();
}

class _GuildMainState extends State<GuildMain> {
  String token;
  String guildID;

  @override
  void initState() {
    super.initState();
    token = widget.token;
    guildID = widget.guildID;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Server Info'),
          automaticallyImplyLeading: false,
          leadingWidth: 100,
          leading: TextButton(
            child: Text('Back'),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ),
        body: FutureBuilder(
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.none &&
                projectSnap.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container(child: CircularProgressIndicator());
            }
            Guild currGuild = projectSnap.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GuildMenuBar(currGuild: currGuild, token: token, depth: 0),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: GuildMembersList(token: token, guildID: guildID)
                  ),
                )
              ],
            );
          },
          future: fetchGuild(token, guildID),
        ),
      ),
    );
  }
}
