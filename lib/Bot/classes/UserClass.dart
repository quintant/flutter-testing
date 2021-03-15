import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';




class User {
  final dynamic id;
  final dynamic username;
  final dynamic discriminator;
  final dynamic avatar;
  final dynamic verified;
  final dynamic email;
  final dynamic flags;
  final dynamic premiumType;
  final dynamic publicFlags;


  User({
    this.id,
    this.username,
    this.discriminator,
    this.avatar,
    this.verified,
    this.email,
    this.flags,
    this.premiumType,
    this.publicFlags
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      discriminator: json['discriminator'],
      avatar: json['avatar'],
      verified: json['verified'],
      email: json['email'],
      flags: json['flags'],
      premiumType: json['premium_type'],
      publicFlags: json['public_flags']
    );
  }
}