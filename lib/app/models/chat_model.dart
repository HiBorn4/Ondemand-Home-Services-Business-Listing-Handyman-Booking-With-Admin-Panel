// ignore_for_file: override_on_non_overriding_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import "parents/model.dart";
import 'user_model.dart';

class Chat extends Model {
  late String id = UniqueKey().toString();

  // message text
  late String text;

  // time of the message
  late int time;

  // user id who send the message
  late String userId;

  late User user;

  Chat(this.text, this.time, this.userId, this.user);

  Chat.fromDocumentSnapshot(DocumentSnapshot jsonMap) {
    try {
      id = jsonMap.id;
      text = jsonMap.get('text') != null ? jsonMap.get('text').toString() : '';
      time = jsonMap.get('time') != null ? jsonMap.get('time') : 0;
      userId = (jsonMap.get('user') != null
          ? jsonMap.get('user').toString()
          : null)!;
    } catch (e) {
      id = '';
      text = '';
      time = 0;
      user = User();
      userId = '';
      print(e);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["text"] = text;
    map["time"] = time;
    map["user"] = userId;
    return map;
  }

  @override
  bool operator(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Chat &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          text == other.text &&
          time == other.time &&
          userId == other.userId;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      text.hashCode ^
      time.hashCode ^
      userId.hashCode;
}
