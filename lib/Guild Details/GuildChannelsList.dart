import 'package:flutter/material.dart';
import 'package:myapp/Bot/classes/GuildChannels.dart';
import 'package:myapp/Bot/classes/guildMembersList.dart';

class GuildChannelsList extends StatefulWidget {
  final String token;
  final String guildID;
  GuildChannelsList({Key key, @required this.token, @required this.guildID}) : super(key: key);
  @override
  _GuildChannelsListState createState() => _GuildChannelsListState();
}

class _GuildChannelsListState extends State<GuildChannelsList> {
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
      future: fetchGuildChannelList(token, guildID),
      builder: (context, snapshot) {
        List<GuildChannel> channels = snapshot.data;
        if (!snapshot.hasData) {
          return Column(
            children: [
              Text('Loading', style: TextStyle(color: Colors.amber),),
              CircularProgressIndicator()
            ],
          );
        }
        return Container(
          child: RawScrollbar(
            isAlwaysShown: true,
            radius: Radius.circular(2),
            child: ListView.builder(
                itemCount: channels.length,
                itemBuilder: (context, mIndex) {
                  GuildChannel channel = channels[mIndex];
                  return Container(
                    height:
                    MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.only(bottom: 5, left: 5, top: 5, right: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(0x70, 30, 30, 30),
                    ),
                    child: InkWell(
                      onTap: (){},
                      hoverColor: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.black,
                      highlightColor: Colors.black,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              'https://cdn0.iconfinder.com/data/icons/30-hardware-line-icons/64/Server-512.png'
                            )

                          ),
                          Divider(indent: 10,),
                          Text(
                            channel.name,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Divider(indent: 3,),
                          Text(
                            channel.type == 0? 'Text': 'Voice',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 10
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}



