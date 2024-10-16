// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModelServer {
  final String id;
  final Timestamp timestamp;
  final String favoriteCategories;
  ContactModelServer({
    required this.id,
    required this.timestamp,
    required this.favoriteCategories,
  });

  ContactModelServer copyWith({
    String? id,
    Timestamp? timestamp,
    String? favoriteCategories,
  }) {
    return ContactModelServer(
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
      favoriteCategories: favoriteCategories ?? this.favoriteCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'favoriteCategories': favoriteCategories,
    };
  }

  factory ContactModelServer.fromMap(Map<String, dynamic> map) {
    return ContactModelServer(
        id: map['id'] as String,
        timestamp: Timestamp.fromMillisecondsSinceEpoch(map['timestamp']),
        favoriteCategories: map['favoriteCategories'] as String);
  }

  String toJson() => json.encode(toMap());

  factory ContactModelServer.fromJson(String source) =>
      ContactModelServer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ContactModelServer(id: $id, timestamp: $timestamp, favoriteCategories: $favoriteCategories)';
}
