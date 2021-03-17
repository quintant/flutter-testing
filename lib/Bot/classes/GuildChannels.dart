import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class GuildChannel {
  final dynamic id;
  final dynamic type;
  final dynamic guildID;
  final dynamic position;
  final dynamic permissionOverWrites;
  final dynamic name;
  final dynamic topic;
  final dynamic nsfw;
  final dynamic lastMessageID;
  final dynamic bitrate;
  final dynamic userLimit;
  final dynamic rateLimitPerUser;
  final dynamic recipients;
  final dynamic icon;
  final dynamic ownerID;
  final dynamic applicationID;
  final dynamic parentID;
  final dynamic lastPinTimestamp;

  GuildChannel(
      {this.id,
      this.type,
      this.guildID,
      this.position,
      this.permissionOverWrites,
      this.name,
      this.topic,
      this.nsfw,
      this.lastMessageID,
      this.bitrate,
      this.userLimit,
      this.rateLimitPerUser,
      this.recipients,
      this.icon,
      this.ownerID,
      this.applicationID,
      this.parentID,
      this.lastPinTimestamp});
}

List<GuildChannel> parseResponse(String responseBody) {
  final parsed = jsonDecode(responseBody);
  // final parsed = jsonDecode(responseBody);
  List<GuildChannel> toRet = [];
  for (var i = 0; i < parsed.length; i++) {
    toRet.add(GuildChannel(
      id: parsed[i]['id'],
      type: parsed[i]['type'],
      guildID: parsed[i]['guild_id'],
      position: parsed[i]['position'],
      permissionOverWrites: parsed[i]['permission_overwrites'],
      name: parsed[i]['name'],
      topic: parsed[i]['topic'],
      nsfw: parsed[i]['nsfw'],
      lastMessageID: parsed[i]['last_message_id'],
      bitrate: parsed[i]['bitrate'],
      userLimit: parsed[i]['user_limit'],
      rateLimitPerUser: parsed[i]['rate_limit_per_user'],
      recipients: parsed[i]['recipients'],
      icon: parsed[i]['icon'],
      ownerID: parsed[i]['owner_id'],
      applicationID: parsed[i]['application_id'],
      parentID: parsed[i]['parent_id'],
      lastPinTimestamp: parsed[i]['last_pin_timestamp'],
    ));
  }
  return toRet;
}

Future<List<GuildChannel>> fetchGuildChannelList(String token, guildID) async {
  final jParam = {};
  final response = await http.get(
    Uri.https('discord.com', '/api/v7/guilds/' + guildID + '/channels'),
    headers: {
      'Authorization': 'Bot ' + token,
    },
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<GuildChannel> toRet = parseResponse(response.body);
    return toRet;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
