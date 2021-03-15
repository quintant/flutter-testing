import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/Bot/botMain.dart';
import 'package:myapp/Bot/classes/guildMembersList.dart';
import 'package:myapp/Guild%20Details/GuildChannelsList.dart';
import 'package:myapp/Guild%20Details/GuildMainMenuBar.dart';
import 'package:myapp/Guild%20Details/GuildMembersList.dart';

class GuildMainChannels extends StatefulWidget {
  final String token;
  final String guildID;
  final Guild currGuild;
  GuildMainChannels(
      {Key key, @required this.token, this.guildID, this.currGuild})
      : super(key: key);
  @override
  _GuildMainState createState() => _GuildMainState();
}

class _GuildMainState extends State<GuildMainChannels> {
  String token;
  String guildID;
  Guild currGuild;
  @override
  void initState() {
    super.initState();
    token = widget.token;
    guildID = widget.guildID;
  }

  @override
  Widget build(BuildContext context) {
    currGuild = widget.currGuild;
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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GuildMenuBar(currGuild: currGuild, token: token, depth: 1,),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: GuildChannelsList(token: token, guildID: guildID)),
              )
            ],
          )),
    );
  }
}
