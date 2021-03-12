import 'package:flutter/material.dart';
import 'package:myapp/Bot/botMain.dart';
import 'package:nyxx/nyxx.dart';

Widget guildList(bot) {
  return ListView(
    children: List.generate(10, (index) =>
         Container(
        child: Text('Discord server'),
      )
    ),
  );
}
