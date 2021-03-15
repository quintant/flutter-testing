import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/Bot/botMain.dart';
import 'package:myapp/Bot/classes/partialGuild.dart';
import 'package:myapp/Guild%20Details/GuildMain.dart';

import '../MyPageRoute.dart';

Widget guildList(token) {
  return FutureBuilder(
    builder: (context, projectSnap) {
      if (projectSnap.connectionState == ConnectionState.none &&
          projectSnap.hasData == null) {
        //print('project snapshot data is: ${projectSnap.data}');
        return Expanded(child: Center(child: CircularProgressIndicator(),));

      }
      return ListView.builder(
        itemCount: projectSnap.data?.length,
        itemBuilder: (context, index) {
          PartialGuild currGuild = projectSnap.data[index];
          if (currGuild == null) {
            return Expanded(child: Center(child: CircularProgressIndicator(),));
          }
          return InkWell(
            onTap: () {Navigator.push(
                context,
                FadeRoute(
                    page: GuildMain(
                      token: token,
                      guildID: currGuild.id,
                    )));},
            mouseCursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(0xf0, 30, 30, 30),
              ),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Spacer(),
                  Expanded(
                    flex: 10,
                    child: Text(
                        currGuild.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
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