import 'package:flutter/material.dart';
import 'package:myapp/Bot/classes/guildMembersList.dart';

class GuildMembersList extends StatefulWidget {
  final String token;
  final String guildID;
  GuildMembersList({Key key, @required this.token, @required this.guildID}) : super(key: key);
  @override
  _GuildMembersListState createState() => _GuildMembersListState();
}

class _GuildMembersListState extends State<GuildMembersList> {
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
    return FutureBuilder(
      future: fetchGuildMembersList(token, guildID),
      builder: (context, snapshot) {
        List<GuildMember> members = snapshot.data;
        if (!snapshot.hasData) {
          return Text('Loading');
        }
        return Container(
          child: RawScrollbar(
            isAlwaysShown: true,
            radius: Radius.circular(2),
            child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, mIndex) {
                  GuildMember member = members[mIndex];
                  return Container(
                    height:
                    MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(bottom: 5, left: 5, top: 5, right: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(0x70, 30, 30, 30),
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://cdn.discordapp.com/avatars/' +
                                member.user?.id.toString() +
                                '/' +
                                member.user.avatar.toString() +
                                '.png',
                            errorBuilder:
                                (context, exception, stackTrace) {
                              return Image.network(
                                  'https://e7.pngegg.com/pngimages/408/238/png-clipart-computer-icons-discord-logo-discord-purple-angle-thumbnail.png');
                            },
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 10,
                          child: Text(
                            member.user.username,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}



