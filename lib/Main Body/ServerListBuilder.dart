import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/Bot/botMain.dart';
import 'package:myapp/Bot/classes/partialGuild.dart';
import 'package:nyxx/nyxx.dart';

Widget guildList(token) {
  return FutureBuilder(
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        //print('project snapshot data is: ${projectSnap.data}');
        return CircularProgressIndicator();
      }
      return ListView.builder(
        itemCount: projectSnap.data.length,
        itemBuilder: (context, index) {
          PartialGuild currGuild = projectSnap.data[index];
          return InkWell(
            onTap: () {},
            mouseCursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
                boxShadow: [BoxShadow(
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(5, 5),
                  color: Colors.black38
                )]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                          height: MediaQuery.of(context).size.height * 0.1,
                          image: NetworkImage('https://cdn.discordapp.com/icons/' +
                          currGuild.id +
                          '/' +
                          currGuild.icon +
                          '.png')),
                    ),
                  ),
                  Text(
                      currGuild.name,
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(currGuild.id)
                ],
              ),
            ),
          );
        },
      );
    },
    future: fetchPartialGuilds(token),
  );
}
