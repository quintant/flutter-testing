import 'package:flutter/material.dart';
import 'package:myapp/Bot/botMain.dart';
import 'package:myapp/Guild%20Details/GuildMainChannels.dart';

import '../MyPageRoute.dart';


class GuildMenuBar extends StatefulWidget {
  final Guild currGuild;
  final String token;
  final int depth;
  GuildMenuBar({Key key, @required this.currGuild, @required this.token, @required this.depth}) : super(key: key);
  @override
  _GuildMenuBarState createState() => _GuildMenuBarState();
}

class _GuildMenuBarState extends State<GuildMenuBar> {
  Guild currGuild;
  String token;
  int depth;
  @override
  void initState() {
    super.initState();
    token = widget.token;
    depth = widget.depth;
  }

  @override
  Widget build(BuildContext context) {
    currGuild = widget.currGuild;
    if (currGuild == null) {
      return Expanded(child: Center(child: CircularProgressIndicator(),));
    }
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(0xf0, 30, 30, 30),
      ),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network('https://cdn.discordapp.com/icons/' +
                currGuild?.id +
                '/' +
                currGuild?.icon +
                '.png',
                errorBuilder:
                    (context, exception, stackTrace) {
                  return Image.network(
                      'https://e7.pngegg.com/pngimages/408/238/png-clipart-computer-icons-discord-logo-discord-purple-angle-thumbnail.png');
                },
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          Spacer(),
          Expanded(
            flex: 10,
            child: Text(
              currGuild?.name,
              style:
              TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (depth >0) {
                Navigator.pop(context);
              }
              else {
              Navigator.push(
                  context,
                  FadeRoute(
                      page: GuildMainChannels(token: token, guildID: currGuild.id, currGuild: currGuild,)
                  ));
              }
            },
            child: Text(depth == 0? 'View Channels': 'View Members'),
          ),
          Spacer(),
          ElevatedButton(
              onPressed: () {},
              child: Text('Something')
          ),
        ],
      ),
    );
  }
}
