import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Guild {
  final String id;
  final String name;
  final String icon;
  final String description;
  final void splash;
  final void discoverySplash;
  final int aproxMemberCount;
  final int aproxPresenceCount;
  final List features;
  final List emojis;
  final String banner;
  final String ownerID;
  final void applicationID;
  final String region;
  final void afkChannelID;
  final void afkTimeout;
  final void systemChannelID;
  final bool widgetEnabled;
  final void widgetChannelID;
  final int verificationLevel;
  final List roles;
  final int defaultMessageNotifications;
  final int mfaLevel;
  final int explicitContentFilter;
  final int maxPresences;
  final int maxMembers;
  final String vanityUrlCode;
  final int premiumTier;
  final int premiumSubscriptionCount;
  final int systemChannelFlags;
  final String preferredLocale;
  final String rulesChannelID;
  final String publicUpdatesChannelID;

  Guild(
      {this.id,
      this.name,
      this.icon,
      this.description,
      this.splash,
      this.discoverySplash,
      this.aproxMemberCount,
      this.aproxPresenceCount,
      this.features,
      this.emojis,
      this.banner,
      this.ownerID,
      this.applicationID,
      this.region,
      this.afkChannelID,
      this.afkTimeout,
      this.systemChannelID,
      this.widgetEnabled,
      this.widgetChannelID,
      this.verificationLevel,
      this.roles,
      this.defaultMessageNotifications,
      this.mfaLevel,
      this.explicitContentFilter,
      this.maxPresences,
      this.maxMembers,
      this.vanityUrlCode,
      this.premiumTier,
      this.premiumSubscriptionCount,
      this.systemChannelFlags,
      this.preferredLocale,
      this.rulesChannelID,
      this.publicUpdatesChannelID});

  factory Guild.fromJson(Map<String, dynamic> json) {
    return Guild(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      description: json['description'],
      aproxMemberCount: json['approximate_member_count'],
      aproxPresenceCount: json['approximate_presence_count'],
      emojis: json['emojis'],
      banner: json['banner'],
      ownerID: json['owner_id'],
      region: json['region'],
      roles: json['roles'],
      maxMembers: json['max_members'],
      preferredLocale: json['preferred_locale'],
    );
  }
}

Future<Guild> fetchGuild(String token, String guildID) async {
  final qParam = {
    'with_counts?': 'true',
  };
  final response = await http.get(
    Uri.https(
        'www.discord.com', '/api/v7/guilds/' + guildID, qParam),
    headers: {
      'Authorization': 'Bot ' + token,
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Guild.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
