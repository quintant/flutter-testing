import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:myapp/Bot/classes/UserClass.dart';


class GuildMember {
  final User user;
  final dynamic nick;
  final dynamic roles;
  final dynamic joinedAt;
  final dynamic deaf;
  final dynamic mute;


  GuildMember({
    this.user,
    this.nick,
    this.roles,
    this.joinedAt,
    this.deaf,
    this.mute
  });
}




List<GuildMember> parseResponse(String responseBody) {
  final parsed = jsonDecode(responseBody);
  // final parsed = jsonDecode(responseBody);
  List<GuildMember> toRet = [];
  for (var i = 0; i< parsed.length; i++) {
    toRet.add(GuildMember(
      user: User.fromJson(parsed[i]['user']) ,
      nick: parsed[i]['nick'],
      roles: parsed[i]['roles'],
      joinedAt: parsed[i]['joined_at'],
      deaf: parsed[i]['deaf'],
      mute: parsed[i]['mute'],
    ));
  }
  return toRet;
}

Future<List<GuildMember>> fetchGuildMembersList(String token, guildID) async {
  final jParam = {
    'limit': '1000'
  };
  final response = await http.get(
    Uri.https('discord.com', '/api/v7/guilds/'+guildID+'/members', jParam),
    headers: {
      'Authorization': 'Bot ' + token,
    },

  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<GuildMember> toRet = parseResponse(response.body);
    return toRet;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
