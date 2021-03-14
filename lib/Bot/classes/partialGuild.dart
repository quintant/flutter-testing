import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';


class PartialGuild {
  final dynamic id;
  final dynamic name;
  final dynamic icon;
  final dynamic features;
  final dynamic isOwner;
  final dynamic permissions;


  PartialGuild({
    this.id,
    this.name,
    this.icon,
    this.features,
    this.permissions,
    this.isOwner
  });
}
List<PartialGuild> parseResponse(String responseBody) {
  final parsed = jsonDecode(responseBody);
  // final parsed = jsonDecode(responseBody);
  print(parsed);
  print(parsed.runtimeType);
  print(parsed.length);
  List<PartialGuild> toRet = [];
  for (var i = 0; i< parsed.length; i++) {
    toRet.add(PartialGuild(
      id: parsed[i]['id'],
      name: parsed[i]['name'],
      icon: parsed[i]['icon'],
    ));
  }
  print(toRet);
  print(toRet.runtimeType);

  return toRet;
}

Future<List<PartialGuild>> fetchPartialGuilds(String token) async {
  final response = await http.get(
    Uri.https('discord.com', '/api/v7/users/@me/guilds'),
    headers: {
      'Authorization': 'Bot ' + token,
    },

  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<PartialGuild> toRet = parseResponse(response.body);
    print('-------------------------------------');
    return toRet;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
